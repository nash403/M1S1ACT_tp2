import java.awt.Point;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * Classe representing a Skyline
 * 
 * @author Nintunze Honoré
 * @author Petit Antoine
 */
public class SkyLine {

	private List<Point> line;

	/**
	 * Constructor of Line
	 */
	public SkyLine() {
		super();
		line = new LinkedList<Point>();
	}

	/**
	 * Constructor of Line
	 * 
	 * @param newLine
	 *            the skyline used
	 */
	public SkyLine(final List<Point> newLine) {
		super();
		line = newLine;
	}

	/**
	 * @return the skyLine
	 */
	public final List<Point> getSkyLine() {
		return line;
	}

	/**
	 * @param skyLine
	 *            the skyLine to set
	 */
	public final void setSkyLine(final List<Point> skyLine) {
		this.line = skyLine;
	}

	public void main() {

	}

	static List<Building> buildListBuilding(final Building... buildings) {
		return Arrays.asList(buildings);
	}

	public void printSkyLine() {
		for (Point pt : line)
			System.out.print("(" + pt.x + "," + pt.y + ") ");
		System.out.println("");
	}
	
	public void insertSkylines(final Building building) {
		if (line == null) {
			line = building.toSkyLine();
		}
		else {
			if (building.getRight() < line.get(0).x) {
				//TODO insert d'un building avant la skyline
			} else if (building.getLeft() > line.get(line.size()-1).x) {
				//TODO insert d'un building après la skyline
			} else {
				Iterator<Point> it = line.iterator();				
			}

		}
		
	}

}

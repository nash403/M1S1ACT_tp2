import java.awt.Point;
import java.util.ArrayList;
import java.util.List;

/**
 * Classe representing a building
 * 
 * @author Nintunze Honoré
 * @author Petit Antoine
 *
 */
public class Building {

	/**
	 * Represent the left part of the building
	 */
	private int left;
	
	/**
	 * Represent the height of the building
	 */
	private int height;
	
	/**
	 * Represent the right part of the building
	 */
	private int right;

	/**
	 * @return the left
	 */
	public final int getLeft() {
		return left;
	}

	/**
	 * @param left the left to set
	 */
	public final void setLeft(int left) {
		this.left = left;
	}

	/**
	 * @return the high
	 */
	public final int getHigh() {
		return height;
	}

	/**
	 * @param high the high to set
	 */
	public final void setHigh(int high) {
		this.height = high;
	}

	/**
	 * @return the right
	 */
	public final int getRight() {
		return right;
	}

	/**
	 * @param right the right to set
	 */
	public final void setRight(int right) {
		this.right = right;
	}

	/**
	 * @param left
	 * @param high
	 * @param right
	 */
	public Building(int left, int high, int right) {
		super();
		this.left = left;
		this.height = high;
		this.right = right;
	}
	
	/**
	 * @return the skyline form by the building
	 */
	public List<Point> toSkyLine(){
		final List<Point> line = new ArrayList<Point>();
		line.add(new Point(left,height));
		line.add(new Point(right,0));
		
		return line;
	}
	
}

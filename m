From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Unbalanced of_node_put{get} on initial 'from' node?
Date: Fri, 15 Jul 2011 00:39:58 +0800
Message-ID: <20110714163956.GA1534@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

I'm running into some problem when using of_find_matching_node().
Here is the pseudo code.

void foo(struct platform_device *pdev)
{
	struct device_node *from = pdev->dev.parent->of_node;
	struct device_node *np;

	np = of_find_matching_node(from, matches); /* matches is a global of_match */
	while (np) {
		...... /* do stuff with the node */
		np = of_find_matching_node(np, matches);
	}
}

I found with above function executed that the node 'from'
gets an unbalanced 'of_node_put' call in of_find_matching_node().  Was
of_find_matching_node() designed in this way?  Or should it get
of_node_put{get} on 'from' node balanced?

Using helper macro for_each_matching_node does not run into this
problem, because the initial 'from' node is NULL, which will get
bypassed by of_node_put.

-- 
Regards,
Shawn

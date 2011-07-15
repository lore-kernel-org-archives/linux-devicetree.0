From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Unbalanced of_node_put{get} on initial 'from' node?
Date: Thu, 14 Jul 2011 20:54:15 -0600
Message-ID: <20110715025415.GK2927@ponder.secretlab.ca>
References: <20110714163956.GA1534@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110714163956.GA1534-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2011 at 12:39:58AM +0800, Shawn Guo wrote:
> Hi Grant,
> 
> I'm running into some problem when using of_find_matching_node().
> Here is the pseudo code.
> 
> void foo(struct platform_device *pdev)
> {
> 	struct device_node *from = pdev->dev.parent->of_node;
> 	struct device_node *np;
> 
> 	np = of_find_matching_node(from, matches); /* matches is a global of_match */
> 	while (np) {
> 		...... /* do stuff with the node */
> 		np = of_find_matching_node(np, matches);
> 	}
> }
> 
> I found with above function executed that the node 'from'
> gets an unbalanced 'of_node_put' call in of_find_matching_node().  Was
> of_find_matching_node() designed in this way?  Or should it get
> of_node_put{get} on 'from' node balanced?

Yes it is.  The node returned from of_find_matching node has already
had "of_node_get()" called on it, and the caller is expected to
release it.  So, any node passed into of_find_matching_node() instead
of NULL as the starting point must have already had of_node_get()
called on it.

g.

From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] USB: EHCI: Don't use NO_IRQ in xilinx ehci driver
Date: Fri, 13 Jan 2012 11:39:10 -0700
Message-ID: <20120113183910.GB22767@ponder.secretlab.ca>
References: <Pine.LNX.4.44L0.1201121055370.1384-100000@iolanthe.rowland.org>
 <4F10151A.8000209@petalogix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F10151A.8000209-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2012 at 12:27:22PM +0100, Michal Simek wrote:
> Alan Stern wrote:
> >On Thu, 12 Jan 2012, Michal Simek wrote:
> >
> >>Drivers shouldn't use NO_IRQ. This driver is used
> >>by Microblaze and PPC. PPC defines NO_IRQ as 0
> >>and Microblaze has removed it.
> >>
> >>Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> >>CC: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> >>CC: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
> >>CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >>CC: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >>---
> >> drivers/usb/host/ehci-xilinx-of.c |    2 +-
> >> 1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >>diff --git a/drivers/usb/host/ehci-xilinx-of.c b/drivers/usb/host/ehci-xilinx-of.c
> >>index 32793ce..9c2cc46 100644
> >>--- a/drivers/usb/host/ehci-xilinx-of.c
> >>+++ b/drivers/usb/host/ehci-xilinx-of.c
> >>@@ -183,7 +183,7 @@ static int __devinit ehci_hcd_xilinx_of_probe(struct platform_device *op)
> >> 	}
> >> 	irq = irq_of_parse_and_map(dn, 0);
> >>-	if (irq == NO_IRQ) {
> >>+	if (!irq) {
> >> 		printk(KERN_ERR "%s: irq_of_parse_and_map failed\n", __FILE__);
> >> 		rv = -EBUSY;
> >> 		goto err_irq;
> >
> >Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> 
> Thanks Alan.
> 
> I have seen that Grant sent the same patch to lkml too.
> Here is the thread: http://lkml.org/lkml/2012/1/11/342
> 
> Grant: How fast do you think you are able to merge your patches?

Ignore my patch.  It won't go in until 3.4

g.

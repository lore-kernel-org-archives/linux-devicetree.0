From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCHv2 3/3] picoxcell: add the DTS for the PC7302 board
Date: Fri, 23 Sep 2011 12:48:58 +1000
Message-ID: <1316746138.2629.6.camel@pasglop>
References: <1314196906-20709-1-git-send-email-jamie@jamieiles.com>
	<1314196906-20709-4-git-send-email-jamie@jamieiles.com>
	<1316086322.2602.1.camel@pasglop>
	<20110915121512.GG3089@pulham.picochip.com>
	<CAGsJ_4wniCS+85Hs7-vbaUyEL-yKEBnbgDOFPm0+THh6PMfCdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAGsJ_4wniCS+85Hs7-vbaUyEL-yKEBnbgDOFPm0+THh6PMfCdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2011-09-23 at 10:31 +0800, Barry Song wrote:
> 2011/9/15 Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>:
> > On Thu, Sep 15, 2011 at 08:32:02AM -0300, Benjamin Herrenschmidt wrote:
> >> On Wed, 2011-08-24 at 15:41 +0100, Jamie Iles wrote:
> >>
> >> > +   chosen {
> >> > +           bootargs = "console=ttyS0,115200 earlyprintk loglevel=9 root=ubi0:rootfs rw rootfstype=ubifs ubi.mtd=5,2048";
> >> > +           linux,stdout-path = &uart0;
> >> > +   };
> >>
> >> Hrm... we don't normally put the bootargs in the device-tree.
> >>
> >> Either you have a way to pass it from a previous firmware (which
> >> can then slap it into the device-tree at runtime), or you
> >> can have a way to compile it in the kernel image but the device-tree
> >> isn't the right place for it.
> >
> > OK, that's fair enough.  A few other ARM platforms (tegra, prima2 and
> > zynq) have bootargs in the chosen node and that's where I got it from,
> > but our bootloader has fdt support so this can easily be removed.
> 
> some powerpc platforms also do that:

Right, I never said I was perfect :-)

> asp834x-redboot.dts:		bootargs = "console=ttyS0,38400
> root=/dev/mtdblock3 rootfstype=jffs2";
> gamecube.dts:		bootargs = "root=/dev/gcnsda2 rootwait udbg-immortal";
> prpmc2800.dts:		bootargs = "ip=on";
> rainier.dts:		bootargs = "console=ttyS0,115200";
> sequoia.dts:		bootargs = "console=ttyS0,115200";
> virtex440-ml507.dts:		bootargs = "console=ttyS0 root=/dev/ram";
> virtex440-ml510.dts:		bootargs = "console=ttyS0 root=/dev/ram";
> wii.dts:		bootargs = "root=/dev/mmcblk0p2 rootwait udbg-immortal";
> 
> if we have no bootargs in bootloader, kernel will use that one in DT.

Cheers,
Ben.

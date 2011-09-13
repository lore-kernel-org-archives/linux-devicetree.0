From: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 06/24] C6X: devicetree
Date: Tue, 13 Sep 2011 18:26:03 -0400
Message-ID: <1315952764.11280.49.camel@deneb.redhat.com>
References: <1314826019-22330-1-git-send-email-msalter@redhat.com>
	<6360771.ouEC5EKNMR@wuerfel>
	<1315917546.11280.38.camel@deneb.redhat.com>
	<201109131733.59700.arnd@arndb.de>
	<CACxGe6tVafwVN6vdU7sCxL5JM7+as0bp_AaHaGAyE9+eTgR5Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6tVafwVN6vdU7sCxL5JM7+as0bp_AaHaGAyE9+eTgR5Tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2011-09-13 at 11:54 -0600, Grant Likely wrote:
> On Tue, Sep 13, 2011 at 9:33 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Tuesday 13 September 2011, Mark Salter wrote:
> >> On Tue, 2011-09-13 at 08:43 +0200, Arnd Bergmann wrote:
> >> > Are these instructions specific to the interrupt controller or
> >> > do they access a register space that can contain arbitrary
> >> > devices?
> >> >
> >> > If there is a separate address space for special devices, it might
> >> > be good to describe that in the device tree, like we do for PCI
> >> > I/O space.
> >> >
> >>
> >> It is a core register area. Similar to ARM or MIPS coprocessor
> >> registers.
> >
> > I guess it still depends, it's probably a grey area. If the register layout
> > is the same on all c6x cores and it's only for core stuff, there is no need
> > to put it in the device tree. If you have multiple soc (off-core) devices
> > being controlled through the registers, or the numbers vary a lot between
> > different chips, I would put all of them into the device tree.
> 
> It's an interrupt controller.  There still needs to be a node to act
> as the interrupt-parent and specify #interrupt-cells.

It already has that. But maybe that node should be moved into the cpu
node.

--Mark

From: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 06/24] C6X: devicetree
Date: Tue, 13 Sep 2011 08:39:04 -0400
Message-ID: <1315917546.11280.38.camel@deneb.redhat.com>
References: <1314826019-22330-1-git-send-email-msalter@redhat.com>
	<20110912201102.GF23345@ponder.secretlab.ca>
	<1315869636.11280.26.camel@deneb.redhat.com>
	<6360771.ouEC5EKNMR@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <6360771.ouEC5EKNMR@wuerfel>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2011-09-13 at 08:43 +0200, Arnd Bergmann wrote:
> On Monday 12 September 2011 19:20:35 Mark Salter wrote:
> > On Mon, 2011-09-12 at 14:11 -0600, Grant Likely wrote:
> > > On Wed, Aug 31, 2011 at 05:26:41PM -0400, Mark Salter wrote:
> > > > +           interrupt-controller;
> > > > +           #interrupt-cells = <1>;
> > > > +           compatible = "ti,c64x+core-pic";
> > > 
> > > The interrupt controller isn't addressable?  Is it integrated into
> > > the CPU?
> > 
> > Yes, that core controller is controlled through registers accessed
> > with special-purpose instructions, not MMIO. Other controllers, like
> > megamodule and some as-yet unimplemented use MMIO.
> 
> Are these instructions specific to the interrupt controller or
> do they access a register space that can contain arbitrary
> devices?
> 
> If there is a separate address space for special devices, it might
> be good to describe that in the device tree, like we do for PCI
> I/O space.
> 

It is a core register area. Similar to ARM or MIPS coprocessor
registers.

--Mark

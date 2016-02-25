From: Tim Sander <tim-cVflAIDvGO/+u4ArqExSyQ@public.gmane.org>
Subject: Re: [PATCH v2] dts: add specific compatible type for Terasic DE0-NANO-SoC Board
Date: Fri, 26 Feb 2016 00:34:59 +0100
Message-ID: <1595377.ZIYnBnVf5Q@virgo>
References: <8416439.76b9YNhpgR@dabox> <20160225103820.GB747@pengutronix.de> <56CF323C.90202@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56CF323C.90202-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dinh

On Thursday 25 February 2016 10:56:28 Dinh Nguyen wrote:
> On 02/25/2016 04:38 AM, Steffen Trumtrar wrote:
> > Hi Tim!
> > 
> > On Thu, Feb 25, 2016 at 11:05:05AM +0100, Tim Sander wrote:
> >> From: Tim Sander <tim-cVflAIDvGO/+u4ArqExSyQ@public.gmane.org>
> >> 
> >> Add a more specific compatible string:"terasic,de0-nano-soc" for
> >> respective board. Background: when checking for bootspec entries, some
> >> board specific fixups are not apropriate for board of the same platform
> >> ("altr,socfpga-cyclone5"). The same aproach is taken with the
> >> EBV-Socrates board.
> >> 
> >> Signed-off-by: Tim Sander <tim-cVflAIDvGO/+u4ArqExSyQ@public.gmane.org>
> >> ---
> >> 
> >>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >>  arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts     | 2 +-
> >>  2 files changed, 2 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> >> 72e2c5a..d1f7803 100644
> >> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> @@ -230,6 +230,7 @@ synology	Synology, Inc.
> >> 
> >>  tbs	TBS Technologies
> >>  tcl	Toby Churchill Ltd.
> >>  technologic	Technologic Systems
> >> 
> >> +terasic	Terasic Inc.
> >> 
> >>  thine	THine Electronics, Inc.
> >>  ti	Texas Instruments
> >>  tlm	Trusted Logic Mobility
> > 
> > You should IMHO split this up in two patches.
> > First patch: add terasic
> 
> That's right. That patch will go through the DTS maintainer's tree.
Ah well for such a simple patch it turns out more complicated than thought :-)
Will do as soon as there is agreement on a name which does not seem that 
easy...
> 
> >> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
> >> b/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts index
> >> afea364..704aa9d 100644
> >> --- a/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
> >> +++ b/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts
> >> @@ -18,7 +18,7 @@
> >> 
> >>  / {
> >>  
> >>  	model = "Terasic DE-0(Atlas)";
> >> 
> >> -	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
> >> +	compatible = "terasic,de0-nano-soc","altr,socfpga-cyclone5",
> >> "altr,socfpga";
> So perhaps, "terasic,de0-sockit"?
> 
> > Second patch: this.
> 
> And I can take this one.
> 
> >>  	chosen {
> >>  	
> >>  		bootargs = "earlyprintk";
> > 
> > The naming of this board still confuses me though.
> > 
> > It has 3 different names now:
> > 	- de0_sockit.dts
> > 	- Terasic DE-0(Atlas)
> > 	- de0-nano-soc
> > 
> > And according to Terasic DE0-Nano-SoC is the same as Atlas-SoC with a
> > different software?! So all three names are actually correct ?! Weird.
> 
> I had a hard time understanding this myself. But from what I gather
> from[1], I just name the file de0_sockit.
As far as i remember there are different de0 and different sockit boards, so 
the name does not seem to be as concise? I don't care but i would say that
de0-nano-soc is the most concise and easier to search for than atlas which
might turn up more false postives?

But as long as there is a more selective name than cyclone5 everthing is fine
with me.

Best regards
Tim

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

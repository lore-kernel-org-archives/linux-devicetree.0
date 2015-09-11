From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 7/9] ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
Date: Fri, 11 Sep 2015 17:48:22 +0100
Message-ID: <20150911164822.GA1150@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-8-git-send-email-peter.griffin@linaro.org>
 <20150911162749.GD18779@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150911162749.GD18779@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Fri, 11 Sep 2015, Lee Jones wrote:

> On Fri, 11 Sep 2015, Peter Griffin wrote:
> 
> > These nodes are required to get the fdma driver working
> > on STiH407 based silicon.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/stih407-family.dtsi | 51 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> > index 838b812..da07474b 100644
> > --- a/arch/arm/boot/dts/stih407-family.dtsi
> > +++ b/arch/arm/boot/dts/stih407-family.dtsi
> > @@ -565,5 +565,56 @@
> >  						  <&phy_port2 PHY_TYPE_USB3>;
> >  			};
> >  		};
> > +
> > +		fdma0: fdma0-audio@8e20000 {
> 
> I'm not familiar with the FDMA driver, so can't comment knowledgeably,
> but the <dev> part of <dev>@<base_address> should only describe the
> type of hardware.  I believe in this case it should just be
> dma@08e20000.  Also notice the leading zero in the address, which I
> believe mitigates possible confusion.  Then you be more specific with
> the label, so something like 'fdma-audio' seems appropriate here.

Ok, can change to that format in v3.

> 
> > +			compatible = "st,stih407-fdma-mpe31";
> > +			reg = <0x8e20000 0x20000>;
> 
> I personally find padding up to 32bits helpful in the addresses.

None of the stih407-family nodes I can see have this padding, including
the ones merged by you.

> 
> > +			interrupts = <GIC_SPI 5 IRQ_TYPE_NONE>;
> > +			dma-channels = <16>;
> > +			#dma-cells = <3>;
> > +			st,fdma-id = <0>;
> 
> We usually shy away from ID properties.  What is it required for in
> this case?

Yes Rob did already mention that over here, see my reply at the bottom
http://www.spinics.net/lists/devicetree/msg92529.html.

However I can't think of any other useful properties we could add
to derive this information. The fdma controller number is used
by the driver to generate a unique firmware filename.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

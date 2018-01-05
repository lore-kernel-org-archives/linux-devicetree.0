From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 06/11] dt-bindings: display: sun4i-drm: Add
 A83T HDMI pipeline
Date: Fri, 05 Jan 2018 10:50:40 +0800
Message-ID: <A6B18BA1-5B45-4C8D-9C72-082098C92BA8@aosc.io>
References: <20171230210203.24115-1-jernej.skrabec@siol.net> <20171230210203.24115-7-jernej.skrabec@siol.net> <20180103202154.eeajt3234w3adqjq@rob-hp-laptop> <1645801.yZU0HLsLbk@jernej-laptop>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBJWQXPJAKGQEQFCA7IA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1645801.yZU0HLsLbk@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B41=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=885:3=
2:26, "Jernej =C5=A0krabec" <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi Rob,
>
>Dne sreda, 03. januar 2018 ob 21:21:54 CET je Rob Herring napisal(a):
>> On Sat, Dec 30, 2017 at 10:01:58PM +0100, Jernej Skrabec wrote:
>> > This commit adds all necessary compatibles and descriptions needed
>to
>> > implement A83T HDMI pipeline.
>> >=20
>> > Mixer is already properly described, so only compatible is added.
>> >=20
>> > However, A83T TCON1, which is connected to HDMI, doesn't have
>channel 0,
>> > contrary to all TCONs currently described. Because of that, TCON
>> > documentation is extended.
>> >=20
>> > A83T features Synopsys DW HDMI controller with a custom PHY which
>looks
>> > like Synopsys Gen2 PHY with few additions. Since there is no
>> > documentation, needed properties were found out through
>experimentation
>> > and reading BSP code.
>> >=20
>> > At the end, example is added for newer SoCs, which features DE2 and
>DW
>> > HDMI.
>> >=20
>> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>> > ---
>> >=20
>> >  .../bindings/display/sunxi/sun4i-drm.txt           | 188
>> >  ++++++++++++++++++++- 1 file changed, 181 insertions(+), 7
>deletions(-)
>> >=20
>> > diff --git
>a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>index
>> > 9f073af4c711..3eca258096a5 100644
>> > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> >=20
>> > @@ -64,6 +64,40 @@ Required properties:
>> >      first port should be the input endpoint. The second should be
>the
>> >      output, usually to an HDMI connector.
>> >=20
>> > +DWC HDMI TX Encoder
>> > +-----------------------------
>> > +
>> > +The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX
>controller IP
>> > +with Allwinner's own PHY IP. It supports audio and video outputs
>and CEC.
>> > +
>> > +These DT bindings follow the Synopsys DWC HDMI TX bindings defined
>in
>> > +Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with
>the
>> > +following device-specific properties.
>> > +
>> > +Required properties:
>> > +
>> > +  - compatible: value must be one of:
>> > +    * "allwinner,sun8i-a83t-dw-hdmi"
>> > +  - reg: two pairs of base address and size of memory-mapped
>region,
>> > first
>> > +    for controller and second for PHY
>> > +    registers.
>>=20
>> Seems like the phy should be a separate node and use the phy binding.
>> You can use the phy binding even if you don't use the kernel phy
>> framework...
>
>Unfortunately, it's not so straighforward. Phy is actually accessed
>through=20
>I2C implemented in HDMI controller. Second memory region in this case
>has=20
>small influence on phy. However, it has big influence on controller.

To be honest you used inaccurate word. Use "glue" directly
here may be more accurate.

>For=20
>example, magic number has to be written in one register in second
>memory=20
>region in order to unlock read access to any register from first memory
>region=20
>(controller). However, they shouldn't be merged to one region, because
>first=20
>memory region requires byte access while second memory region can be
>accessed=20
>per byte or word.
>
>To complicate things more, later I want to add support for another SoC
>which=20
>has same glue layer (unlocking read access, etc.) and uses memory
>mapped phy=20
>registers in second memory region.
>
>I think current binding is the least complicated way to represent this.
>
>>=20
>> > +  - reg-io-width: See dw_hdmi.txt. Shall be 1.
>> > +  - interrupts: HDMI interrupt number
>> > +  - clocks: phandles to the clocks feeding the HDMI encoder
>> > +    * iahb: the HDMI bus clock
>> > +    * isfr: the HDMI register clock
>> > +    * tmds: the HDMI tmds clock
>> > +  - clock-names: the clock names mentioned above
>> > +  - resets: phandles to the reset controllers driving the encoder
>> > +    * ctrl: the reset line for the controller
>> > +    * phy: the reset line for the PHY
>> > +  - reset-names: the reset names mentioned above
>> > +
>> > +  - ports: A ports node with endpoint definitions as defined in
>> > +    Documentation/devicetree/bindings/media/video-interfaces.txt.
>The
>> > +    first port should be the input endpoint. The second should be
>the
>> > +    output, usually to an HDMI connector.
>> > +
>> >=20
>> >  TV Encoder
>> >  ----------
>> >=20
>> > @@ -94,18 +128,17 @@ Required properties:
>> >     * allwinner,sun7i-a20-tcon
>> >     * allwinner,sun8i-a33-tcon
>> >     * allwinner,sun8i-a83t-tcon-lcd
>> >=20
>> > +   * allwinner,sun8i-a83t-tcon-tv
>> >=20
>> >     * allwinner,sun8i-v3s-tcon
>> >  =20
>> >   - reg: base address and size of memory-mapped region
>> >   - interrupts: interrupt associated to this IP
>> >=20
>> > - - clocks: phandles to the clocks feeding the TCON. Three are
>needed:
>> >=20
>> > + - clocks: phandles to the clocks feeding the TCON. One is needed:
>> >     - 'ahb': the interface clocks
>> >=20
>> > -   - 'tcon-ch0': The clock driving the TCON channel 0
>> >=20
>> >   - resets: phandles to the reset controllers driving the encoder
>> >  =20
>> >     - "lcd": the reset line for the TCON channel 0
>> >  =20
>> >   - clock-names: the clock names mentioned above
>> >   - reset-names: the reset names mentioned above
>> >=20
>> > - - clock-output-names: Name of the pixel clock created
>> >=20
>> >  - ports: A ports node with endpoint definitions as defined in
>> > =20
>> >    Documentation/devicetree/bindings/media/video-interfaces.txt.
>The
>> >=20
>> > @@ -119,11 +152,31 @@ Required properties:
>> >    channel the endpoint is associated to. If that property is not
>> >    present, the endpoint number will be used as the channel number.
>> >=20
>> > -On SoCs other than the A33 and V3s, there is one more clock
>required:
>> > +Following compatibles:
>> > + * allwinner,sun4i-a10-tcon
>> > + * allwinner,sun5i-a13-tcon
>> > + * allwinner,sun6i-a31-tcon
>> > + * allwinner,sun6i-a31s-tcon
>> > + * allwinner,sun7i-a20-tcon
>> > + * allwinner,sun8i-a33-tcon
>> > + * allwinner,sun8i-a83t-tcon-lcd
>> > + * allwinner,sun8i-v3s-tcon
>> > +have additional required properties:
>> > + - 'tcon-ch0': The clock driving the TCON channel 0
>>=20
>> tcon-ch0 is a clock name, not a property.
>
>right.
>
>Best regards,
>Jernej
>
>
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

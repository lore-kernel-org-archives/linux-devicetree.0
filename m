From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH 06/11] dt-bindings: display: sun4i-drm:
 Add A83T HDMI pipeline
Date: Fri, 05 Jan 2018 07:20:46 +0100
Message-ID: <2801449.XnWJ1iOJse@jernej-laptop>
References: <20171230210203.24115-1-jernej.skrabec@siol.net> <20180104185210.afsvsofq7q35psa6@flea.lan> <4B652FB5-08B2-416B-ABA9-08E12112087D@aosc.io>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBRNSXTJAKGQE2YJYTLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4B652FB5-08B2-416B-ABA9-08E12112087D-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Dne petek, 05. januar 2018 ob 03:49:09 CET je Icenowy Zheng napisal(a):
> =E4=BA=8E 2018=E5=B9=B41=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882=
:52:10, Maxime Ripard <maxime.ripard@free-
electrons.com> =E5=86=99=E5=88=B0:
> >On Wed, Jan 03, 2018 at 10:32:26PM +0100, Jernej =C5=A0krabec wrote:
> >> Hi Rob,
> >>=20
> >> Dne sreda, 03. januar 2018 ob 21:21:54 CET je Rob Herring napisal(a):
> >> > On Sat, Dec 30, 2017 at 10:01:58PM +0100, Jernej Skrabec wrote:
> >> > > This commit adds all necessary compatibles and descriptions
> >
> >needed to
> >
> >> > > implement A83T HDMI pipeline.
> >> > >=20
> >> > > Mixer is already properly described, so only compatible is added.
> >> > >=20
> >> > > However, A83T TCON1, which is connected to HDMI, doesn't have
> >
> >channel 0,
> >
> >> > > contrary to all TCONs currently described. Because of that, TCON
> >> > > documentation is extended.
> >> > >=20
> >> > > A83T features Synopsys DW HDMI controller with a custom PHY which
> >
> >looks
> >
> >> > > like Synopsys Gen2 PHY with few additions. Since there is no
> >> > > documentation, needed properties were found out through
> >
> >experimentation
> >
> >> > > and reading BSP code.
> >> > >=20
> >> > > At the end, example is added for newer SoCs, which features DE2
> >
> >and DW
> >
> >> > > HDMI.
> >> > >=20
> >> > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >> > > ---
> >> > >=20
> >> > >  .../bindings/display/sunxi/sun4i-drm.txt           | 188
> >> > >  ++++++++++++++++++++- 1 file changed, 181 insertions(+), 7
> >
> >deletions(-)
> >
> >> > > diff --git
> >
> >a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> >
> >> > > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> >
> >index
> >
> >> > > 9f073af4c711..3eca258096a5 100644
> >> > > ---
> >
> >a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> >
> >> > > +++
> >
> >b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> >
> >> > > @@ -64,6 +64,40 @@ Required properties:
> >> > >      first port should be the input endpoint. The second should
> >
> >be the
> >
> >> > >      output, usually to an HDMI connector.
> >> > >=20
> >> > > +DWC HDMI TX Encoder
> >> > > +-----------------------------
> >> > > +
> >> > > +The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX
> >
> >controller IP
> >
> >> > > +with Allwinner's own PHY IP. It supports audio and video outputs
> >
> >and CEC.
> >
> >> > > +
> >> > > +These DT bindings follow the Synopsys DWC HDMI TX bindings
> >
> >defined in
> >
> >> > > +Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
> >
> >with the
> >
> >> > > +following device-specific properties.
> >> > > +
> >> > > +Required properties:
> >> > > +
> >> > > +  - compatible: value must be one of:
> >> > > +    * "allwinner,sun8i-a83t-dw-hdmi"
> >> > > +  - reg: two pairs of base address and size of memory-mapped
> >
> >region,
> >
> >> > > first
> >> > > +    for controller and second for PHY
> >> > > +    registers.
> >> >=20
> >> > Seems like the phy should be a separate node and use the phy
> >
> >binding.
> >
> >> > You can use the phy binding even if you don't use the kernel phy
> >> > framework...
> >>=20
> >> Unfortunately, it's not so straighforward. Phy is actually accessed
> >
> >through
> >
> >> I2C implemented in HDMI controller. Second memory region in this case
> >
> >has
> >
> >> small influence on phy. However, it has big influence on controller.
> >
> >For
> >
> >> example, magic number has to be written in one register in second
> >
> >memory
> >
> >> region in order to unlock read access to any register from first
> >
> >memory region
> >
> >> (controller). However, they shouldn't be merged to one region,
> >
> >because first
> >
> >> memory region requires byte access while second memory region can be
> >
> >accessed
> >
> >> per byte or word.
> >>=20
> >> To complicate things more, later I want to add support for another
> >
> >SoC which
> >
> >> has same glue layer (unlocking read access, etc.) and uses memory
> >
> >mapped phy
> >
> >> registers in second memory region.
> >>=20
> >> I think current binding is the least complicated way to represent
> >
> >this.
> >
> >I agree with Rob here. I did a similar thing for the DSI patches I've
> >sent a few monthes ago and it turned out to not be that difficult, so
> >I'm sure you can come up with something :)
>=20
> In A83T/H3/A64/H5/R40 this part is not purely a PHY.
> It controls the access of main controller's register (e.g. read/write
> lock and register obfuscation). So it should be called a "glue"
> with PHY part (and on A83T seems a pure glue) but not a simple
>  PHY.

It's not so simple. Actually it has PHY settings also on A83T. For example,=
=20
value at 0x01EF0001 depends on polarity. Value at 0x01EF0002 sets PHY I2C=
=20
address. Bit 7 at 0x01EF0007 enables/disables external resistor. That is in=
fo=20
I discovered/received after I sent patches, so it's not cleary marked.

Proper memory map (starts at 0x01EE0000):
0x00000 - 0x10000 -> DW HDMI controller
0x10000 - 0x10010 -> (almost?) Common PHY settings
0x10010 - 0x10020 -> Allwinner proprietary glue layer
0x10020 - 0x10040 -> Allwinner proprietary PHY (not present on A83T)

In preliminary PHY doc AW released, there are additional regs at 0x01EF0FF8=
=20
and 0x01EF0FFC for controller ID and phy ID, but it was always 0 at A83T an=
d=20
H3.

So splitting memory in so many regions just to satisfy clean division it=20
doesn't seem sane to me. Now that I checked how Maxime did it with MIPI DSI=
=20
driver, I'm good with dividing it into two parts.

Best regards,
Jernej


>=20
> >Maxime
> >
> >--
> >Maxime Ripard, Free Electrons
> >Embedded Linux and Kernel engineering
> >http://free-electrons.com
> >
> >_______________________________________________
> >linux-arm-kernel mailing list
> >linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group. To unsubscribe from this group and stop receiving
> emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org=
.
> For more options, visit https://groups.google.com/d/optout.




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

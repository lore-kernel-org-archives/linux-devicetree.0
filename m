From: Shirish S <shirish@chromium.org>
Subject: Re: [PATCH 3/3] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Mon, 28 Oct 2013 15:45:00 +0530
Message-ID: <CAHvYUDDoP=Q=1dyN4xBWTaATF9KgZhWypo1mX7uRww2Oc28yQA@mail.gmail.com>
References: <1382941462-6691-1-git-send-email-s.shirish@samsung.com>
	<1382941462-6691-4-git-send-email-s.shirish@samsung.com>
	<20131028065006.GA3065@kartoffel>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0438057997=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20131028065006.GA3065@kartoffel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shirish S <s.shirish@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

--===============0438057997==
Content-Type: multipart/alternative; boundary=047d7b5d58a268d61304e9ca5f79

--047d7b5d58a268d61304e9ca5f79
Content-Type: text/plain; charset=ISO-8859-1

Hi Mark,
Firstly thanks for reviewing.


On Mon, Oct 28, 2013 at 12:20 PM, Mark Rutland <mark.rutland@arm.com> wrote:

> Hi,
>
> On Mon, Oct 28, 2013 at 06:24:22AM +0000, Shirish S wrote:
> > This patch adds dt support to hdmiphy config settings
> > as it is board specific and depends on the signal pattern
> > of board.
> >
> > Signed-off-by: Shirish S <s.shirish@samsung.com>
> > ---
> >  .../devicetree/bindings/video/exynos_hdmi.txt      |   29 ++++++++
> >  arch/arm/boot/dts/exynos5250-arndale.dts           |    6 +-
> >  drivers/gpu/drm/exynos/exynos_hdmi.c               |   70
> ++++++++++++++++++--
> >  3 files changed, 98 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > index 323983b..770f92d 100644
> > --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> > @@ -13,6 +13,27 @@ Required properties:
> >       b) pin number within the gpio controller.
> >       c) optional flags and pull up/down.
> >
> > +- hdmiphy-confs: following information about the hdmiphy conf settings.
>
> Judging by the other patches, this is a node, not a property.
>
> Yes its a node.

> > +        a) "nr-confs" specifies the number of pixel clocks supported.
>
> Why is this needed? Someone will get it wrong eventually and it can be
> figured
> out currently by counting the child nodes, testing if they have the
> appropriate
> properties.
>
> Actually i need to get the array size also from dt, hence this is approach
i have taken

> > +     b) "confX: confX" specifies the phy configuration settings,
>
> This is confusing. What is X?
>
> I am trying to generalize, here X means any numerical, and the programmer
needs to
make sure conf0:conf0, wherein X is 0.I shall provide the values permitted
for X in my next patch set.

> The label is irrelevant -- none of this patch looks for phandles pointing
> at
> configurations, nor is the precise name of the label important.
>
> This is a node, not a property.
>
> Ideally every conf<numerical value>  a combination of pixel clock and new
values for data and clock level.

> > +             "clock-frequency" specifies the pixel clock
>
> Is this a frequency to configure the pixel clock with, or the
> pre-determined
> frequency of a clock that we will select?
>
> No, as the explanation suggests its the pixel clock itself.

> > +             "con-de-emphasis-level" specifies the configuration
> > +             of Data De-emphasis levels.
>
> Please explain _why_ we need this configuration.
>
> Our chipset to undergo HDMI compliance test and noticed that the HDMI
Compliance Test id 7-10 was failing
for eye diagram test. Hence on further analysis, it was found that altering
the data de-emphasis levels and clock
level are required to pass the test.And also these values may vary for
variuos board revisons, this is the purpose of this whole patch set.

> Also, "con" is not a good abbreviation of "configuration", "config" would
> be
> preferable.
>
> Agreed, will update the same in next patch set.

> > +                     0x145D0040h[3:0] permitted values:
> > +                             0000 means 760 mVdiff && 1111 means 1400
> mVdiff
>
> I assume the 'h' suffix is a redundant description that the constant is
> hexadecimal. Please drop it.
>
> Agreed, will update the same in next patch set.

> What is 0x145D0040? The address of the register, or its value?
>
> Its the address of the hdmiphy register for data level configuration.


> The description is confusing, 0x145D0040h[3:0] is always 0[3:0].
>
> This description is extracted from the one specified in manual, in my
first patch set the reviewers had asked me
to provide the explaination for every bit, which i have provided.

> Why does this need to be the exact value programmed into the register
> rather
> than separate values the driver can compose?
>
> As mentioned above the value is must for clearing the test 7-10, and also
its derived by a trial and error method
with the HDMI analyser.

> > +                     0x145D0040h[7:4] permitted values:
> > +                             000     0dB
> > +                             0001    -0.25dB
> > +                             0010    -0.7dB
> > +                             0011    -1.15dB
> > +                             1111    -7.45dB
>
> Again, this seems very odd. Why this format?
>
> This binary translation of what the bits actually mean.In the final result
it was found that at 0.7dB there is no noise in the output.

> > +             "con-clock-level" specifies the configuration for
> > +             the corresponding clock level.
>
> To repeat my comment on "con-de-emphasis-level", "con" is not a good
> abbreviation for "configuration".
>
> Agreed, will update the same in next patch set.

> > +                     0x145D005Ch [1:0] permitted values:
> > +                             00 means 0 mVdiff && 11 means 60 mVdiff
> > +                     0x145D005Ch [7:3] permitted values:
> > +                             00000 is 790 mVdiff
> > +                             11111 is 1430 mVdiff
>
> Please explain why we must use this exact format rather than one which may
> be
> understood more easily.
>
> I hope by now have made this point clear!

> >  Example:
> >
> >       hdmi {
> > @@ -20,4 +41,12 @@ Example:
> >               reg = <0x14530000 0x100000>;
> >               interrupts = <0 95 0>;
> >               hpd-gpio = <&gpx3 7 1>;
> > +             hdmiphy-confs {
> > +                     nr-confs = <1>;
> > +                     conf0: conf0 {
> > +                             clock-frequency = <25200000>;
> > +                             conf-de-emphasis-level =  /bits/ 8 <0x26>;
> > +                             conf-clock-level =  /bits/ 8 < 0x66>;
>
> Why are these 8-bit? That wasn't described in the binding at all so far.
>
> These are 8 bit by design(as mentioned in the manual) and were not part of
device tree to be explained before.

> > +                     };
> > +             }
> >       };
> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> b/arch/arm/boot/dts/exynos5250-arndale.dts
> > index c23f16b..436b75a 100644
> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> > @@ -424,6 +424,9 @@
> >
> >       hdmi {
> >               hpd-gpio = <&gpx3 7 2>;
> > +             vdd_osc-supply = <&ldo10_reg>;
> > +             vdd_pll-supply = <&ldo8_reg>;
> > +             vdd-supply = <&ldo8_reg>;
> >               hdmiphy-confs {
> >                       nr-confs = <13>;
> >                       conf0: conf0 {
> > @@ -492,9 +495,6 @@
> >                               conf-clock-level =  /bits/ 8 < 0x66>;
> >                       };
> >               };
> > -             vdd_osc-supply = <&ldo10_reg>;
> > -             vdd_pll-supply = <&ldo8_reg>;
> > -             vdd-supply = <&ldo8_reg>;
> >       };
> >
> >       mmc_reg: voltage-regulator {
>
> Why is this moving? It in no way relates to the rest of the patch, and
> wasn't
> described in the commit message.
>
> Oops that was supposed to be part of previous pach,will update it.

> [...]
>
> > +static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,
> > +                                             struct hdmi_context *hdata)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct device_node *dev_np = dev->of_node;
> > +     struct device_node *phy_conf, *cfg_np;
> > +     int i = 0;
> > +
> > +     phy_conf = of_find_node_by_name(dev_np, "hdmiphy-confs");
> > +     if (phy_conf == NULL) {
> > +             DRM_ERROR("Did not find hdmiphy_conf node\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     of_property_read_u32(phy_conf, "nr-confs", &hdata->nr_confs);
>
> This can fail, returning an error code. Either check it, or remove this
> property entirely and do this based on the number of children which have
> the
> appropriate properties.
>
> Ok will add a check.

> > +     hdata->confs = kzalloc((hdata->nr_confs * sizeof
> > +                                     (struct hdmiphy_config)),
> GFP_KERNEL);
>
> Why the brackets on the first argument of kzalloc? They're superfluous.
>
> What if kzalloc fails?
>
> Ok, will put a check.

> > +
> > +     /* Initialize with default config */
> > +     hdata->confs = hdmiphy_v14_configs;
> > +
> > +     for_each_child_of_node(phy_conf, cfg_np) {
>
> What if nr-confs is smaller than the number of child nodes?
>
> it basically is the array size and it should be 1 + child nodes as
mentioned in the descriptions, i
assume that the programmer takes care of it.

> > +             if (!of_find_property(cfg_np, "clock-frequency", NULL))
> > +                     continue;
> > +
> > +             if (of_property_read_u32_array(cfg_np, "clock-frequency",
> > +                                     (u32 *)&hdata->confs[i].
> > +                                                     pixel_clock, 1)) {
>
> Don't split &hdata->confs[i].pixel_clock over two lines.
>
> Why is the cast necessary?
>
> Why not just of_property_read_u32? This only ever has a single value, and
> while
> there's no of_property_read_u8, of_property_read_u32 exists.
>
> Ok, agreed.

> > +                             DRM_ERROR("Failed to get pixel clock\n");
> > +                             return -EINVAL;
> > +             }
> > +
> > +             /* Overwrite the data de-emphasis and data level */
> > +             if (of_property_read_u8_array(cfg_np,
> "conf-de-emphasis-level",
> > +                                     (u8 *)&hdata->confs[i].conf[16],
> 1)) {
>
> Why is this cast necessary?
>
> I don't see why this must be an 8 bit property.
>
> As mentioned earlier its by design 8 bits.

> > +                             DRM_ERROR("Failed to get conf\n");
> > +                             return -EINVAL;
> > +             }
> > +             /* Overwrite the clock level diff */
> > +             if (of_property_read_u8_array(cfg_np, "conf-clock-level",
> > +                                     (u8 *)&hdata->confs[i].conf[23],
> 1)) {
>
> Why the cast?
>
> Same explaination as above.

> Thanks,
> Mark.
>
Thanks,
Shirish S

--047d7b5d58a268d61304e9ca5f79
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mark,<div>Firstly thanks for reviewing.<br><div class=
=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, Oct 28, 2013 at=
 12:20 PM, Mark Rutland <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.rutlan=
d@arm.com" target=3D"_blank">mark.rutland@arm.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Hi,<br>
<div class=3D"im"><br>
On Mon, Oct 28, 2013 at 06:24:22AM +0000, Shirish S wrote:<br>
&gt; This patch adds dt support to hdmiphy config settings<br>
&gt; as it is board specific and depends on the signal pattern<br>
&gt; of board.<br>
&gt;<br>
&gt; Signed-off-by: Shirish S &lt;<a href=3D"mailto:s.shirish@samsung.com">=
s.shirish@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../devicetree/bindings/video/exynos_hdmi.txt =A0 =A0 =A0| =A0 29 +=
+++++++<br>
&gt; =A0arch/arm/boot/dts/exynos5250-arndale.dts =A0 =A0 =A0 =A0 =A0 | =A0 =
=A06 +-<br>
&gt; =A0drivers/gpu/drm/exynos/exynos_hdmi.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 70 ++++++++++++++++++--<br>
&gt; =A03 files changed, 98 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b=
/Documentation/devicetree/bindings/video/exynos_hdmi.txt<br>
&gt; index 323983b..770f92d 100644<br>
&gt; --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt<br>
&gt; +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt<br>
&gt; @@ -13,6 +13,27 @@ Required properties:<br>
&gt; =A0 =A0 =A0 b) pin number within the gpio controller.<br>
&gt; =A0 =A0 =A0 c) optional flags and pull up/down.<br>
&gt;<br>
&gt; +- hdmiphy-confs: following information about the hdmiphy conf setting=
s.<br>
<br>
</div>Judging by the other patches, this is a node, not a property.<br>
<div class=3D"im"><br></div></blockquote><div style>Yes its a node.=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0a) &quot;nr-confs&quot; specifies the number of pixel=
 clocks supported.<br>
<br>
</div>Why is this needed? Someone will get it wrong eventually and it can b=
e figured<br>
out currently by counting the child nodes, testing if they have the appropr=
iate<br>
properties.<br>
<div class=3D"im"><br></div></blockquote><div style>Actually i need to get =
the array size also from dt, hence this is approach i have taken=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pad=
ding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 b) &quot;confX: confX&quot; specifies the phy configuration =
settings,<br>
<br>
</div>This is confusing. What is X?<br>
<br></blockquote><div style>I am trying to generalize, here X means any num=
erical, and the programmer needs to=A0</div><div style>make sure conf0:conf=
0, wherein X is 0.I shall provide the values permitted for X in my next pat=
ch set.</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
The label is irrelevant -- none of this patch looks for phandles pointing a=
t<br>
configurations, nor is the precise name of the label important.<br>
<br>
This is a node, not a property.<br>
<div class=3D"im"><br></div></blockquote><div style>Ideally every conf&lt;n=
umerical value&gt; =A0a combination of pixel clock and new values for data =
and clock level.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 &quot;clock-frequency&quot; specifies the pi=
xel clock<br>
<br>
</div>Is this a frequency to configure the pixel clock with, or the pre-det=
ermined<br>
frequency of a clock that we will select?<br>
<div class=3D"im"><br></div></blockquote><div style>No, as the=A0explanatio=
n=A0suggests its the pixel clock itself.=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 &quot;con-de-emphasis-level&quot; specifies =
the configuration<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 of Data De-emphasis levels.<br>
<br>
</div>Please explain _why_ we need this configuration.<br>
<br></blockquote><div style>Our chipset to undergo HDMI compliance test and=
 noticed that the HDMI Compliance Test id 7-10 was failing</div><div style>=
for eye diagram test. Hence on further analysis, it was found that altering=
 the data de-emphasis levels and clock=A0</div>
<div style>level are required to pass the test.And also these values may va=
ry for variuos board revisons, this is the purpose of this whole patch set.=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex">

Also, &quot;con&quot; is not a good abbreviation of &quot;configuration&quo=
t;, &quot;config&quot; would be<br>
preferable.<br>
<div class=3D"im"><br></div></blockquote><div style>Agreed, will update the=
 same in next patch set.=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x145D0040h[3:0] permitted v=
alues:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0000 means 7=
60 mVdiff &amp;&amp; 1111 means 1400 mVdiff<br>
<br>
</div>I assume the &#39;h&#39; suffix is a redundant description that the c=
onstant is<br>
hexadecimal. Please drop it.<br>
<br></blockquote><div>Agreed, will update the same in next patch set.=A0=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex">

What is 0x145D0040? The address of the register, or its value?<br>
<br></blockquote><div style>Its the address of the hdmiphy=A0register for d=
ata level configuration.</div><div style>=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

The description is confusing, 0x145D0040h[3:0] is always 0[3:0].<br>
<br></blockquote><div style>This description is extracted from the one spec=
ified in manual, in my first patch set the reviewers had asked me=A0</div><=
div style>to provide the explaination for every bit, which i have provided.=
=A0</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Why does this need to be the exact value programmed into the register rathe=
r<br>
than separate values the driver can compose?<br>
<div class=3D"im"><br></div></blockquote><div style>As mentioned above the =
value is must for clearing the test 7-10, and also its derived by a trial a=
nd error method</div><div style>with the HDMI analyser.=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left=
:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x145D0040h[7:4] permitted v=
alues:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 000 =A0 =A0 =
0dB<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0001 =A0 =A0=
-0.25dB<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0010 =A0 =A0=
-0.7dB<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0011 =A0 =A0=
-1.15dB<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1111 =A0 =A0=
-7.45dB<br>
<br>
</div>Again, this seems very odd. Why this format?<br>
<div class=3D"im"><br></div></blockquote><div style>This binary translation=
 of what the bits actually mean.In the final result it was found that at 0.=
7dB there is no noise in the output.</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:=
rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 &quot;con-clock-level&quot; specifies the co=
nfiguration for<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 the corresponding clock level.<br>
<br>
</div>To repeat my comment on &quot;con-de-emphasis-level&quot;, &quot;con&=
quot; is not a good<br>
abbreviation for &quot;configuration&quot;.<br>
<div class=3D"im"><br></div></blockquote><div>Agreed, will update the same =
in next patch set.=A0=A0=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x145D005Ch [1:0] permitted =
values:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 00 means 0 m=
Vdiff &amp;&amp; 11 means 60 mVdiff<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x145D005Ch [7:3] permitted =
values:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 00000 is 790=
 mVdiff<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 11111 is 143=
0 mVdiff<br>
<br>
</div>Please explain why we must use this exact format rather than one whic=
h may be<br>
understood more easily.<br>
<div class=3D"im"><br></div></blockquote><div style>I hope by now have made=
 this point clear!=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
&gt; =A0Example:<br>
&gt;<br>
&gt; =A0 =A0 =A0 hdmi {<br>
&gt; @@ -20,4 +41,12 @@ Example:<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x14530000 0x100000&gt;;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 95 0&gt;;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 hpd-gpio =3D &lt;&amp;gpx3 7 1&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy-confs {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nr-confs =3D &lt;1&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 conf0: conf0 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-freque=
ncy =3D &lt;25200000&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 conf-de-emph=
asis-level =3D =A0/bits/ 8 &lt;0x26&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 conf-clock-l=
evel =3D =A0/bits/ 8 &lt; 0x66&gt;;<br>
<br>
</div>Why are these 8-bit? That wasn&#39;t described in the binding at all =
so far.<br>
<div class=3D"im"><br></div></blockquote><div style>These are 8 bit by desi=
gn(as mentioned in the manual) and were not part of device tree to be expla=
ined before.=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; =A0 =A0 =A0 };<br>
&gt; diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/=
dts/exynos5250-arndale.dts<br>
&gt; index c23f16b..436b75a 100644<br>
&gt; --- a/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt; +++ b/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt; @@ -424,6 +424,9 @@<br>
&gt;<br>
&gt; =A0 =A0 =A0 hdmi {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 hpd-gpio =3D &lt;&amp;gpx3 7 2&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 vdd_osc-supply =3D &lt;&amp;ldo10_reg&gt;;<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 vdd_pll-supply =3D &lt;&amp;ldo8_reg&gt;;<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 vdd-supply =3D &lt;&amp;ldo8_reg&gt;;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy-confs {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nr-confs =3D &lt;13&gt;;<b=
r>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 conf0: conf0 {<br>
&gt; @@ -492,9 +495,6 @@<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 conf-clock=
-level =3D =A0/bits/ 8 &lt; 0x66&gt;;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 vdd_osc-supply =3D &lt;&amp;ldo10_reg&gt;;<b=
r>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 vdd_pll-supply =3D &lt;&amp;ldo8_reg&gt;;<br=
>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 vdd-supply =3D &lt;&amp;ldo8_reg&gt;;<br>
&gt; =A0 =A0 =A0 };<br>
&gt;<br>
&gt; =A0 =A0 =A0 mmc_reg: voltage-regulator {<br>
<br>
</div>Why is this moving? It in no way relates to the rest of the patch, an=
d wasn&#39;t<br>
described in the commit message.<br>
<br></blockquote><div style>Oops that was supposed to be part of previous p=
ach,will update it.=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex">

[...]<br>
<div class=3D"im"><br>
&gt; +static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 struct hdmi_context *hdata)<br>
&gt; +{<br>
&gt; + =A0 =A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
&gt; + =A0 =A0 struct device_node *dev_np =3D dev-&gt;of_node;<br>
&gt; + =A0 =A0 struct device_node *phy_conf, *cfg_np;<br>
&gt; + =A0 =A0 int i =3D 0;<br>
&gt; +<br>
&gt; + =A0 =A0 phy_conf =3D of_find_node_by_name(dev_np, &quot;hdmiphy-conf=
s&quot;);<br>
&gt; + =A0 =A0 if (phy_conf =3D=3D NULL) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;Did not find hdmiphy_conf no=
de\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;<br>
&gt; + =A0 =A0 }<br>
&gt; +<br>
&gt; + =A0 =A0 of_property_read_u32(phy_conf, &quot;nr-confs&quot;, &amp;hd=
ata-&gt;nr_confs);<br>
<br>
</div>This can fail, returning an error code. Either check it, or remove th=
is<br>
property entirely and do this based on the number of children which have th=
e<br>
appropriate properties.<br>
<div class=3D"im"><br></div></blockquote><div style>Ok will add a check.=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 hdata-&gt;confs =3D kzalloc((hdata-&gt;nr_confs * sizeof<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (struct hdmiphy_config)), GFP_KERNEL);<br>
<br>
</div>Why the brackets on the first argument of kzalloc? They&#39;re superf=
luous.<br>
<br>
What if kzalloc fails?<br>
<div class=3D"im"><br></div></blockquote><div style>Ok, will put a check.=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">
<div class=3D"im">
&gt; +<br>
&gt; + =A0 =A0 /* Initialize with default config */<br>
&gt; + =A0 =A0 hdata-&gt;confs =3D hdmiphy_v14_configs;<br>
&gt; +<br>
&gt; + =A0 =A0 for_each_child_of_node(phy_conf, cfg_np) {<br>
<br>
</div>What if nr-confs is smaller than the number of child nodes?<br>
<div class=3D"im"><br></div></blockquote><div style>it basically is the arr=
ay size and it should be 1 + child nodes as mentioned in the descriptions, =
i</div><div style>assume that the programmer takes care of it.</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-=
left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 if (!of_find_property(cfg_np, &quot;clock-fr=
equency&quot;, NULL))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32_array(cfg_np, &quot=
;clock-frequency&quot;,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (u32 *)&amp;hdata-&gt;confs[i].<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pixel_clock, 1)) {<br>
<br>
</div>Don&#39;t split &amp;hdata-&gt;confs[i].pixel_clock over two lines.<b=
r>
<br>
Why is the cast necessary?<br>
<br>
Why not just of_property_read_u32? This only ever has a single value, and w=
hile<br>
there&#39;s no of_property_read_u8, of_property_read_u32 exists.<br>
<div class=3D"im"><br></div></blockquote><div style>Ok, agreed.=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&q=
uot;Failed to get pixel clock\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINV=
AL;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 /* Overwrite the data de-emphasis and data l=
evel */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u8_array(cfg_np, &quot;=
conf-de-emphasis-level&quot;,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (u8 *)&amp;hdata-&gt;confs[i].conf[16], 1)) {<br>
<br>
</div>Why is this cast necessary?<br>
<br>
I don&#39;t see why this must be an 8 bit property.<br>
<div class=3D"im"><br></div></blockquote><div style>As mentioned earlier it=
s by design 8 bits.=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&q=
uot;Failed to get conf\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINV=
AL;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 /* Overwrite the clock level diff */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u8_array(cfg_np, &quot;=
conf-clock-level&quot;,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (u8 *)&amp;hdata-&gt;confs[i].conf[23], 1)) {<br>
<br>
</div>Why the cast?<br>
<br></blockquote><div style>Same explaination as above.=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left=
:1ex">

Thanks,<br>
Mark.<br>
</blockquote></div>Thanks,</div></div><div class=3D"gmail_extra" style>Shir=
ish S</div></div>

--047d7b5d58a268d61304e9ca5f79--

--===============0438057997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0438057997==--

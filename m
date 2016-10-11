Return-Path: <Paul.Burton@imgtec.com>
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v3 16/18] dt-bindings: Document img,boston-clock binding
Date: Tue, 11 Oct 2016 16:56:01 +0100
Message-ID: <7552292.CRP11Bd59v@np-p-burton>
In-Reply-To: <20161010130121.GA31827@rob-hp-laptop>
References: <20161005171824.18014-1-paul.burton@imgtec.com> <20161005171824.18014-17-paul.burton@imgtec.com> <20161010130121.GA31827@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart82031840.HyiXapINCk";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Rob Herring <robh@kernel.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, "Michael Turquette  <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>," <linux-clk@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--nextPart82031840.HyiXapINCk
Content-Type: multipart/alternative; boundary="nextPart14214896.tOORD18ncn"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart14214896.tOORD18ncn
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 10 October 2016 08:01:21 BST Rob Herring wrote:
> On Wed, Oct 05, 2016 at 06:18:22PM +0100, Paul Burton wrote:
> > Add device tree binding documentation for the clocks provided by the
> > MIPS Boston development board from Imagination Technologies, and a
> > header file describing the available clocks for use by device trees &
> > driver.
> > 
> > Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: linux-clk@vger.kernel.org
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > 
> > ---
> > 
> > Changes in v3: None
> > Changes in v2:
> > - Add BOSTON_CLK_INPUT to expose the input clock.
> > 
> >  .../devicetree/bindings/clock/img,boston-clock.txt | 27
> >  ++++++++++++++++++++++ include/dt-bindings/clock/boston-clock.h         
> >   | 14 +++++++++++ 2 files changed, 41 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/clock/img,boston-clock.txt create mode
> >  100644 include/dt-bindings/clock/boston-clock.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> > b/Documentation/devicetree/bindings/clock/img,boston-clock.txt new file
> > mode 100644
> > index 0000000..c01ea60
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> > @@ -0,0 +1,27 @@
> > +Binding for Imagination Technologies MIPS Boston clock sources.
> > +
> > +This binding uses the common clock binding[1].
> > +
> > +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +
> > +Required properties:
> > +- compatible : Should be "img,boston-clock".
> > +- #clock-cells : Should be set to 1.
> > +  Values available for clock consumers can be found in the header file:
> > +    <dt-bindings/clock/boston-clock.h>
> > +- regmap : Phandle to the Boston platform register system controller.
> > +  This should contain a phandle to the system controller node covering
> > the
> > +  platform registers provided by the Boston board.
> 
> Can you just make the clock node a child of the system controller and
> drop this?
> 
> Rob

Hi Rob,

As I mentioned before technically that could be done, but it would really not be at all 
reflective of the hardware & so seems somewhat contrary to the purpose of a device tree.

Thanks,
    Paul

--nextPart14214896.tOORD18ncn
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'Terminus'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">On Monday, 10 October 2016 08:01:21 BST Rob Herring wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; On Wed, Oct 05, 2016 at 06:18:22PM +0100, Paul Burton wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Add device tree binding documentation for the clocks provided by the</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; MIPS Boston development board from Imagination Technologies, and a</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; header file describing the available clocks for use by device trees &amp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; driver.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Signed-off-by: Paul Burton &lt;paul.burton@imgtec.com&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Cc: Michael Turquette &lt;mturquette@baylibre.com&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Cc: Stephen Boyd &lt;sboyd@codeaurora.org&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Cc: linux-clk@vger.kernel.org</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Cc: Rob Herring &lt;robh+dt@kernel.org&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Cc: Mark Rutland &lt;mark.rutland@arm.com&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Cc: devicetree@vger.kernel.org</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; ---</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Changes in v3: None</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; Changes in v2:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; - Add BOSTON_CLK_INPUT to expose the input clock.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;  .../devicetree/bindings/clock/img,boston-clock.txt | 27</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;  ++++++++++++++++++++++ include/dt-bindings/clock/boston-clock.h         </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;   | 14 +++++++++++ 2 files changed, 41 insertions(+)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;  create mode 100644</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;  Documentation/devicetree/bindings/clock/img,boston-clock.txt create mode</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt;  100644 include/dt-bindings/clock/boston-clock.h</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; b/Documentation/devicetree/bindings/clock/img,boston-clock.txt new file</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; mode 100644</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; index 0000000..c01ea60</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; --- /dev/null</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +++ b/Documentation/devicetree/bindings/clock/img,boston-clock.txt</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; @@ -0,0 +1,27 @@</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +Binding for Imagination Technologies MIPS Boston clock sources.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +This binding uses the common clock binding[1].</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +Required properties:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +- compatible : Should be &quot;img,boston-clock&quot;.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +- #clock-cells : Should be set to 1.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +  Values available for clock consumers can be found in the header file:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +    &lt;dt-bindings/clock/boston-clock.h&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +- regmap : Phandle to the Boston platform register system controller.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +  This should contain a phandle to the system controller node covering</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; the</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &gt; +  platform registers provided by the Boston board.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Can you just make the clock node a child of the system controller and</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; drop this?</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Rob</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Hi Rob,</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">As I mentioned before technically that could be done, but it would really not be at all reflective of the hardware &amp; so seems somewhat contrary to the purpose of a device tree.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Thanks,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">    Paul</p></body></html>
--nextPart14214896.tOORD18ncn--

--nextPart82031840.HyiXapINCk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX/QuRAAoJEIIg2fppPBxl1FIP/33bpXOqgudLFmI3CIcM4ONO
Gj0Ct65jQzDyJ41ucVPYsXAOWnhaRDhXeNAk3syeq8fSmKtLiUjWJ/Lejw8dTC2v
H8/oApmXwql8os0f8/Crs7d7T9K3htN5GGDAwJfCYqkjvbTBu4ymflkXhdTIB/Gl
599hSFDuFUv+fc2oKWu6+sIyxgjOEXlrS0DNJxIqM6xBkzQ5jnCKkXbcUhQPR2tM
3kK4wbm9p5ldKiPGgnyWHoZNZXRQeSThc5Bksy3luqXycd0gnmBMMSy+0Y5jP8dq
GsSnTib1aVLgvQirvS2u5n9KfwwE8FSlkwioZjSqxW+wi056+WTHlU9PxVX1sruU
Axd3wbYvtze+4UzICqADF/EJFhVuB+04S88eFYIc5+vO+QuTvyx1rsGL/Fk0Guv9
ExlKQtz4cC9uaS2RuJebIYLEtECUEwld+Z0YXMx049zsPBElKJb0/ovvAEccgl1e
0NjArBVfuzdIEcLXS8cqE5QT/Sf41xJ6Iqd64mVoj6sSV0aHljT74i1TYKdNnhYu
rd3mIxGYGqj7DCqK/D4yTyBq7P0+vEkcqPS8WLOwUvpfM6BExqSy0RpoR5WN7rcl
i+BPJy1np5BeotGj+uQQYEZLtbmpzCLROo4VGRKPMkzovMCRmInVHI9picdWk6Ue
y92VqgliLBE/Y558ujJ8
=5b4U
-----END PGP SIGNATURE-----

--nextPart82031840.HyiXapINCk--

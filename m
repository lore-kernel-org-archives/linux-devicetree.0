From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/13] dt-bindings: update the binding for
 Allwinner H3 DE2 support
Date: Wed, 9 Aug 2017 19:21:21 -0500
Message-ID: <20170810002121.jydgklyxpm3fuekl@rob-hp-laptop>
References: <20170801131304.7741-1-icenowy@aosc.io>
 <79034825.lnfmIyYlWl@jernej-laptop>
 <d6c7c6de29be2674ad6b37b184d1df7f@aosc.io>
 <48442573.082BymFnMM@jernej-laptop>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJIP47K7MERBA6OV3GAKGQE746OQRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <48442573.082BymFnMM@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 02, 2017 at 09:06:26PM +0200, Jernej =C5=A0krabec wrote:
> Hi,
>=20
> Dne sreda, 02. avgust 2017 ob 07:02:39 CEST je icenowy-h8G6r0blFSE@public.gmane.org napisal(a)=
:
> > =E5=9C=A8 2017-08-02 12:53=EF=BC=8CJernej =C5=A0krabec =E5=86=99=E9=81=
=93=EF=BC=9A
> >=20
> > > Hi Icenowy,
> > >=20
> > > Dne torek, 01. avgust 2017 ob 15:12:52 CEST je Icenowy Zheng
> > >=20
> > > napisal(a):
> > >> Allwinner H3 features a "Display Engine 2.0".
> > >>=20
> > >> Add device tree bindings for the following parts:
> > >> - H3 TCONs
> > >> - H3 Mixers
> > >> - H3 Display engine
> > >>=20
> > >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > >> ---
> > >>=20
> > >>  .../bindings/display/sunxi/sun4i-drm.txt           | 25
> > >>=20
> > >> ++++++++++++++++++---- 1 file changed, 21 insertions(+), 4
> > >> deletions(-)
> > >>=20
> > >> diff --git
> > >> a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > >> b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt inde=
x
> > >> 2ee6ff0ef98e..92512953943e 100644
> > >> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > >> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > >>=20
> > >> @@ -87,18 +87,17 @@ Required properties:
> > >>     * allwinner,sun6i-a31-tcon
> > >>     * allwinner,sun6i-a31s-tcon
> > >>     * allwinner,sun8i-a33-tcon
> > >>=20
> > >> +   * allwinner,sun8i-h3-tcon
> > >>=20
> > >>     * allwinner,sun8i-v3s-tcon
> > >>  =20
> > >>   - reg: base address and size of memory-mapped region
> > >>   - interrupts: interrupt associated to this IP
> > >>  =20
> > >>   - clocks: phandles to the clocks feeding the TCON. Three are neede=
d:
> > >>     - 'ahb': the interface clocks
> > >>=20
> > >> -   - 'tcon-ch0': The clock driving the TCON channel 0
> > >>=20
> > >>   - resets: phandles to the reset controllers driving the encoder
> > >>  =20
> > >>     - "lcd": the reset line for the TCON channel 0
> > >>  =20
> > >>   - clock-names: the clock names mentioned above
> > >>   - reset-names: the reset names mentioned above
> > >>=20
> > >> - - clock-output-names: Name of the pixel clock created
> > >>=20
> > >>  - ports: A ports node with endpoint definitions as defined in
> > >> =20
> > >>    Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > >>=20
> > >> @@ -112,7 +111,23 @@ Required properties:
> > >>    channel the endpoint is associated to. If that property is not
> > >>    present, the endpoint number will be used as the channel number.
> > >>=20
> > >> -On SoCs other than the A33 and V3s, there is one more clock require=
d:
> > >> +For the following compatibles:
> > >> +   * allwinner,sun5i-a13-tcon
> > >> +   * allwinner,sun6i-a31-tcon
> > >> +   * allwinner,sun6i-a31s-tcon
> > >> +   * allwinner,sun8i-a33-tcon
> > >> +   * allwinner,sun8i-v3s-tcon
> > >> +there is one more clock and one more property required:
> > >> + - clocks:
> > >> +   - 'tcon-ch0': The clock driving the TCON channel 0
> > >> + - clock-output-names: Name of the pixel clock created
> > >> +
> > >> +For the following compatibles:
> > >> +   * allwinner,sun5i-a13-tcon
> > >> +   * allwinner,sun6i-a31-tcon
> > >> +   * allwinner,sun6i-a31s-tcon
> > >> +   * allwinner,sun8i-h3-tcon
> > >>=20
> > >> +there is one more clock required:
> > >>     - 'tcon-ch1': The clock driving the TCON channel 1
> > >> =20
> > >>  DRC
> > >>=20
> > >> @@ -207,6 +222,8 @@ supported.
> > >>=20
> > >>  Required properties:
> > >>    - compatible: value must be one of:
> > >>      * allwinner,sun8i-v3s-de2-mixer
> > >>=20
> > >> +    * allwinner,sun8i-h3-de2-mixer0
> > >> +    * allwinner,sun8i-h3-de2-mixer1
> > >=20
> > > About that, I concur with Maxime here, plane number properties would =
be
> > > better. If we don't do this now, we will never have it.
> >=20
> > But I still prefer different compatibles, as the capabilities are
> > already
> > proven to be different between mixer0 and mixer1, and furtherly we
> > cannot
> > promise Allwinner won't add more functions only available at mixer0.
> >=20
> > Then we will be trapped into a situation that we describe more and more
> > functions via properties, but they should be encoded into the
> > compatible.
>=20
> It is either multiple compatibles or multiple properties. I prefer the la=
ter,=20
> but it is up to maintainers to decide.

It's not the same. A compatible can imply an infinite number of=20
properties. I'm fine with properties too, but with only 2 instances I=20
don't think it makes much sense.

Rob

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH v2 03/11] dt-bindings: add device tree
 binding for X-Powers AXP803 PMIC
Date: Wed, 12 Apr 2017 02:08:31 +0800
Message-ID: <58ed1baa.09a8810a.efe2f.606fSMTPIN_ADDED_MISSING@gmr-mx.google.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBK5XWTDQKGQEDCFGACA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B44=E6=9C=8812=E6=97=A5 =E4=B8=8A=E5=8D=8812:29=E4=BA=8E Lee Jon=
es <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 11 Apr 2017, Chen-Yu Tsai wrote:
>
> > Hi,
> >=20
> > On Tue, Apr 11, 2017 at 11:00 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote=
:
> > >
> > >
> > > On Tue, 11 Apr 2017, Lee Jones wrote:
> > >
> > >> On Sat, 08 Apr 2017, Icenowy Zheng wrote:
> > >>
> > >>> AXP803 is a PMIC produced by Shenzhen X-Powers, with either I2C or =
RSB
> > >>> bus.
> > >>>
> > >>> Add a compatible for it.
> > >>>
> > >>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > >>> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > >>> ---
> > >>> Changes in v2:
> > >>> - Place AXP803 before AXP806/809.
> > >>> - Added Chen-Yu's ACK.
> > >>>
> > >>>=C2=A0 Documentation/devicetree/bindings/mfd/axp20x.txt | 5 +++--
> > >>>=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
> > >>
> > >>
> > >> For my own reference:
> > >>=C2=A0 Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >
> > >
> > > Excuse me... Who will apply this patch?
>
> Excuse you?=C2=A0 Are you trying to be polite, or rude?
>
> I'm guessing due to the lagging '...', that it's the latter?

Oh sorry, I mean the former...

>
> > > I think this patch should be applied by you as it's in bindings/mfd
> > > directory, however, if I'm wrong, please point out ;-)
> >
> > We need the DT maintainers to ack it first. :)
>
> We don't really need the DT Maintainers to get involved here.
>
> What I do need is either clear direction as to how this
> patch-set should be applied, or an indication of which patches are
> dependant on others and which are orthogonal and can be applied
> independently.

This patch is independent, although the regulator binding patch
depends on it.

The real driver patches will need the binding patches to be merged
first.

And the dt patches depend on also the binding patches.

>
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

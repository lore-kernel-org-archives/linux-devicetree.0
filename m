From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: allwinner: Add devicetree for
 pine H64 modelA evaluation board
Date: Wed, 14 Aug 2019 15:20:01 +0200
Message-ID: <20190814132001.GC24324@Red>
References: <20190808084253.10573-1-clabbe.montjoie@gmail.com>
 <1648748.TWHgARQioU@jernej-laptop>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD7YLCN32UNBBBMV2DVAKGQE4R2Y3EY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1648748.TWHgARQioU@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 12:56:56PM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 08. avgust 2019 ob 10:42:53 CEST je Corentin Labbe napi=
sal(a):
> > This patch adds the evaluation variant of the model A of the PineH64.
> > The model A has the same size of the pine64 and has a PCIE slot.
> >=20
> > The only devicetree difference with current pineH64, is the PHY
> > regulator.
>=20
> I have Model A board which also needs ddc-en-gpios property for HDMI conn=
ector=20
> in order for HDMI to work correctly. Otherwise it will just use 1024x768=
=20
> resolution. Can you confirm that?
>=20
> Best regards,
> Jernej
>=20

Sorry I didnt use at all video stuff (like HDMI), so I cannot answer now.

Could you send me a patch against my future v2 and I could test with/withou=
t.

Regards

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190814132001.GC24324%40Red.

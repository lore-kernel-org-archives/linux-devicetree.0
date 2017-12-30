From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/6] phy: sun4i-usb: add support for R40 USB PHY
Date: Sat, 30 Dec 2017 19:38:12 +0800
Message-ID: <4846846.1ddJIksgpP@ice-x220i>
References: <20171008042906.46779-1-icenowy@aosc.io> <20171018114219.lykghmhzve5yvhaa@flea.lan> <020a2b04-dbcc-032a-89d1-75479dd436e7@ti.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBLXVTXJAKGQEMCCNBWQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <020a2b04-dbcc-032a-89d1-75479dd436e7-l0cyMroinI0@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017=E5=B9=B410=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 CS=
T =E4=B8=8B=E5=8D=887:46:08=EF=BC=8CKishon Vijay Abraham I =E5=86=99=E9=81=
=93=EF=BC=9A
> On Wednesday 18 October 2017 05:12 PM, Maxime Ripard wrote:
> > On Wed, Oct 18, 2017 at 05:09:00PM +0530, Kishon Vijay Abraham I wrote:
> >> Hi,
> >>=20
> >> On Tuesday 10 October 2017 02:28 AM, Maxime Ripard wrote:
> >>> On Sun, Oct 08, 2017 at 04:29:01AM +0000, Icenowy Zheng wrote:
> >>>> Allwinner R40 features a USB PHY like the one in A64, but with 3 PHY=
s.
> >>>>=20
> >>>> Add support for it.
> >>>>=20
> >>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >>>=20
> >>> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>=20
> >> Is this patch good to be merged? I see you have pending comments on th=
e
> >> other patch in the series.
> >=20
> > Yeah, but I guess you can merge this one, it's pretty harmless, and it
> > will reduce the amount of patches to review / merge later on.
>=20
> Thank you for the quick reply.
>=20
> merged with Maxime's and Rob's Ack.

Sorry, but I didn't see the patch appears in linux-next for such long time.

Is it lost?

>=20
> Thanks
> Kishon


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

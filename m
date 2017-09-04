From: =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 05/10] dmaengine: sun6i: Move number of
 pchans/vchans/request to device struct
Date: Mon, 4 Sep 2017 14:30:59 +0000
Message-ID: <3533197.81BdoSVRz8@sbruens-linux>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-6-stefan.bruens@rwth-aachen.de>
 <20170904074355.niloziky42aki7bg@flea>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBJGHWXGQKGQERQPIC6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170904074355.niloziky42aki7bg@flea>
Content-Language: en-US
Content-ID: <625A3A4542C11445B4DBEC50806D6BE1-KnNo0XtUZUuELgA04lAiVw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Montag, 4. September 2017 09:43:55 CEST Maxime Ripard wrote:
> On Mon, Sep 04, 2017 at 12:40:56AM +0200, Stefan Br=C3=BCns wrote:
> > Preparatory patch: If the same compatible is used for different SoCs wh=
ich
> > have a common register layout, but different number of channels, the
> > channel count can no longer be stored in the config. Store it in the
> > device structure instead.
> >=20
> > Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>=20
> As stated already, we already are going to have a different
> compatible, and this is not something that will change from one
> instance to the other. Having code is therefore:
>   A) Making the code more complex
>   B) For no particular reason.

If the dma channel count (which is a standard dma binding, likely for a=20
reason) goes into the devicetree, it has to be moved out of the config.

The R40 (which has register manuals available) has the same register layout=
 as=20
the A64, but *does* have a different channel count. So you think it is a go=
od=20
idea to introduce a new compatible again?

If you had been half as picky when merging the H3 and A83T support, we woul=
d=20
not have this mess now.

There is also the H6, where there is no register manual available yet, but =
I =20
bet it has the H3 (and A64, H5, R40) register layout, but unlikely the same=
=20
number of DMA channels *and* the same number of ports.

Regards,

Stefan

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

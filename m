From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-sun8i: drop V3s
 compatible and add V3 one
Date: Sat, 03 Feb 2018 15:21:42 +0800
Message-ID: <10F6ADAB-1E1E-4C14-8809-9471ABABBB8A@aosc.io>
References: <20180202180456.60378-1-icenowy@aosc.io> <20180202180456.60378-2-icenowy@aosc.io> <CAGRGNgXy5ZUdCj34jG5kJ8yLZLbcZie5tkvYP08sFpMmAjwPNg@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBG6G2XJQKGQEG3GLPKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGRGNgXy5ZUdCj34jG5kJ8yLZLbcZie5tkvYP08sFpMmAjwPNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B42=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=882:0=
0:33, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi Icenowy,
>
>On Sat, Feb 3, 2018 at 5:04 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> The V3s is just a differently packaged version of the V3 chip, which
>has
>> a MAC with the same capability with H3. The V3s just doesn't wire out
>> the external MII/RMII/RGMII bus. (V3 wired out it).
>>
>> Drop the compatible string of V3s in the dwmac-sun8i driver, and add
>a
>> V3 compatible string, which has all capabilities.
>
>Aren't compatible strings technically API, so don't we need to support
>those that are out in the wild "forever"?
>
>Therefore shouldn't we leave the v3s variant around for compatibility
>with existing device trees?

You can run grep at arch/arm/boot/dts, this compatible
string is not used at all.

>
>Thanks,

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

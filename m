From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: add PIO VCC bank
 supplies for Pine H64
Date: Thu, 02 May 2019 15:46:17 +0800
Message-ID: <8CB1EDA4-E4B7-486D-8BCD-884E0025C6EA@aosc.io>
References: <20190424062543.61852-1-icenowy@aosc.io> <20190502074303.g3px63n4v4o7xade@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBVWAVLTAKGQEZZS567A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190502074303.g3px63n4v4o7xade@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B45=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883:4=
3:03, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>On Wed, Apr 24, 2019 at 02:25:43PM +0800, Icenowy Zheng wrote:
>> The Allwinner H6 SoC features tweakable VCC for PC, PD, PG, PL and PM
>> banks.
>>
>> This patch adds supplies for PC and PD banks on Pine H64 board. PG
>and
>> PM banks are used for Wi-Fi and should be added when Wi-Fi is added
>
>Not really. The regulator is still there, whether we use it or not. If
>it's not used, then it will be left disabled so it doesn't really
>change anything.

Okay, I will include them in the next revision.

>
>> PL bank is where PMIC is attached, and currently if a PMIC regulator
>> is added for it a dependency loop will happen.
>
>I guess we should fix that somehow

But this patch is needed for eMMC to be functional again in HS200 mode, so =
I hope
it can get applied before this get fixed.

>
>Maxime
>
>--
>Maxime Ripard, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

--=20
=E4=BD=BF=E7=94=A8 K-9 Mail =E5=8F=91=E9=80=81=E8=87=AA=E6=88=91=E7=9A=84An=
droid=E8=AE=BE=E5=A4=87=E3=80=82

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

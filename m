From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: change the A64 HDMI PHY
 binding to R40
Date: Wed, 05 Sep 2018 15:46:41 +0800
Message-ID: <3D28A45F-D67D-4388-9FB7-2A2763955398@aosc.io>
References: <20180903133434.58188-1-icenowy@aosc.io> <20180903133434.58188-2-icenowy@aosc.io> <20180905071435.lgsogpzmh5nw6bcy@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB3UTX3OAKGQEZU762EI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180905071435.lgsogpzmh5nw6bcy@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B49=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883:1=
4:35, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Mon, Sep 03, 2018 at 09:34:32PM +0800, Icenowy Zheng wrote:
>> By experiment, the A64 HDMi PHY doesn't support the PLL-VIDEO mux
>> introduced in R40, although it has two PLL-VIDEOs.
>>=20
>> Change the A64 HDMI PHY binding to R40 one.
>>=20
>> This binding is introduced in v4.19, which is still in RC stage, so
>we
>> have change to fix it.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>
>That doesn't make much sense. The A64 doesn't have any particular
>reason to behave like the R40, and the R40 can definitely use a
>different compatible if it has a different behaviour. But I don't see
>*why* the A64 not behaving like the R40 is a justification to remove
>the A64 compatible. Especially when the R40 was released later.
>
>Add a new compatible, and leave the A64 compatible alone.

But the behavior of A64 compatible will change from double
PLL to single PLL, because the A64 HDMI PHY is proven
to have no double PLL.

Should I then change the A64 compatible behavior and import R40 compatible =
at the same time?

In addition maybe I can just drop A64 compatible, and let A64
use H3 one. Then I will add a R40 compatible to catch
dual PLL behavior.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

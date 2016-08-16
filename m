From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2] regulator: axp20x: support AXP803/AXP813 variants
Date: Tue, 16 Aug 2016 23:04:47 +0800
Message-ID: <395001471359887@web15h.yandex.ru>
References: <E1bZY0w-0004lM-0a@bombadil.infradead.org>
	<248521471347017@web1g.yandex.ru> <20160816150104.16a7bcf774135c8275828eda@free.fr>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBMWXZS6QKGQE334XDCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160816150104.16a7bcf774135c8275828eda-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



16.08.2016, 21:01, "Jean-Francois Moine" <moinejf-GANU6spQydw@public.gmane.org>:
> On Tue, 16 Aug 2016 19:30:17 +0800
> Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>
>> =C2=A0> The X-Powers AXP803 and AXP813 PMICs are close to the AXP809 wit=
h some
>> =C2=A0> more outputs.
>> =C2=A0AXP803 and AXP813 is quite different.
>> =C2=A0AXP803 have 6 DCDCs and 16 LDOs&Switch.
>> =C2=A0AXP813 have 7 DCDCs and 15 LDOs&Switch.
>> =C2=A0and AXP813 have an audio codec.
>>
>> =C2=A0AXP803 cannot be handled without extra code.
>>
>> =C2=A0(I'm trying to get RSB working in my semi-mainline A64 kernel)
>
> Hi Icenowy,
>
> Interesting.
> I did not find the documentation about the AXP813, but looking at the
> Banana PI M3 driver (which seems a bit buggy), I found it was very
> close to the AXP803.
>
> Which more code do you think is needed for the AXP803?
I've not checked it.
>
> Also, please, may you give me a pointer to the AXP813 documentation?
I got it on BaiduPan.
https://pan.baidu.com/share/link?shareid=3D120641733&uk=3D2121502978&fid=3D=
169295081716431
Here's a link, you can download it if you can read Chinese...
Or at least you can read it online.
>
> --
> Ken ar c'henta=C3=B1 | ** Breizh ha Linux atav! **
> Jef | http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

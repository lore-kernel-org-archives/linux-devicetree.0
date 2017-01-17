From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2 2/4] clk: sunxi-ng: add support for V3s CCU
Date: Wed, 18 Jan 2017 01:08:14 +0800
Message-ID: <5926181484672894@web12g.yandex.ru>
References: <20170116180116.36729-2-icenowy@aosc.xyz>
	 <20170116180116.36729-3-icenowy@aosc.xyz> <20170117090456.fgw6lpqgurwwcczj@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBAM77HBQKGQE4HTMKBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170117090456.fgw6lpqgurwwcczj@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zepan <715805855-9uewiaClKEY@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



17.01.2017, 17:05, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi,
>
> On Tue, Jan 17, 2017 at 02:01:14AM +0800, Icenowy Zheng wrote:
>> =C2=A0V3s has a similar but cut-down CCU to H3.
>>
>> =C2=A0Add support for it.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>
> Output from checkpatch:
> total: 5 errors, 2 warnings, 3 checks, 857 lines checked

I remembered some errors' code is directly derived from ccu-sun8i-h3.c,
so I generated a patch file for "clk: sunxi-ng: Add H3 clocks" and run
checkpatch on it:
total: 4 errors, 5 warnings, 1159 lines checked

Should I still get all errors fixed?

>
>> =C2=A0I think I should make a comparsion between V3s and H3 CCU here:
>> =C2=A0(I won't mention the missing/added clocks here, only list conflict=
ing clocks)
>
> That should be in your commit log.
>
>> =C2=A0- "bus-ehci0" is at different bit (The bit that is "bus-ehci0" on =
V3s is
>> =C2=A0=C2=A0=C2=A0"bus-ehci2" on H3)
>> =C2=A0- The mux of "ce" is different. (According the view at V3s datashe=
et by the
>> =C2=A0=C2=A0=C2=A0author of sun4i-ss, V3s may have sun4i-ss, not sun8i-c=
e)
>> =C2=A0- The mux of "de" is different. (V3s do not have "pll-de", but it =
can mux "de"
>> =C2=A0=C2=A0=C2=A0to "pll-video")
>> =C2=A0- Clocks about CSI largely differs. (As V3s is designed as a camer=
a SoC, and
>> =C2=A0=C2=A0=C2=A0it have an extra "pll-isp")
>
> OK.
>
> Thanks,
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

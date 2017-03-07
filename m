From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v8 0/6] Allwinner H5 and Orange Pi PC2 support
Date: Wed, 08 Mar 2017 01:36:43 +0800
Message-ID: <2704251488908203@web18o.yandex.ru>
References: <20170306171750.7491-1-icenowy@aosc.xyz> <20170307170751.n6tvrztet724pxfl@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBLO77PCQKGQEP3RHLVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170307170751.n6tvrztet724pxfl@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



08.03.2017, 01:07, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi,
>
> On Tue, Mar 07, 2017 at 01:17:44AM +0800, Icenowy Zheng wrote:
>> =C2=A0Allwinner H5 is a 64-bit SoC with a design like the 32-bit
>> =C2=A0H3, and it's pin-to-pin compatible with H3.
>>
>> =C2=A0This patchset adds support for it, along with the first available
>> =C2=A0board -- Orange Pi PC2.
>>
>> =C2=A0Several H5 boards by Sinovoip Banana Pi and FriendlyARM Nano Pi
>> =C2=A0are coming, so we should get ready for them.
>>
>> =C2=A0CCU changes are already said to be merged by Maxime Ripard, so
>> =C2=A0this patchset now contains only device tree patches.
>>
>> =C2=A0Commit messages are changed by the suggestion of Maxime.
>>
>> =C2=A0This patchset depends on patchset [1] to finally take effect. At
>> =C2=A0least the patch 1 of that patchset is needed if you want to test
>> =C2=A0the kernel image -- without it the pinctrl driver won't be built
>> =C2=A0and the kernel will become unusable without pinctrl.
>
> It's still not the prefixes I told you to use. I merged your patches
> and fixed, but please use the right one next time (and be consistent
> in your ARM vs arm usage).

oh I added dts: to the prefix you told me, as they're device tree patches.

Is the usage of "dts:" out-dated?

>
> Thanks for your work!
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

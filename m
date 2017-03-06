From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v7 1/6] ARM: dts: sun8i: drop
 skeleton.dtsi inclusion in H3 DTSI
Date: Mon, 6 Mar 2017 18:48:34 +0800
Message-ID: <CAGb2v64gDZ4=28Etwrv0eb=vAVEp1hh6ek9+18irRPvos7vJcw@mail.gmail.com>
References: <20170305233138.64574-1-icenowy@aosc.xyz> <20170305233138.64574-2-icenowy@aosc.xyz>
 <20170306103535.jdaiwr65gtrhh7jp@lukather> <1681991488797167@web29m.yandex.ru>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGX56TCQKGQEQAVMFQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1681991488797167-2RFDN0mQWyRxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 6, 2017 at 6:46 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>
>
> 06.03.2017, 18:35, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>> Hi,
>>
>> On Mon, Mar 06, 2017 at 07:31:33AM +0800, Icenowy Zheng wrote:
>>>  The skeleton.dtsi file is now deprecated, and do not exist in ARM64
>>>  environment.
>>>
>>>  Since we will soon reuse most part of H3 DTSI for H5, which is an ARM64
>>>  chip, drop skeleton.dtsi inclusion now.
>>>
>>>  Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>
>> Your prefix (and in the three later patches) should be
>> ARM: sun8i: h3
>
> Oh I think we never added SoC name in prefix...

It's better to add them for sun8i, which encompasses a whole
bunch of SoCs, unlike the older sun[4-7]i. Even sun5i patches
have them.

ChenYu

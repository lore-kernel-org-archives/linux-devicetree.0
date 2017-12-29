From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: fix USB Ethernet of Orange
 Pi R1
Date: Fri, 29 Dec 2017 16:59:52 +0800
Message-ID: <CAGb2v673B7U+FyzdKx=-qo7_U1aTrrA5EU66KP3MP5LSnt8Fdw@mail.gmail.com>
References: <20171228140538.14388-1-icenowy@aosc.io> <CAGb2v679BdkA=4hzsTiHXwqdSop+dFDTePqmd_eNSMQR+gq9fg@mail.gmail.com>
 <511FDCF7-4B8D-4270-8E51-FF723AF07082@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBI4ITDJAKGQEWEN4RLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <511FDCF7-4B8D-4270-8E51-FF723AF07082-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 29, 2017 at 4:56 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>
> =E4=BA=8E 2017=E5=B9=B412=E6=9C=8829=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=884:55:34, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>>On Thu, Dec 28, 2017 at 10:05 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>wrote:
>>> Orange Pi R1 uses a Realtek RTL8152B USB Ethernet chip, which is
>>easily
>>> seen on the board but not show in the schematics. A regulator for the
>>> power of the RTL8152B chip is hidden, which uses the same pin with
>>the
>>> Wi-Fi regulator on the original Orange Pi Zero.
>>>
>>> Add this regulator back to the device tree, and bind it to USB1.
>>>
>>> Tested-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>
>>Applied. There is no guarantee this will make it into 4.16-rc1. If not,
>>this will be sent later on as a fix for 4.16.
>
> Because of New Year?

Yeah. I've already sent the pull requests for 4.16. Anything applied
after that I want tested in -next for a few days. By then we'd be
past -rc6, and anything sent after that as late pull requests has a
chance of not being merged.

Plus the arm-soc maintainers are still on holiday.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

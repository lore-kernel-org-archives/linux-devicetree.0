From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 6/8] ARM: dts: sun8i: a83t: Move mmc1
 pinctrl setting to dtsi file
Date: Thu, 19 Oct 2017 16:24:32 +0800
Message-ID: <CAGb2v66Bje_=PcvWFJo6cXB+qsXmZqiwGoBgLfcFWrzEMOQRMA@mail.gmail.com>
References: <20171018083138.14517-1-wens@csie.org> <20171018083138.14517-7-wens@csie.org>
 <f85a30e2-5a9d-a7ba-0010-6602cabaf83e@riseup.net> <CAGb2v64O+eyriHG-FirtPKo6hACfbV9JcJRUUZ+rY1QM2w_r1g@mail.gmail.com>
 <0e934ef6b4254fc94f613d1305c06cde@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWWCUHHQKGQEHINLBZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <0e934ef6b4254fc94f613d1305c06cde-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, =?UTF-8?B?Sm9vbmFzIEt5bG3DpGzDpA==?= <joonas.kylmala-X3B1VOXEql0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 19, 2017 at 4:18 PM,  <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> =E5=9C=A8 2017-10-19 14:48=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> On Wed, Oct 18, 2017 at 11:00 PM, Joonas Kylm=C3=A4l=C3=A4 <joonas.kylma=
la-X3B1VOXEql0@public.gmane.org>
>> wrote:
>>>
>>> Hi,
>>>
>>> Chen-Yu Tsai:
>>>>
>>>> mmc1 only has 1 possible pinmux setting.
>>>
>>>
>>> What if someone is using the MMC with bus width 1 and then using the
>>> remaining 3 pins for something else?
>>
>>
>> I would very much like to see such a design. Currently the devices
>> we see all follow Allwinner's reference design, with only minor
>> modifications. As such, mmc1 is used exclusively for connecting
>> SDIO-based WiFi modules.
>>
>> If such a radical(?) design is done, the vendor can always add
>> a "mmc1-1bit-pins" setting and override the default.
>
>
> I think this kind of thing happened on A13 -- the MMC2 of A13 is
> 8-bit, but Lichee Pi One wires it to a SD card slot (4-bit); then
> the remaining 4 data lines are wired out as GPIO. (Lichee Pi's
> do not like obeying reference design ;-) )

For MMC2 we have mmc2_pins (4-bit) and mmc2_8bit_emmc_pins (8-bit
+ emmc reset pin).

ChenYu

>
> But I think a MMC/SDIO device under 1-bit mode is too slow that
> maybe no one will use such a setup.
>
>>
>> ChenYu
>
>
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

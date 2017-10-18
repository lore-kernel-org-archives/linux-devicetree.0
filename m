From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output
Date: Wed, 18 Oct 2017 15:16:07 +0200
Message-ID: <CAMuHMdXjAHOyLb+FKbztNTKciZMeR=VCuBXuTWdkzNEB1A5veA@mail.gmail.com>
References: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com>
 <1508319227-19679-3-git-send-email-biju.das@bp.renesas.com> <2315907.0FoaqPrOEJ@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2315907.0FoaqPrOEJ@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Wed, Oct 18, 2017 at 2:16 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wednesday, 18 October 2017 12:33:47 EEST Biju Das wrote:
>> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>
>> Although there is a HDMI connector on the q7 carrier board it is not
>> connected to the RZ/G1M SoC. One must use the HDMI connector on the
>> camera daughter board.
>>
>> This patch adds support for this connector.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

>> --- a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
>> +++ b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi

>> @@ -23,7 +48,57 @@
>>       status = "okay";
>>  };
>>
>> +&i2c5 {
>> +     status = "okay";
>> +     clock-frequency = <400000>;
>> +
>> +     cec_clock: cec-clock {
>> +             compatible = "fixed-clock";
>> +             #clock-cells = <0>;
>> +             clock-frequency = <12000000>;
>> +     };
>
> I assume this describes a fixed clock generator that is not I2C-controlled.
> The node should thus not be a child of the i2c5 bus node, but should be moved
> to the root node of the DT.

Oops, that's something we should fix in r8a7791-koelsch.dts, too
(CC Hans)

> The rest looks good to me. With this fixed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> However I can't find arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi in linux-next.
> Which tree would you like to get this series merged through ?

It's been in next as of next-20171012.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] DT: mmc: sh_mmcif: fix "compatible" property text
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
 <3979266.lQrOKbu0yo@wasted.cogentembedded.com>
 <CANqRtoSVU77Q7hnoMJ2_VbqprJYxbvbbe5MHBReH_dVxyvGAQQ@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <55BB521D.5070207@cogentembedded.com>
Date: Fri, 31 Jul 2015 13:46:53 +0300
MIME-Version: 1.0
In-Reply-To: <CANqRtoSVU77Q7hnoMJ2_VbqprJYxbvbbe5MHBReH_dVxyvGAQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, ulf.hansson@linaro.org, linux-mmc@vger.kernel.org, SH-Linux <linux-sh@vger.kernel.org>, Simon, Horms, horms@verge.net.au, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

On 7/31/2015 5:23 AM, Magnus Damm wrote:

>> The "compatible" property text contradicts even the example given in the MMCIF
>> binding document itself; moreover, the Renesas MMCIF driver only  matches  on
>> the generic "compatible" string, and doesn't look for at SoC specific strings
>> currently at all. Thus describe "renesas,sh-mmcif" string as mandatory and the
>> others as optional.

>> Fixes: b4c27763d749 ("mmc: sh_mmcif: Document DT bindings")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

> If anything is unclear please ask and feel free to discuss this DT
> topic with Simon, Laurent, Geert and/or me.

    BTW, I have raised this question back in February (!). Not much of a 
discussion followed:

http://marc.info/?l=linux-sh&m=142436538404802

> Thanks,

> / magnus

MBR, Sergei

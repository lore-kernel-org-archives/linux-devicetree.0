Return-Path: <SRS0=4xjV=HF=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v7] media: platform: Renesas IMR driver
References: <20170804180402.795437602@cogentembedded.com>
 <CAMuHMdVu31PDTGXUxyWM_e1GAdT814ynTsiC_yCZiLYhg9aQjg@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5bf086c1-a4de-8584-54e9-83da3cd57578@cogentembedded.com>
Date: Mon, 16 Apr 2018 18:12:37 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVu31PDTGXUxyWM_e1GAdT814ynTsiC_yCZiLYhg9aQjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 04/16/2018 04:27 PM, Geert Uytterhoeven wrote:

>> The image renderer, or the distortion correction engine, is a drawing
>> processor with a simple instruction system capable of referencing video
>> capture data or data in an external memory as the 2D texture data and
>> performing texture mapping and drawing with respect to any shape that is
>> split into triangular objects.
>>
>> This V4L2 memory-to-memory device driver only supports image renderer light
>> extended 4 (IMR-LX4) found in the R-Car gen3 SoCs; the R-Car gen2 support
>> can be added later...
>>
>> Based on the original patch by Konstantin Kozhevnikov.
>>
>> Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
>>  Documentation/devicetree/bindings/media/rcar_imr.txt |   27
>>  Documentation/media/v4l-drivers/index.rst            |    1
>>  Documentation/media/v4l-drivers/rcar_imr.rst         |  372 +++
>>  drivers/media/platform/Kconfig                       |   13
>>  drivers/media/platform/Makefile                      |    1
>>  drivers/media/platform/rcar_imr.c                    | 1832 +++++++++++++++++++
>>  include/uapi/linux/rcar_imr.h                        |  182 +
>>  7 files changed, 2428 insertions(+)
> 
> What's the status of this patch?

   Changes requested, and I'm still having no bandwidth to make them... 

> The compatible value "renesas,r8a7796-imr-lx4" has been in use since v4.14.

   That's because the SoC bindings are unlikely to change...

> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei

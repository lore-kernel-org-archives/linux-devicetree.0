From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] media: platform: Renesas IMR driver
Date: Fri, 3 Mar 2017 14:56:41 +0300
Message-ID: <f8702961-3561-977f-d6dc-16571a64181e@cogentembedded.com>
References: <20170302210104.646782352@cogentembedded.com>
 <CAMuHMdVg5N82bu8fxRS=3iqF2MQmqoR0idb_x0t2RNn8eoedQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVg5N82bu8fxRS=3iqF2MQmqoR0idb_x0t2RNn8eoedQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello!

On 03/03/2017 02:24 PM, Geert Uytterhoeven wrote:

>> --- /dev/null
>> +++ media_tree/Documentation/devicetree/bindings/media/rcar_imr.txt
>
>> +- compatible: "renesas,imr-lx4-<soctype>", "renesas,imr-lx4" as a fallback for
>
> "renesas,<soctype>-imr-lx4"
>
>> +  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3 SoCs,
>> +  where the examples with <soctype> are:
>> +  - "renesas,imr-lx4-h3" for R-Car H3,
>
> "renesas,r8a7795-imr-lx4"

    The IMR core names were copied from the manual verbatim (just in lower case).

>> +  - "renesas,imr-lx4-m3-w" for R-Car M3-W,
>
> "renesas,r8a7796-imr-lx4"
>
>> +  - "renesas,imr-lx4-v3m" for R-Car V3M.
>
> "renesas,-EPROBE_DEFER-imr-lx4"

    Huh? :-)

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

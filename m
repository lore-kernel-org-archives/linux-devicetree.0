From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] media: platform: rcar_imr: add IMR-LSX3 support
Date: Fri, 30 Jun 2017 16:15:21 +0300
Message-ID: <ea3cceb5-5fa4-a3d8-01c8-8a768553869a@cogentembedded.com>
References: <20170628195719.333514117@cogentembedded.com>
 <20170629214212.6r4e5xqmuul7g4o2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170629214212.6r4e5xqmuul7g4o2@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/30/2017 12:42 AM, Rob Herring wrote:

>> Add support for the image renderer light SRAM extended 3 (IMR-LSX3) found
>> only in the R-Car V2H (R8A7792) SoC.  It differs  from IMR-LX4 in that it
>> supports only planar video formats but can use the video capture data for
>> the textures.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> ---
>> This patch  is against the 'media_tree.git' repo's 'master' branch plus the
>> latest version of the Renesas IMR driver...
>>
>> Changes in version 3:
>> - fixed compilation errors, resolved rejects, refreshed the patch atop of the
>>   IMR driver patch (version 6).
>>
>> Changes in version 2:
>> - renamed *enum* 'imr_gen' to 'imr_type' and the *struct* field of this type
>>   from 'gen' to 'type';
>> - rename *struct* 'imr_type' to 'imr_info' and the fields/variables of this type
>>   from 'type' to 'info';
>> - added comments to IMR-LX4 only CMRCR2 bits;
>> - added IMR type check to the WTS instruction writing to CMRCCR2.
>>
>>  Documentation/devicetree/bindings/media/rcar_imr.txt |   11 +-
>
> You missed my ack on v2.

    Sorry again, realized that just after posting v3.

>>  drivers/media/platform/rcar_imr.c                    |  101 +++++++++++++++----
>>  2 files changed, 92 insertions(+), 20 deletions(-)

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC 1/3] dt-bindings: rtc: Add Realtek RTD1295
Date: Sun, 27 Aug 2017 12:41:46 +0200
Message-ID: <629b9ed0-7b2d-7c5c-20b8-17289a76f097@suse.de>
References: <20170820013632.18375-1-afaerber@suse.de>
 <20170820013632.18375-2-afaerber@suse.de>
 <20170823002911.y35nn7jkt34dvjbc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170823002911.y35nn7jkt34dvjbc@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?B?6JKL5Li955C0?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Am 23.08.2017 um 02:29 schrieb Rob Herring:
> On Sun, Aug 20, 2017 at 03:36:29AM +0200, Andreas Färber wrote:
>> Add a binding for the RTC on the Realtek RTD119x/RTD129x SoC families.
>>
>> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  .../devicetree/bindings/rtc/realtek,rtd119x.txt          | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks. Did you read the RFC question in the cover letter as well and
have any comments? Downstream has an rtc-base-year = <2014>; property
that I had left out in this RFC and due to your ack not included in v2.

Should we default to 2014 in the driver and add an optional base-year
property once we encounter a diverging device, or should we make it
required from the beginning? I did not spot any other rtc binding with
such a property and would appreciate a clarification.

Thanks in advance,

Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

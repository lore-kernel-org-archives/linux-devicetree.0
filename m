From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt/bindings: Add bindings for Broadcom STB DRAM
 Sensors
Date: Wed, 21 Jun 2017 13:44:53 -0700
Message-ID: <7128c063-1b3d-9cfb-71c6-f4590dac5e09@gmail.com>
References: <20170613223710.31719-1-code@mmayer.net>
 <20170613223710.31719-2-code@mmayer.net>
 <20170618140529.wtqffjuilrkarzvd@rob-hp-laptop>
 <CANEuBv6YEoTBBzPA5fkrveD05RZNtTBTak-qmxz7BvnrED5pbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANEuBv6YEoTBBzPA5fkrveD05RZNtTBTak-qmxz7BvnrED5pbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/19/2017 10:26 AM, Markus Mayer wrote:
> On 18 June 2017 at 07:05, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Tue, Jun 13, 2017 at 03:37:09PM -0700, Markus Mayer wrote:
>>> From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>
>>> Provide bindings for the Broadcom STB DDR PHY Front End (DPFE).
>>>
>>> Signed-off-by: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/soc/bcm/brcm,dpfe-cpu.txt  | 27 ++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,dpfe-cpu.txt
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Thanks, Rob.
> 
> To bring up the previous discussion regarding enumerating multiple
> nodes (so far we need two dpfe nodes for some platforms), how should
> we go about this? We were originally proposing to use "cell-index",
> but you said this was OpenFirmware only and couldn't be used in device
> tree. See https://lkml.org/lkml/2017/4/27/574.
> 
> We do need to use something, because the driver needs to know if it
> should be accessing dpfe0 or dpfe1. What should we use?

Would aliases work for instance for that purpose?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

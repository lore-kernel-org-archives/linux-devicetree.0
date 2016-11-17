From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Thu, 17 Nov 2016 10:54:18 -0800
Message-ID: <f32528d5-2f14-7ee3-63d8-4aef827eb1c1@synopsys.com>
References: <cover.1479339900.git.johnyoun@synopsys.com>
 <7fa1c1c4d703c435d698cdf140c9d43163347f1d.1479339900.git.johnyoun@synopsys.com>
 <874m36tkgz.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <874m36tkgz.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/17/2016 3:28 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>> Add the "snps,ahb-burst" binding and read it in.
>>
>> This property controls which burst type to perform on the AHB bus as a
>> master in internal DMA mode. This overrides the legacy param value,
>> which we need to keep around for now since several platforms use it.
>>
>> Some platforms may see better or worse performance based on this
>> value. The HAPS platform is one example where all INCRx have worse
>> performance than INCR.
>>
>> Other platforms (such as the Canyonlands board) report that the default
>> value causes system hangs.
>>
>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> 
> it's getting rather late for this merge window. I still need an ack by
> Rob or any of the devicetree folks.
> 

Sure, no problem if it doesn't make it.

Regards,
John

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Tue, 10 Jan 2017 15:23:24 -0800
Message-ID: <f2b75acc-4773-e420-53ff-a77d0c9bce31@synopsys.com>
References: <cover.1479339900.git.johnyoun@synopsys.com>
 <19255165.1fIP7jmgm1@debian64>
 <e8fa98c7-0dbc-7be7-be54-b2a9114bc289@synopsys.com>
 <1822229.eVKB2DLXUI@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1822229.eVKB2DLXUI@debian64>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1/10/2017 3:03 PM, Christian Lamparter wrote:
> On Tuesday, January 10, 2017 1:46:56 PM CET John Youn wrote:
>> On 12/19/2016 6:49 AM, Christian Lamparter wrote:
>>> (Lot's of old stuff, that doesn't matter anymore)
> 
> Hello John,
>  
>> This should be fixed against the latest dwc2 param rework series [1]
>> which i hope to get queued for 4.11. If you can give it a test, that
>> would be great.
> 
> oh Ok. I see you added it to
> "[PATCH 16/21] usb: dwc2: Remove platform static params" [0].
> Yes, I think this should work nicely. Thank you very much for
> your time, even though it's just for like "one old board" :-).

No problem. Sorry for the delay getting the param stuff sorted.

> 
> Do you have a public git tree with your patches that I can
> clone/checkout?  If not, I'll take some time on the weekend
> for this and write back on monday. But yeah, this should 
> work.

Yes check here on branch 'next'

https://github.com/synopsys-usb/linux.git

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

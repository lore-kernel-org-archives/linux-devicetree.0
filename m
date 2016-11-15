From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/3] usb: dwc2: params revert and rework
Date: Tue, 15 Nov 2016 11:37:39 -0800
Message-ID: <038597b5-2d49-3b62-493b-72588683c1fe@synopsys.com>
References: <cover.1479176826.git.johnyoun@synopsys.com>
 <87polxugfo.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87polxugfo.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/15/2016 3:33 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>> Hi Felipe,
>>
>> This reverts and fixes a few commits that are queued on your
>> testing/next, removing the previously added DT bindings, and the code
>> that reads them in.
>>
>> The feedback was that IP validation is not reason enough to add these.
>> So we'll leave them out for now.
> 
> these are still in testing/next, so I can actually still drop
> them. I'm applying only patch 3/3, please make sure it all looks good on
> testing/next.
> 

Ok thanks. There were merge issues when I did that locally so I
figured I'd give you the reverts.

Checked and looks good.

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3: add quirk to handle DWC_USB3_NUM ==
 DWC_USB3_NUM_IN_EPS
Date: Fri, 20 Jan 2017 14:19:46 +0000
Message-ID: <84fbc0f7-3624-699b-337b-1839818d3738@nexus-software.ie>
References: <1484855882-4936-1-git-send-email-pure.logic@nexus-software.ie>
 <87mvemx0so.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE300772909021B3FEC4C@US01WEMBX2.internal.synopsys.com>
 <71877fff-11b1-0a27-8170-ff42ace181cd@nexus-software.ie>
 <871svy9bl1.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <871svy9bl1.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20/01/17 12:10, Felipe Balbi wrote:
>>> And unfortunately, whether this is set or not is not visible to the
>>> software so it will require a quirk.
>>
>> but arrived at this conclusion because I couldn't think of a reasonable
>> guess value for IN/OUT endpoint numbers that would work if
>> DWC_USB3_NUM_EPS == DWC_USB3_NUM_IN_EPS
> 
> Well, we can, for now at least, take the simple approach of half IN,
> half OUT. If DWC3_USB3_NUM_EPS is odd, then OUT should take the extra
> endpoint. If anybody complains, we can fix it later ;-)

Sure, works just as well for me either way.

---
bod


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

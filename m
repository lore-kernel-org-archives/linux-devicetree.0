From: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3: add quirk to handle DWC_USB3_NUM ==
 DWC_USB3_NUM_IN_EPS
Date: Fri, 20 Jan 2017 09:57:31 +0000
Message-ID: <71877fff-11b1-0a27-8170-ff42ace181cd@nexus-software.ie>
References: <1484855882-4936-1-git-send-email-pure.logic@nexus-software.ie>
 <87mvemx0so.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE300772909021B3FEC4C@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2B3535C5ECE8B5419E3ECBE300772909021B3FEC4C-Yu2iAY70zvrYN67daEjeMPufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19/01/17 22:49, John Youn wrote:

> So it is valid to have say, DWC_USB3_NUM_EPS=8 and
> DWC_USB3_NUM_IN_EPS=8. Even though it is not possible to use all 8 EPs
> as IN since you need at least one of them to be a control OUT. So you
> could have a configuration of EP0 IN and OUT plus 6 IN EPs (total 1
> OUT, 7 IN). Or EP0 IN and OUT plus any other combination of IN/OUT for
> the remaining 6 EPs.
> 
> With the above in mind, you can probably just redo the endpoint number
> logic in dwc3 to handle all cases without any quirks at all.

I thought of that.

> If it is disabled, it will fix the physical and logical EP number and
> direction of the available EPs to meet timings for FPGA designs. This
> shouldn't be used in final designs for ASICS but we don't know for
> sure whether it has made it to any final designs or not.
> 
> And unfortunately, whether this is set or not is not visible to the
> software so it will require a quirk.

but arrived at this conclusion because I couldn't think of a reasonable
guess value for IN/OUT endpoint numbers that would work if
DWC_USB3_NUM_EPS == DWC_USB3_NUM_IN_EPS


thanks

---
bod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

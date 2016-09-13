From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] usb: dwc3: Added a property to set GFLADJ register
Date: Tue, 13 Sep 2016 12:12:00 -0700
Message-ID: <39809403-0b2b-09d9-452d-9689505ecff7@synopsys.com>
References: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun@synopsys.com>
 <649b249e86e901b5bd2cf4cbe9db96d04a45f30d.1472764828.git.johnyoun@synopsys.com>
 <20160912153018.GA14561@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160912153018.GA14561@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 9/12/2016 8:30 AM, Rob Herring wrote:
> On Thu, Sep 01, 2016 at 02:32:33PM -0700, John Youn wrote:
>> From: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>
>> Added gfladj variable to control the core behavior with respect to
>> SOF, ITP, and frame timer functionality.
>>
>> Currently there is dwc->fladj that holds a single field in GFLADJ
>> register (GFLADJ.GFLADJ_30MHZ). A new variable gfladj is added to
>> dwc structure to allow setting of the entire GFLADJ register. If
>> dwc->gfladj is set, then it has a higher priority than dwc->fladj
>> when writing to the GFLADJ register.
> 
> I'm not a fan of magic register values for DT properties.
> 

Sure. Felipe gave the same feedback. We'll fix it.

> How many fields in this register that you will ever need to touch?
> 
>> Synopsys HW setup (HAPS DX and phy board) requires a preset to this
>> register to improve interoperablitity. For example, the value for
>> GFLADJ_REFCLK_LPM_SEL should be set to 0 with ref_clk period of 50.
> 
> This sounds like it should be handled in the driver. Is it a simple, 
> constant correlation of ref_clk period to this value?

I don't know. I'll look into it.

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

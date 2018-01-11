From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 14/15] usb: dwc3: Add disabling of start_transfer failure quirk
Date: Thu, 11 Jan 2018 08:35:35 -0600
Message-ID: <CAL_JsqK0_Ww_v=rgUb8QqNtMwgAcdR7ZKSMgqavqQqtOLr4q9Q@mail.gmail.com>
References: <cover.1515182391.git.thinhn@synopsys.com> <3c63b5f97343d276049e1d59ef2371160004b137.1515182391.git.thinhn@synopsys.com>
 <20180109041602.f4tk5jynnno2xgvk@rob-hp-laptop> <87incbzaia.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87incbzaia.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 9, 2018 at 2:45 AM, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Hi,
>
> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>> On Fri, Jan 05, 2018 at 12:16:02PM -0800, Thinh Nguyen wrote:
>>> In DWC_usb31 version 1.70a-ea06 and prior needs a SW workaround for isoc
>>> START TRANSFER command failure. However, some affected versions may have
>>> RTL patches to fix this without a SW workaround. Add this quirk to
>>> disable the SW workaround when it is not needed.
>>
>> I really think this one should be implied by compatible strings.
>
> won't work for dwc3. Core driver has a single compatible string, also
> this wouldn't work for PCI-based implementations.

Then you will have to look at the parent node (this is why the way
DWC3 was split is wrong) or make the compatible strings more specific.
That is the purpose of compatible strings.

For PCI, don't you have different VID/PIDs? If not how would quirks
work for non-DT systems.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

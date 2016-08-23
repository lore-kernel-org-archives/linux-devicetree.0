From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 03/22] usb: ulpi: Support device discovery via device properties
Date: Tue, 23 Aug 2016 18:06:26 -0500
Message-ID: <CAL_JsqKPgVEr8zuaO7f8NczuxdCqa9ceg+PnVpOBxiT=Lr79eA@mail.gmail.com>
References: <20160707222114.1673-1-stephen.boyd@linaro.org>
 <20160707222114.1673-4-stephen.boyd@linaro.org> <20160718022355.GA8568@rob-hp-laptop>
 <147043320014.26915.7483025835695600714@sboyd-linaro> <CAJOFmgwTPDwdL_cc7f5N09enZNhKwSkWAxdpF39vOBQLfEdVSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJOFmgwTPDwdL_cc7f5N09enZNhKwSkWAxdpF39vOBQLfEdVSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 23, 2016 at 3:00 PM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Aug 5, 2016 at 2:40 PM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Quoting Rob Herring (2016-07-17 19:23:55)
>>> On Thu, Jul 07, 2016 at 03:20:54PM -0700, Stephen Boyd wrote:
>>> > +-------
>>> > +
>>> > +usb {
>>> > +     compatible = "vendor,usb-controller";
>>> > +
>>> > +     ulpi {
>>> > +             phy {
>>> > +                     compatible = "vendor,phy";
>>> > +                     ulpi-vendor = /bits/ 16 <0x1d6b>;
>>> > +                     ulpi-product = /bits/ 16 <0x0002>;
>>> > +             };
>>> > +     };
>>>
>>> I'm still having concerns about describing both phys and devices. If I
>>> have a controller with 2 ports and 2 devices attached, I'd have
>>> something like this under the USB controller:
>>>
>>> ulpi {
>>>         phy@1 {
>>>         };
>>>         phy@2 {
>>>         };
>>> };
>>
>> My understanding is there would only be one status="ok" node on the ULPI
>> bus for the single phy that a usb controller would have. At the least,
>> the kernel's ULPI layer only seems to support one ULPI phy for a
>> controller right now. So even if there are two ports, it doesn't mean
>> there are two phys.
>>
>>>
>>> dev@1 {
>>> ...
>>> };
>>>
>>> dev@2 {
>>> ...
>>> };
>>>
>>>
>>> That doesn't seem the best, but I don't have a better suggestion. Maybe
>>> the device nodes need to go under the phy nodes?
>>>
>>
>> What if we moved the dev@1 and dev@2 to another sub node like "ports" or
>> "usb-devices"? Legacy code can support having those devices directly
>> underneath the usb controller, but future users would always need to put
>> them in a different sub-node so that we can easily differentiate the
>> different busses that a usb controller node may support?
>>
>> I'm not sure I see any need to relate the phy to the ports that are on
>> the controller, but if that is needed then perhaps you're right and we
>> should move the ports underneath the phy. USB core could be modified to
>> go through the legacy path or through the phy, if it even exists, to
>> find ports.
>>
>> Do we typically do this for other phy designs like sata or pci? The phy
>> always seemed like a parallel thing to the logical bus that the phy is
>> used for.
>
> Rob does this sound ok to you?

Well, if there's only ever 1 phy under the controller, then as you had
it is fine.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

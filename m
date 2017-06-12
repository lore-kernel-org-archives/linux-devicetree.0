From: Al Cooper <al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: Add Broadcom STB USB PHY binding document
Date: Mon, 12 Jun 2017 16:53:12 -0400
Message-ID: <CAGh=XAAdMm6oGUjDNkiT_oK43gEK8_n+q1ynWo=e8+H7_g9wgw@mail.gmail.com>
References: <1496426512-10590-1-git-send-email-alcooperx@gmail.com>
 <1496426512-10590-3-git-send-email-alcooperx@gmail.com> <20170608221104.7nsinggo4vngbmus@rob-hp-laptop>
 <CAGh=XAAzbrNUopwsxQeXfRXi9gd=J4mdG-6UqTJ+-ikd=xqGig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGh=XAAzbrNUopwsxQeXfRXi9gd=J4mdG-6UqTJ+-ikd=xqGig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 12, 2017 at 4:19 PM, Al Cooper <al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On Thu, Jun 8, 2017 at 6:11 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> +- brcm,device: String, PHY Device mode.
>>> +  Possible values are: off (Host), on (Device), dual (DRD)
>>> +  or typec-pd (Type-C PD control)
>>
>> I believe we have standard property for this though maybe not type C.
>>
>> off/on seem strange for meaning host/device as well.
>
> I'll change this to:
>
> mode: String, PHY Device mode.
> Possible values are: "host", "device", "drd" or "typec-pd"

I just found "dr_mode" in Documentation/devicetree/bindings/usb/generic.txt.
I'd like to change this to:

dr_mode: String, PHY Device mode.
Possible values are: "host", "device", "drd" or "typec-pd"

I used a standard property name ("dr_mode") and 2 of the standard
values ("host", "device") and added 2 new values "drd" and "typec_pd".

Thanks
Al
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

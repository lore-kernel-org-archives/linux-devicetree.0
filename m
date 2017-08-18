From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 03/16] dmaengine: bcm-sba-raid: Common flags for
 sba_request state and fence
Date: Fri, 18 Aug 2017 10:26:54 +0530
Message-ID: <CAALAos8HhiGO3XHDS3ia5G51TmYWGeY9aSzCBDoWKSqr195Meg@mail.gmail.com>
References: <1501583880-32072-1-git-send-email-anup.patel@broadcom.com>
 <1501583880-32072-4-git-send-email-anup.patel@broadcom.com> <20170817034534.GY3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170817034534.GY3053@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 9:15 AM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Aug 01, 2017 at 04:07:47PM +0530, Anup Patel wrote:
>> This patch merges sba_request state and fence into common
>> sba_request flags. Also, in-future we can extend sba_request
>> flags as required.
>
> and it also changes the flag values to bits, which I have no idea why that
> was done, care to explain that please...

I thought its better to have separate bit each sba_request state so
that when a sba_request is accidentally in two states then we can
debug better.

I will restore state values.

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

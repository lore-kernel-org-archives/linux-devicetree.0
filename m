From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH (v4) 2/2] mtd: brcmnand: Add support for the BCM63268
Date: Mon, 23 Nov 2015 10:22:47 -0800
Message-ID: <56535977.9050201@gmail.com>
References: <56506D55.3000907@simon.arlott.org.uk> <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk> <56523EFF.9050502@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56523EFF.9050502-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22/11/15 14:17, Simon Arlott wrote:
> The BCM63268 has a NAND interrupt register with combined status and enable
> registers. It also has a clock for the NAND controller that needs to be
> enabled.
> 
> Set up the device by enabling the clock, disabling and acking all
> interrupts, then handle the CTRL_READY interrupt.
> 
> Add a "device_remove" function to struct brcmnand_soc so that the clock
> can be disabled when the device is removed.
> 
> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
> ---
> On 22/11/15 21:59, Rob Herring wrote:
>>>>> + * "brcm,nand-bcm63268"
>>>>> + - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
>>>
>>> vendor,<soc>-device is preferred.
> 
> The existing two bindings use brcm,nand-<soc>, but I've changed this one.

Could we stick with the existing binding naming convention of using:

brcm,nand-<soc> just so automated tools or other things can match this
one too, and +1 for consistency?

Other than, that, same comment as Jonas, why do we we need the
device_remove callback to be called from the main driver down to this one?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

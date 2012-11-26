From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Mon, 26 Nov 2012 11:17:18 +0000
Message-ID: <20121126111718.A44E43E0A01@localhost>
References: <38620644.IyR5R8rjKP@percival>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <38620644.IyR5R8rjKP@percival>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 31 Oct 2012 18:04:09 +0900, Alex Courbot <acourbot@nvidia.com> wrote:
> Hi,
> 
> Would anyone be opposed to having a gpio_get() function that works similarly 
> to e.g. regulator_get() and clk_get()?
> 
> I can see some good reasons to have this:
> 
> - Less platform data to pass to drivers,
> - Consistency between different subsystems. Regulator, clock, PWM, ... all use 
> this scheme.
> - The "device-specific indirection" could make some DT structures more 
> reusable. Right now the only way to address a GPIO through the DT is via a 
> phandle that includes the GPIO number - thus hard-coded.
> 
> The implementation would be rather simple, and the function would just return 
> the right GPIO number (acquired through gpio_request).

I've got no problem with it, but the devil is in the API details. Draft
something up (unless you already have and I just haven't seen it yet...
I'll get to it).  :-)

BTW, I would prefer a system that resolves the gpio at .probe() time
instead of at registration time. That makes deferred probing easier.

g.

> 
> Rationale for this: I would like to be able to share power sequences between 
> devices, e.g. to completely extract the per-device resources from the 
> sequence. Every power sequence step references either a regulator, PWM, or 
> GPIO. For regulators and PWMs separation is easy because their subsystems 
> provide regulator_get() and pwm_get() which allow the resource to be 
> referenced by name in the sequence, and resolved to different instances 
> depending on the device. GPIOs, on the other hand, can only be referenced by 
> number - and that makes it necessary to duplicate the sequence's structure in 
> memory for every device that may use it. It if was possible to reference GPIOs 
> by names that resolve to different GPIO numbers according to the device, then 
> the problem would be solved.
> 
> There are probably other use-cases that would benefit from this, if you know of 
> one please feel free to share.
> 
> Thanks,
> Alex.
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.

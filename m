From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 13:28:27 -0700 (PDT)
Message-ID: <20090527.132827.65331718.davem@davemloft.net>
References: <9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
	<20090527192116.GA31110@n2100.arm.linux.org.uk>
	<20090527193927.GD30039@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527193927.GD30039-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Date: Wed, 27 May 2009 21:39:27 +0200

> when you have to support the same driver for non OF and OF platform it's
> really a pain in the ass

We could embed the platform_device object into the of_platform_device
structure, it's just an implementation issue.

But more to the point, I can tell you that anything platform_device
does can be implemented in terms of of_platform_device but the
opposite is not true.

Actually, I kind of appreciate the existence of both kinds of objects.
When you're instantiating LEDs or similar small devices on a MDIO
bus, and the LED driver has to work on OF and non-OF platforms,
I see nothing wrong with using platform devices for instantiation.
And I've done this myself for system LED devices on sparc64 boxes.

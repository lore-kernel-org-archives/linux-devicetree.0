From: Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 17:41:47 +0200
Message-ID: <87vdnm8sec.fsf@macbook.be.48ers.dk>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527150527.GK6805-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (Robert Schwebel's message
	of "Wed\, 27 May 2009 17\:05\:27 +0200")
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>>>> "Robert" == Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

Hi,

 Robert> - The whole concept is based on the assumption that bindings
 Robert> are defined *once*, then never to be changed again. As this
 Robert> is not true (check MPC5200 to find out what I mean), oftree
 Robert> wreckage is *the* main cause of new kernels not working on
 Robert> old bootloaders any more. Is there a solution of this
 Robert> problem? I have not seen a good idea how to avoid the
 Robert> constant change in definitions.

Just bundle the .dtb with the kernel and they'll always be in sync. I
know this isn't really in the spirit of OF, but currently imho the
only realistic solution.

I did a (nacked) patch to do this with the multi-image support in
U-Boot some time ago:

http://patchwork.ozlabs.org/patch/589/

 Robert> - The oftree layering is fundamentally broken. We already
 Robert> have a sane abstraction for arbitrary hardware in the kernel:
 Robert> platform devices.  Why not instanciate platform devices from
 Robert> a generic oftree core?

 Robert> - Platform data makes it possible to store function
 Robert> pointers. There is no equivalent to this concept in
 Robert> oftree-land.

Yeah.

-- 
Bye, Peter Korsgaard

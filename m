From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Tue, 28 Oct 2008 11:15:11 +1100
Message-ID: <20081028001511.GD26424@yookeroo.seuss>
References: <4900ED81.3040202@genesi-usa.com> <4900F90B.80703@firmworks.com>
	<4901032F.3090805@genesi-usa.com> <49011C42.2020101@firmworks.com>
	<20081024032944.GE4267@yookeroo.seuss>
	<49014C69.8020408@firmworks.com>
	<20081024044511.GI4267@yookeroo.seuss>
	<490248C2.9020104@genesi-usa.com>
	<20081026234747.GD22339@yookeroo.seuss>
	<4905E0DC.104@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4905E0DC.104-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 27, 2008 at 10:40:12AM -0500, Matt Sealey wrote:
>
>
> David Gibson wrote:
>
>> Um.. I can't actually follow what you're getting at there, sorry.
>
> Imagine in your head that you have a GPIO controller that has a
> 32-bit register potentially controlling 32 pins on the chip.
>
> Imagine that rather than being able to allocate 6 GPIO pins
> *right next to each other* in the register and saying that
> you start at "pin" 15 and use the next 6 "pins", you have to
> spread it around and use pin 1, pin 8, pin 9, pin 11, pin 15,
> pin 30, to make up this peripheral.
>
> As far as I can tell there is no way at all to specify a set of
> GPIO pins which are NOT consecutive because the current GPIO
> spec stops after specifying a controller bank (the 32-bit
> register).

Uh.. no.  The gpio specifier has a format that's gpio controller
specific, but it must include the actual pin number, although exactly
how it's encoded might vary.

So, you use
	gpios = <&controller pin1-specifier &controller pin8-specifier
		 &controller pin9-specifier &controller pin11-specifier
		 &controller pin15-specifier &controller pin30-specifier>;

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

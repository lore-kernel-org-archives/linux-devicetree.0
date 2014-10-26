From: Lee Jones <ljkenny-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bcm2835: add VideoCore Mailbox to the device tree
Date: Sun, 26 Oct 2014 15:22:46 +0000
Message-ID: <20141026152245.GB11689@x1>
References: <1414156805-30253-1-git-send-email-lkundrak@v3.sk>
 <20141024155321.GF10395@x1>
 <544C6204.50607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <544C6204.50607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 25 Oct 2014, Stephen Warren wrote:

> On 10/24/2014 09:53 AM, Lee Jones wrote:
> > On Fri, 24 Oct 2014, Lubomir Rintel wrote:
> > 
> >> Follows the generic Mailbox Controller bindings as documented in
> >> Documentation/devicetree/bindings/mailbox/mailbox.txt.
> >>
> >> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> >> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> >> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> ---
> >>  arch/arm/boot/dts/bcm2835.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> >> index 3342cb1..bd046a9 100644
> >> --- a/arch/arm/boot/dts/bcm2835.dtsi
> >> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> >> @@ -50,6 +50,13 @@
> >>  			#interrupt-cells = <2>;
> >>  		};
> >>  
> >> +		mailbox: mailbox@0x7e00b880 {
> > 
> > Remove the 0x.
> > 
> >> +			compatible = "brcm,bcm2835-mbox";
> >> +			reg = <0x7e00b880 0x40>;
> >> +			interrupts = <0 1>;
> > 
> > 2 interrupts one cell right?  No flags?
> 
> The DT binding says 1 IRQ in the list, and the interrupt controller in
> bcm2835.dtsi has 2 cells per IRQ.
> 
> Whether that's all the IRQs the HW has for this HW module, I don't know.

Okay, so guessing <BANK INT> then.  Very well, thanks for answering.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

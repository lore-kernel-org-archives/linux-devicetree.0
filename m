From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv2] ARM: mvebu: Add Netgear ReadyNAS 2120 board
Date: Tue, 12 Nov 2013 15:11:09 -0500
Message-ID: <20131112201109.GT10335@titan.lakedaemon.net>
References: <87ppq5flnb.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87ppq5flnb.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 08:46:48PM +0100, Arnaud Ebalard wrote:
> 
> All hardware parts of the (mv78230 Armada XP based) NETGEAR ReadyNAS
> 2120 are supported by mainline kernel (USB 3.0 and eSATA rear ports,
> USB 2.0 front port, Gigabit controller and PHYs for the two rear ports,
> serial port, LEDs, Buttons, 88SE9170 SATA controllers, three G762 fan
> controllers, G751 temperature sensor) except for:
> 
>  - the Intersil ISL12057 I2C RTC Chip,
>  - the Armada NAND controller.
> 
> Support for both of those is currently work in progress and does not
> prevent boot.
> 
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
> Hi,
> 
> Initial message:
>  
>   This one is intended for v3.14. This depends on the recent fix I pushed
>   for mv78230 PCIe and also on a small patch Guenter Roeck just accepted
>   to have lm75 driver support GMT G751 Temperature sensor (see 
>   https://lkml.org/lkml/2013/11/9/273).
>   
>   Regarding the SATA presence and power pin definitions under pinctrl
>   node if you wonder, I thought it would not harm to have them for
>   reference even though they are currently not used. FWIW, I am currently
>   looking if a GPIO regulator can make any use of those.
>  
> 
> Note changed since v2 (i.e. kept for later cleanup session):

I presume s/Note/Not/ ?  Otherwise, I'm really confused. :)

>  - move clocks = <&coreclk 0> in serial node to armada-370-xp.dtsi
>  - add a label to most SoC nodes to avoid replaying the whole node hierarchy
>  - see if g762 dt binding can be fixed (no remarks done during review)

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

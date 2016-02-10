From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] irqchip: lpc32xx: add LPC32xx irqchip driver
Date: Wed, 10 Feb 2016 19:45:25 +0000 (UTC)
Message-ID: <loom.20160210T204046-649@post.gmane.org>
References: <1447982925-30138-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Vladimir Zapolskiy <vz@...> writes:
> 
> The change adds wakeup controller platform driver and irqchip driver
> for NXP LPC32xx boards.
 
Hi Vladimir,

Just to let you know that we did some testing using this changeset;
I tested the change on 4.5-rc1 with patch 4 to 7, 10 & 11 from:
http://permalink.gmane.org/gmane.linux.drivers.devicetree/144671

I was able to run our software (I2C SIC1 interrupt enable)
without any problem on a custom LPC32xx board.

I did not test the other SIC1 interrupt sources that were
generating issue previously (i.e. breaks the kernel with
the message "unexpected IRQ trap at vector 00").

We did not get any problem with the MIC interrupts we are using.

> Vladimir Zapolskiy (10):
>   dt-bindings: create arm/nxp folder and move LPC32xx SoC description to it
>   dt-bindings: nxp: add description of wakeup controller on LPC32xx
>   dt-bindings: interrupt-controllers: add description of SIC1 and SIC2
>   arm: lpc32xx: add wakeup platform driver
>   arm: dts: lpc32xx: assign interrupt types
>   arm: dts: lpc32xx: add description of IC wakeup controllers
>   arm: dts: lpc32xx: reparent SIC1 and SIC2 interrupts from MIC
>   irqchip: add LPC32xx interrupt controller driver
>   irqchip: lpc32xx: add option to wakeup from an interrupt
>   arm: dts: lpc32xx: enable SIC1 and SIC2 by default

Sylvain Lemieux

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

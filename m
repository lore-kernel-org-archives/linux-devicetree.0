From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/11] clk: lpc32xx: add clock support for NXP LPC32xx
Date: Tue, 9 Feb 2016 21:01:41 +0000 (UTC)
Message-ID: <loom.20160209T215103-78@post.gmane.org>
References: <1447981511-29653-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Vladimir Zapolskiy <vz@...> writes:
> 
> This changeset adds common clock framework driver for NXP LPC32xx
> boards.

Hi Vladimir,

Just to let you know that we did some testing using this changeset;
I installed patches 4 to 7, 10 & 11 on top of 4.5-rc1.

I was able to run our software (SIC1 interrupt sources disable)
without any problem a custom LPC32xx board.

We did not get any problem with the clock signals we are using.

Sylvain Lemieux
 
> Vladimir Zapolskiy (11):
>   dt-bindings: clock: add description of LPC32xx clock controller
>   dt-bindings: clock: add description of LPC32xx USB clock controller
>   dt-bindings: clock: add NXP LPC32xx clock list for consumers
>   arm: dts: lpc32xx: add device nodes for external oscillators
>   arm: dts: lpc32xx: add clock controller device node
>   arm: dts: lpc32xx: add clock properties to device nodes
>   arm: dts: lpc32xx: add USB clock controller
>   clk: lpc18xx: add NXP specific common clock framework selection
>   clk: lpc32xx: add common clock framework driver
>   arm: lpc32xx: switch to common clock framework
>   arm: dts: lpc32xx: remove clock frequency property from UART device
>     nodes




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

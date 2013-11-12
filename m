From: =?iso-8859-15?q?J=FCrgen_Beisert?= <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/4] DT: Add binding for Altera FPGAs in passive-serial mode
Date: Tue, 12 Nov 2013 15:51:15 +0100
Message-ID: <201311121551.15343.jbe@pengutronix.de>
References: <1384266701-12608-1-git-send-email-s.hauer@pengutronix.de> <1384266701-12608-4-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384266701-12608-4-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 12 November 2013 15:31:40 Sascha Hauer wrote:
> [...]
> +Required properties:
> +- compatible: shall be "altr,passive-serial"
> +- reg: SPI chip select
> +- nstat-gpio: Specify GPIO for controlling the nstat pin
> +- confd-gpio: Specify GPIO for controlling the confd pin
> +- nconfig-gpio: Specify GPIO for controlling the nconfig pin

A suggestion was to use the genuine signal names at the FPGA side:

 "nstatus", "config-done" and "nconfig" (all with the trailing "-gpio")

jbe

--=20
Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| Juergen Beisert =A0 =A0 =A0 =A0 =A0 =A0 |
Linux Solutions for Science and Industry =A0 =A0 =A0| http://www.pengut=
ronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

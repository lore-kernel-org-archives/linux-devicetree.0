From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 3/4] DT: Add binding for Altera FPGAs in passive-serial mode
Date: Tue, 12 Nov 2013 10:21:02 -0600
Message-ID: <C90E2E36-D168-4374-B420-38B2BB1914BD@codeaurora.org>
References: <1384266701-12608-1-git-send-email-s.hauer@pengutronix.de> <1384266701-12608-4-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384266701-12608-4-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Nov 12, 2013, at 8:31 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrot=
e:

> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> .../devicetree/bindings/firmware/altr,passive-serial.txt    | 13 ++++=
+++++++++
> 1 file changed, 13 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/firmware/altr,pa=
ssive-serial.txt
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/altr,passive-=
serial.txt b/Documentation/devicetree/bindings/firmware/altr,passive-se=
rial.txt
> new file mode 100644
> index 0000000..6d40c91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/altr,passive-serial.=
txt
> @@ -0,0 +1,13 @@
> +Altera FPGAs in passive serial mode
> +-----------------------------------
> +
> +This binding defines the control interface to Altera FPGAs in
> +passive serial mode. This is used to upload the firmware and
> +to start the FPGA.
> +
> +Required properties:
> +- compatible: shall be "altr,passive-serial=94

This doesn=92t seem quite descriptive enough, easy to confuse with a se=
rial port.

> +- reg: SPI chip select

Is this a SPI device than?

> +- nstat-gpio: Specify GPIO for controlling the nstat pin
> +- confd-gpio: Specify GPIO for controlling the confd pin
> +- nconfig-gpio: Specify GPIO for controlling the nconfig pin
> --=20
> 1.8.4.2
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

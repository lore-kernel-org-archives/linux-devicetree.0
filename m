From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V3 2/5] dts/imx6q-b850v3: Configure IPU assignment order
Date: Mon, 01 Aug 2016 10:54:07 +0200
Message-ID: <1470041647.6640.3.camel@pengutronix.de>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
	 <cover.1469993472.git.peter.senna@collabora.com>
	 <7e5985c0b25505eeaf50294ea04ed750c6c0f576.1469993472.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7e5985c0b25505eeaf50294ea04ed750c6c0f576.1469993472.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andrey.gusakov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Sonntag, den 31.07.2016, 21:55 +0200 schrieb Peter Senna Tschudin:
> As the IPU has combined limitations across multiple crtcs, and as that
> can't be communicated to userspace at the moment, reorder the crtcs to
> allow support to two Full-HD monitors by avoiding assigning two
> monitors to a single IPU.
> 
> Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

NACK. This is a userspace issue. Changing the assignment order of the
CRTCs just shifts the failure to a userspace that want to use CRTC 0 and
2 now.

imx-drm just got atomic support and with the atomic check it should be
possible to inform userspace in a reasonable way about such issues.

Regards,
Lucas

> ---
> Unchanged from V2.
> 
> Changes from V1:
>  - New commit message
> 
>  arch/arm/boot/dts/imx6q-b850v3.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
> index 167f744..88a70de 100644
> --- a/arch/arm/boot/dts/imx6q-b850v3.dts
> +++ b/arch/arm/boot/dts/imx6q-b850v3.dts
> @@ -51,6 +51,11 @@
>  	chosen {
>  		stdout-path = &uart3;
>  	};
> +
> +	display-subsystem {
> +		compatible = "fsl,imx-display-subsystem";
> +		ports = <&ipu1_di0>, <&ipu2_di0>, <&ipu1_di1>, <&ipu2_di1>;
> +	};
>  };
>  
>  &clks {


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

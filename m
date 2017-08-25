From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] rtc: v3020: Add documentation for DT bindings
Date: Fri, 25 Aug 2017 16:54:57 -0500
Message-ID: <20170825215457.qcd5paiw5qtuybxv@rob-hp-laptop>
References: <b832db93-9885-adfe-39b4-1950851b391d@mothictech.com>
 <660fa006-4f91-2fb5-ef98-ba0482e1ecff@mothictech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <660fa006-4f91-2fb5-ef98-ba0482e1ecff-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 05:05:47PM -0400, Brandon Martin wrote:
> Document the DT bindings for the rtc-v3020 driver.  MMIO and GPIO
> attachment modes are both supported via DT.
> 
> Signed-off-by: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/rtc-v3020.txt          | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-v3020.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-v3020.txt b/Documentation/devicetree/bindings/rtc/rtc-v3020.txt
> new file mode 100644
> index 000000000000..8b32e6a79960
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-v3020.txt
> @@ -0,0 +1,38 @@
> + EM Micro v3020 RTC
> +~~~~~~~~~~~~~~~~~~~~
> +
> +Required properties:
> +  - compatible : "emmicro,v3020"
> +
> +Required for MMIO connection:
> +  - reg : should contain registers location and length.

Looking at the datasheet, there's really no such thing. You'd have to 
have some specialized h/w to generate the serial waveform.

> +
> +Required for GPIO connection:
> +- emmicro,use-gpio
> +- cs-gpios, wr-gpios, rd-gpios, io-gpios : specify gpios connected to
> +  corresponding pins of the RTC
> +
> +Optional properties:
> +- emmicro,mmio-left-shift : data bit to which IO line is connected for MMIO
> +  connection (defaults to 0)

This has come up several times on RTCs (LP8841, DS1302). This really 
looks like SPI and could probably use the spi-gpio bitbang driver. 

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

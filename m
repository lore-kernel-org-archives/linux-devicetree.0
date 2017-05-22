From: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev-rev-b: add hi8435 device
Date: Mon, 22 May 2017 19:29:14 +0300
Message-ID: <076f6258-f0b4-6ba5-9670-e2c0582a92b5@cogentembedded.com>
References: <20170522131010.3537-1-nikita.yoush@cogentembedded.com>
 <a74ee28c1c62fee5a5e75dda70a02990@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a74ee28c1c62fee5a5e75dda70a02990-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>, Jeff White <Jeff.White-c8ZVq/bFV1I@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>> +	hi8435@1 {
>> +		compatible = "holt,hi8435";
>> +		reg = <1>;
>> +		spi-max-frequency = <20000000>;
>> +		gpios = <&gpio5 3 0>;
> 
> Nit: GPIO_ACTIVE_HIGH instead of 0?

Gray area here.

Chip's reset input is active LOW.

However, hi8435 driver historically was coded using inverted values
passed to gpiolib calls.  And there are setups in the wild with device
trees containing GPIO_ACTIVE_HIGH that I'd prefer not breaking.

To solve, I submitted a patch on hi8435 driver that changes to _raw()
gpio calls (thus making it independent of what is written in device
tree), and want [future] device trees not to contain explicitly written
gpio polarity.

Far not ideal but better than device trees explicitly stating
GPIO_ACTIVE_HIGH while it is active low.

Nikita
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

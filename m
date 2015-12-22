From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx7d: cl-som-imx7: add basic module
 support
Date: Tue, 22 Dec 2015 16:07:51 +0200
Message-ID: <56795937.6090903@compulab.co.il>
References: <1449472479-2521-1-git-send-email-ilya@compulab.co.il>
 <1450772120-18131-1-git-send-email-ilya@compulab.co.il>
 <1450772120-18131-2-git-send-email-ilya@compulab.co.il>
 <20151222121718.GB26290@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151222121718.GB26290@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On 12/22/15 14:17, Shawn Guo wrote:
> On Tue, Dec 22, 2015 at 10:15:19AM +0200, Ilya Ledvich wrote:

[...]

>> +/ {
>> +	model = "CompuLab CL-SOM-iMX7";
>> +	compatible = "compulab,cl-som-imx7", "fsl,imx7d";
>> +
>> +	memory {
>> +		reg = <0x80000000 0x10000000>; /* 256 MB - minimal configuration */
>> +	};
>> +
>> +	regulators {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> 
> DT maintainers dislike this fake "simple-bus" container, and we were
> asked to put fixed regulator directly under root.  I fixed it up like
> below:
> 
> 	reg_usb_otg1_vbus: regulator-vbus {
> 		compatible = "regulator-fixed";
> 		regulator-name = "usb_otg1_vbus";
> 		regulator-min-microvolt = <5000000>;
> 		regulator-max-microvolt = <5000000>;
> 		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
> 		enable-active-high;
> 	};
> 

Looks good! Thanks for adjusting this.

[...]

-- 
Regards,
Igor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

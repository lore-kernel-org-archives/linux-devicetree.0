From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: sabrelite: use simple-panel instead of
 display-timings for LVDS0
Date: Tue, 19 May 2015 09:51:23 -0700
Message-ID: <555B6A0B.4010205@boundarydevices.com>
References: <20150518075844.7e1b5916@ipc1.ka-ro>	 <1432050616-11465-1-git-send-email-eric.nelson@boundarydevices.com>	 <1432050616-11465-3-git-send-email-eric.nelson@boundarydevices.com> <1432051452.15181.48.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432051452.15181.48.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/19/2015 09:04 AM, Philipp Zabel wrote:
> Hi Eric,
> 
> Am Dienstag, den 19.05.2015, 08:50 -0700 schrieb Eric Nelson:
>> Also add label for backlight_lvds and connect it to the LVDS display.
>>
>> Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
>> ---
> [...]
>> @@ -129,6 +129,17 @@
>>  		power-supply = <&reg_3p3v>;
>>  		status = "okay";
>>  	};
>> +
>> +	panel {
>> +		compatible = "hannstar,hsd100pxn1";
>> +		backlight = <&backlight_lvds>;
>> +
>> +		port {
>> +			panel_in: endpoint {
>> +				remote-endpoint = <&lvds0_out>;
>> +			};
>> +		};
>> +	};
>>  };
>>  
>>  &audmux {
>> @@ -374,18 +385,11 @@
>>  		fsl,data-width = <18>;
> 
> The fsl,data-width property shouldn't be needed anymore if you
> set .bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG for the hsd100pxn1
> panel in panel-simple.c.
> 

Thanks again Philipp.

That's a much better place to put it, since this is a panel feature,
not a feature of the LVDS channel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6q-utilite-pro: enable 2nd display pipeline
Date: Tue, 17 Jan 2017 19:35:09 +0100
Message-ID: <9175c3b9abc24d348eca65afd15aa11e@rwthex-s1-b.rwth-ad.de>
References: <ec9676f344eb4786a28a3c7b969f0e94@rwthex-s1-b.rwth-ad.de>
 <88bdfd5321484efc82af4132ac2f0d7e@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <88bdfd5321484efc82af4132ac2f0d7e-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

thanks for the review!

On 01/17/2017 09:57 AM, Philipp Zabel wrote:
> [...]
>> +
>> +	parallel-display {
>> +		compatible = "fsl,imx-parallel-display";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_ipu1>;
>> +
>> +		interface-pix-fmt = "rgb24";
>
> This is not necessary if the connector created by the tpf410 has the
> correct media bus format set in its display_info structure. This can be
> done in tfp410_attach, before calling drm_mode_connector_attach_encoder:
>
>         u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>
> 	drm_display_info_set_bus_formats(&dvi->connector.display_info,
> 					 &bus_format, 1);
>
> After this is done, the above line should be removed in a follow-up
> patch.

Ok, I will send a mini follow-up series doing that with your 
Suggested-by (unless you object) in the next few days.

Cheers,
Christopher

>> +		port@0 {
>> +			reg = <0>;
>> +
>> +			parallel_display_in: endpoint {
>> +				remote-endpoint = <&ipu1_di0_disp0>;
>> +			};
>> +		};
>> +
>> +		port@1 {
>> +			reg = <1>;
>> +
>> +			parallel_display_out: endpoint {
>> +				remote-endpoint = <&tfp410_in>;
>> +			};
>> +		};
>> +	};
>>  };
>>  [...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 16/24] media: Add i.MX media core driver
Date: Tue, 24 Jan 2017 12:39:19 +0100
Message-ID: <1485257959.3600.108.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
         <1483755102-24785-17-git-send-email-steve_longerbeam@mentor.com>
         <1484320822.31475.96.camel@pengutronix.de>
         <2b1d2418-1ad4-6373-cb07-c3aeab48187f@gmail.com>
         <aaefdb64-5d45-a225-f764-b06ebda73264@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <aaefdb64-5d45-a225-f764-b06ebda73264-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@me>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-01-18 at 17:44 -0800, Steve Longerbeam wrote:
> 
> On 01/14/2017 02:42 PM, Steve Longerbeam wrote:
> >
> >>> +/* parse inputs property from a sensor node */
> >>> +static void of_parse_sensor_inputs(struct imx_media_dev *imxmd,
> >>> +				   struct imx_media_subdev *sensor,
> >>> +				   struct device_node *sensor_np)
> >>> +{
> >>> +	struct imx_media_sensor_input *sinput = &sensor->input;
> >>> +	int ret, i;
> >>> +
> >>> +	for (i = 0; i < IMX_MEDIA_MAX_SENSOR_INPUTS; i++) {
> >>> +		const char *input_name;
> >>> +		u32 val;
> >>> +
> >>> +		ret = of_property_read_u32_index(sensor_np, "inputs", i, &val);
> >>> +		if (ret)
> >>> +			break;
> >>> +
> >>> +		sinput->value[i] = val;
> >>> +
> >>> +		ret = of_property_read_string_index(sensor_np, "input-names",
> >>> +						    i, &input_name);
> >>> +		/*
> >>> +		 * if input-names not provided, they will be set using
> >>> +		 * the subdev name once the sensor is known during
> >>> +		 * async bind
> >>> +		 */
> >>> +		if (!ret)
> >>> +			strncpy(sinput->name[i], input_name,
> >>> +				sizeof(sinput->name[i]));
> >>> +	}
> >>> +
> >>> +	sinput->num = i;
> >>> +
> >>> +	/* if no inputs provided just assume a single input */
> >>> +	if (sinput->num == 0)
> >>> +		sinput->num = 1;
> >>> +}
> >> This should be parsed by the sensor driver, not imx-media.
> >
> > you're probably right. I'll submit a patch for adv7180.c.
> 
> Actually, the problem here is that this parses an input routing value to
> pass to s_routing, and an input name string. There would need to be
> another subdev callback, maybe enum_imput, that would return this
> information for the bridge driver, if this info were to be parsed and
> maintained by the sensor.
> 
> But this info should really be known and parsed by the bridge anyway,
> because as the header for s_routing states,
> 
> "An i2c device shouldn't know about whether an input pin is connected
>   to a Composite connector, because on another board or platform it
>   might be connected to something else entirely. The calling driver is
>   responsible for mapping a user-level input to the right pins on the i2c
>   device."

I think this description is for non-DT only, as parsing the DT bindings
is the obligation of the bound driver, and with that it information it
can very well know its connections.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

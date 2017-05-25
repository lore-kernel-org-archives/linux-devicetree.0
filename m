From: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev-rev-b: add hi8435 device
Date: Thu, 25 May 2017 11:06:47 +0300
Message-ID: <eb86f383-3c27-2276-6213-99c5143420f5@cogentembedded.com>
References: <20170522131010.3537-1-nikita.yoush@cogentembedded.com>
 <20170525070007.GU26102@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170525070007.GU26102@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>, Jeff White <Jeff.White-c8ZVq/bFV1I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>> +&edma1 {
>> +	status = "okay";
>> +};
>> +
>> +&dspi2 {
> 
> Please keep these labelled nodes sort alphabetically.

Ok

>> +	bus-num = <1>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_dspi2>;
>> +	status = "okay";
> 
> We usually have 'status' line at the bottom of property list.

Ok

>> +	spi-num-chipselects = <2>;
>> +
>> +	hi8435@1 {
> 
> Node name should be something generic, while label can be specific
> model name.  The following form might be better.
> 
> 	hi8435: sensor@1

Ok

Although the same file, in lines nearby, has m25p128@0 and at93c46d@1.

Anyway let's delay this a bit, up to the reset polarity description
thing in hi8435 is resolved.

Nikita

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

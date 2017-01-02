From: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ARM: dts: imx6: Add Savageboard common file
Date: Mon, 2 Jan 2017 16:49:16 +0900
Message-ID: <2de3ba17-91d7-65c2-9a8e-897a8b96d8d8@gmail.com>
References: <20161209010436.7994-1-woogyom.kim@gmail.com>
 <20161209010436.7994-2-woogyom.kim@gmail.com> <20170102065239.GC20956@dragon>
 <450d89c7-7459-6369-3a07-cc60d70de0db@gmail.com>
 <20170102074422.GH20956@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170102074422.GH20956@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 01/02/2017 04:44 PM, Shawn Guo wrote:
> On Mon, Jan 02, 2017 at 04:31:07PM +0900, Milo Kim wrote:
>>
>> On 01/02/2017 03:52 PM, Shawn Guo wrote:
>>>> +	panel {
>>>> +		compatible = "avic, tm097tdh02", "hannstar,hsd100pxn1";
>>> "avic, tm097tdh02" is an undocumented compatible.
>>>
>>
>> AVIC TM097TDH02 panel is compatible with Hannstar HSD100PXN1, so I
>> reuse it. It's the same rule as the usage of imx6q I2C controller.
>>
>> 	i2c2: i2c@021a4000 {
>> 		compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
>> 	};
>
> Forgot to ask, is the "avic" Shanghai AVIC Optoelectronics Co., Ltd. as
> documented in vendor-prefixes.txt?

Yes, right.

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

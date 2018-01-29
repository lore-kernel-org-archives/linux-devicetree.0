From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: update the Allwinner
 GPADC device tree binding for H3 & A83T
Date: Mon, 29 Jan 2018 13:30:20 +0100
Message-ID: <a107f74a-00dd-26e5-69df-0a62a4cf8525@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-2-embed3d@gmail.com>
 <20180129091937.w3c3btvva5yaqlf6@flea.lan>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRBYFHXTJQKGQED6CM4WQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180129091937.w3c3btvva5yaqlf6-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

>> +Example for A33:
>>   	ths: ths@1c25000 {
>>   		compatible = "allwinner,sun8i-a33-ths";
>>   		reg = <0x01c25000 0x100>;
>> @@ -17,6 +40,27 @@ Example:
>>   		#io-channel-cells = <0>;
>>   	};
>>   
>> +Example for H3:
>> +	ths: thermal-sensor@1c25000 {
>> +		compatible = "allwinner,sun8i-h3-ths";
>> +		reg = <0x01c25000 0x400>;
>> +		clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_THS>;
>> +		clock-names = "bus", "mod";
>> +		resets = <&ccu RST_BUS_THS>;
>> +		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +		#thermal-sensor-cells = <0>;
>> +		#io-channel-cells = <0>;
>> +	};
>> +
>> +Example for A83T:
>> +	ths: thermal-sensor@1f04000 {
>> +		compatible = "allwinner,sun8i-a83t-ths";
>> +		reg = <0x01f04000 0x100>;
>> +		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>> +		#thermal-sensor-cells = <1>;
>> +		#io-channel-cells = <0>;
>> +	};
>> +
> 
> I'm wondering if this is actually needed. We've used this convoluted
> constructs to be compatible with the old driver, but I'm not sure this
> is actually worth it now, and this is causing several issues, among
> which:
>    - We need to have a bunch of quirks to handle all the DT cases.
>    - We need to have an MFD, which isn't really optimal
> 
> So I'd rather introduce a new compatible for the old SoCs, keep the
> old driver around, and simplify a lot that driver code that will ease
> further developments. And we can also get rid of the MFD in the
> process. I discussed it with Quentin, and he was ok with it, what do
> you think?
> 
> (and that would involve creating a new file for the bindings you
> introduce here).
> 
> Maxime
> 

I think this is a good idea, and the desired way to rework the driver.

To sum up what we talked on IRC:

This will end up in removing the MFD driver and moving the interrupt 
handling into the iio driver. At the end this will also simplify the IRQ 
part.

Philipp

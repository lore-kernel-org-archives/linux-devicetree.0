From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: Re: [PATCH v3] ARM: dts: qcom: Add initial IFC6540 board device tree
Date: Fri, 05 Sep 2014 18:59:10 +0300
Message-ID: <5409DDCE.7080106@mm-sol.com>
References: <1409763031-16873-1-git-send-email-gdjakov@mm-sol.com> <5409C803.8060007@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5409C803.8060007@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, galak@codeaurora.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, iivanov@mm-sol.com
List-Id: devicetree@vger.kernel.org

Hi

On 09/05/2014 05:26 PM, Andreas F=E4rber wrote:
<...>
>> +			reg-names =3D "hc_mem", "core_mem";
>> +			interrupts =3D <0 123 0>, <0 138 0>;
>
> I see that you've used GPIO_ACTIVE_* above. Is the trailing zero here
> possibly IRQ_TYPE_NONE?
>

Yes, it is. Will update it. Thanks!

>> +			interrupt-names =3D "hc_irq", "pwr_irq";
>> +			clocks =3D <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names =3D "core", "iface";
>> +			status =3D "disabled";
>> +		};
>> +
>> +		sdhci@f98a4900 {
>> +			compatible =3D "qcom,sdhci-msm-v4";
>> +			reg =3D <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
>> +			reg-names =3D "hc_mem", "core_mem";
>> +			interrupts =3D <0 125 0>, <0 221 0>;
>> +			interrupt-names =3D "hc_irq", "pwr_irq";
>> +			clocks =3D <&gcc GCC_SDCC2_APPS_CLK>, <&gcc GCC_SDCC2_AHB_CLK>;
>> +			clock-names =3D "core", "iface";
>> +			status =3D "disabled";
>> +		};
>
> If you assign labels to these two nodes, you can reference them in th=
e
> .dts as &labelname {...};. Same for the uart node. That avoids
> duplicating the hierarchy, detects spelling mistakes at compile time =
and
> reduces indentation. Cf. the recent ifc6410 patch.

Sure, adding a label will not hurt.

>
> Also, is sdhci the best node name here? Usually it's not supposed to
> reflect the exact interface used (e.g., usb vs. ehci).
>

Ok, I'll figure out something better.

>>   	};
>>   };
>
> Otherwise looks good.
>

Thanks for reviewing!

BR,
Georgi

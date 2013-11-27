From: Fugang Duan <fugang.duan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v3 3/3] Documentation: add the binding file for
 Freescale vf610 ADC driver
Date: Wed, 27 Nov 2013 01:38:12 +0000
Message-ID: <9848F2DB572E5649BA045B288BE08FBE018988D9@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1385463394-11157-1-git-send-email-B38611@freescale.com>
 <1385463394-11157-4-git-send-email-B38611@freescale.com>
 <20131126133737.GA5402@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131126133737.GA5402-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo [mailto:shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
Data: Tuesday, November 26, 2013 9:38 PM

>To: Duan Fugang-B38611
>Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Li
>Frank-B20596; linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>Subject: Re: [PATCH v3 3/3] Documentation: add the binding file for Freescale
>vf610 ADC driver
>
>On Tue, Nov 26, 2013 at 06:56:34PM +0800, Fugang Duan wrote:
>> +Optional properties:
>> +- fsl,adc-io-pinctl: Enable field for the I/O port control of MCU pins used
>as analog inputs.
>> +- fsl,adc-vref: ADC refrence voltage value, unit is uV.
>> +- fsl,adc-clk-div: Current clock divider value, such as 1,2,4,8,16 and so on.
>> +- fsl,adc-res: ADC conversion mode selection, such as 8 for 8-bit, 10 for
>10-bit, 12 for 12-bit mode.
>> +- fsl,adc-sam-time: ADC sample time duration, number of ADC clocks, such as
>2, 4, 6, 8, 12, 16, 20, 24
>> +- fsl,adc-aver-sam-sel: Determines how many ADC conversions will be averaged
>to create the ADC average result.
>> +			The Optional value is 4, 8, 16, 32.
>> +- fsl,adc-hw-aver-en: Bool type to decide enable hardware average function.
>> +- fsl,adc-low-power-mode: Bool type to decide enable ADC low power mode.
>> +- fsl,adc-high-speed-conv: Bool type to decide enable ADC high speed mode.
>> +- vref: The regulator to support ADC refrence voltage.
>
>Shouldn't it be vref-supply?
>
>Shawn

It is vref-supply.

Thanks.

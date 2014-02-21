From: "fugang.duan-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fugang.duan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v5 1/3] ARM: dts: vf610-twr: Add ADC support
Date: Fri, 21 Feb 2014 05:17:20 +0000
Message-ID: <da1f0ce0784e434d8a384aa34e271a18@BLUPR03MB373.namprd03.prod.outlook.com>
References: <1390714773-23066-1-git-send-email-B38611@freescale.com>
 <1390714773-23066-2-git-send-email-B38611@freescale.com>
 <20140216074850.GA2946@S2101-09.ap.freescale.net>
 <20140219050716.GA3010@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140219050716.GA3010-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org" <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Data: Wednesday, February 19, 2014 1:07 PM + 0800

>To: Duan Fugang-B38611
>Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org;
>lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Rob Herring;
>Grant Likely; Pawel Moll; Ian Campbell; Kumar Gala; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>Subject: Re: [PATCH v5 1/3] ARM: dts: vf610-twr: Add ADC support
>
>On Sun, Feb 16, 2014 at 03:48:53PM +0800, Shawn Guo wrote:
>> Copy more DT folks and lists, as I want to make sure everyone agrees
>> on how the fixed regulators should organized in the device tree
>> sources, before I apply the patch.
>>
>> On Sun, Jan 26, 2014 at 01:39:31PM +0800, Fugang Duan wrote:
>> > vf610 has two ADC controllers, and vf610-twr board ADC0_SE5 pin
>> > connect to sliding rheostat for ADC test, other ADC pins connect to
>> > connectors for future use.
>> >
>> > Add support for ADC0_SE5.
>> >
>> > CC: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > CC: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> > CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> > CC: Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
>> > CC: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
>> > CC: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
>> > Signed-off-by: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > ---
>> >  arch/arm/boot/dts/vf610-twr.dts |   21 +++++++++++++++++++++
>> >  arch/arm/boot/dts/vf610.dtsi    |   26 ++++++++++++++++++++++++++
>> >  2 files changed, 47 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/vf610-twr.dts
>> > b/arch/arm/boot/dts/vf610-twr.dts index c8047ca..d867be3 100644
>> > --- a/arch/arm/boot/dts/vf610-twr.dts
>> > +++ b/arch/arm/boot/dts/vf610-twr.dts
>> > @@ -34,6 +34,27 @@
>> >  		};
>> >  	};
>> >
>> > +	regulators {
>> > +		compatible = "simple-bus";
>> > +		#address-cells = <1>;
>> > +		#size-cells = <0>;
>> > +
>> > +		reg_vcc_3v3_mcu: regulator@0 {
>> > +			compatible = "regulator-fixed";
>> > +			reg = <0>;
>> > +			regulator-name = "vcc_3v3_mcu";
>> > +			regulator-min-microvolt = <3300000>;
>> > +			regulator-max-microvolt = <3300000>;
>> > +		};
>> > +	};
>>
>> Per discussion [1], Mark Rutland suggests that instead of organizing
>> the fixed regulator nodes in a simple-bus container, it should be put
>> under root node directly like below.
>>
>> / {
>> 	reg_vcc_3v3_mcu: regulator_0 {
>> 		compatible = "regulator-fixed";
>> 		regulator-name = "vcc_3v3_mcu";
>> 		regulator-min-microvolt = <3300000>;
>> 		regulator-max-microvolt = <3300000>;
>> 	};
>> };
>>
>> Is this what all DT folks agree on?  At least the node name should be
>> 'regulator-0' since it's more idiomatic to use '-' than '_' in node
>> name?
>
>It looks that Mark is giving up [1].  And we're fine with the original code
>then.
>
>Shawn

So, you apply the original patch ? Do I need to resend it again ?

Thanks,
Andy

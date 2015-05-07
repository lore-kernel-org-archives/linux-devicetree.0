From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Gateworks GW5510 support (i.MX6)
Date: Thu, 7 May 2015 08:21:19 -0700
Message-ID: <CAJ+vNU2shCeyfOPYHJUb3CxFAQzHsLoR7STL_y_3uscu1Ag8Jg@mail.gmail.com>
References: <1430409691-15963-1-git-send-email-tharvey@gateworks.com>
	<CAOMZO5Aa67XvmgBU0ABVZSE36V_=Hj2PMsW=TDbxzNr4Ka_GsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5Aa67XvmgBU0ABVZSE36V_=Hj2PMsW=TDbxzNr4Ka_GsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 30, 2015 at 9:46 AM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Tim,
>
> On Thu, Apr 30, 2015 at 1:01 PM, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org> wrote:
>
>> +++ b/arch/arm/boot/dts/imx6dl-gw551x.dts
>> @@ -0,0 +1,19 @@
>> +/*
>> + * Copyright 2014 Gateworks Corporation
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>> + */
>
> The recommendation for new dts files is to use a dual-license type scheme.
>
> Please check imx6sl-warp for an example.
>
>> +       regulators {
>> +               compatible = "simple-bus";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               reg_5p0v: regulator@0 {
>> +                       compatible = "regulator-fixed";
>> +                       reg = <0>;
>> +                       regulator-name = "5P0V";
>> +                       regulator-min-microvolt = <5000000>;
>> +                       regulator-max-microvolt = <5000000>;
>> +                       regulator-always-on;
>
> This ' regulator-always-on' can be removed. Same applies to the other
> occurrences.

Fabio,

Thanks for the review. I'll post a v2 with these changes.

Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

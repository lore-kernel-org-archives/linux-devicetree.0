From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: cm-fx6: add SATA support
Date: Mon, 27 Jan 2014 11:06:47 +0200
Message-ID: <52E621A7.7030201@compulab.co.il>
References: <1390320812-25100-1-git-send-email-grinberg@compulab.co.il> <1390320812-25100-3-git-send-email-grinberg@compulab.co.il> <20140127073754.GB4765@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140127073754.GB4765-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/27/14 09:37, Shawn Guo wrote:
> On Tue, Jan 21, 2014 at 06:13:30PM +0200, Igor Grinberg wrote:
>> Enable SATA on cm-fx6.
>>
>> Signed-off-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx6q-cm-fx6.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
>> index 94cc6b5..07f90a5 100644
>> --- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
>> +++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
>> @@ -69,3 +69,7 @@
>>  	pinctrl-0 = <&pinctrl_uart4>;
>>  	status = "okay";
>>  };
>> +
>> +&sata {
>> +	status = "okay";
>> +};
> 
> Please sort these labeled nodes alphabetically.

Ok.

I'll wait for the "pingrp macros" to settle down and resend.

Thanks!

-- 
Regards,
Igor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

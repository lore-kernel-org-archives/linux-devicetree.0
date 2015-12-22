From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx7d: sbc-imx7: add basic board support
Date: Tue, 22 Dec 2015 16:13:18 +0200
Message-ID: <56795A7E.2000100@compulab.co.il>
References: <1449472479-2521-1-git-send-email-ilya@compulab.co.il>
 <1450772120-18131-1-git-send-email-ilya@compulab.co.il>
 <1450772120-18131-3-git-send-email-ilya@compulab.co.il>
 <20151222121920.GC26290@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151222121920.GC26290@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/22/15 14:19, Shawn Guo wrote:
> On Tue, Dec 22, 2015 at 10:15:20AM +0200, Ilya Ledvich wrote:

[...]

>> +&iomuxc {
>> +	cl-som-imx7 {
> 
> This container should be dropped too.  Please check my imx/dt branch for
> the fixup I made.

Ahhh... Sorry, we've messed this up...
While removing the redundant container from the other patch,
this one was forgotten...
Sorry about this. Will pay more attention next time.

I've checked out your imx/dt branch and both patches look good.
Thanks for fixing this for us!

> 
> Shawn
> 
>> +		pinctrl_usdhc1: usdhc1grp {
>> +			fsl,pins = <
>> +				MX7D_PAD_SD1_CMD__SD1_CMD		0x59
>> +				MX7D_PAD_SD1_CLK__SD1_CLK		0x19
>> +				MX7D_PAD_SD1_DATA0__SD1_DATA0		0x59
>> +				MX7D_PAD_SD1_DATA1__SD1_DATA1		0x59
>> +				MX7D_PAD_SD1_DATA2__SD1_DATA2		0x59
>> +				MX7D_PAD_SD1_DATA3__SD1_DATA3		0x59
>> +				MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x59 /* CD */
>> +				MX7D_PAD_SD1_WP__GPIO5_IO1		0x59 /* WP */
>> +			>;
>> +		};
>> +	};
>> +};
>> -- 
>> 1.9.1
>>
>>
> 

-- 
Regards,
Igor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

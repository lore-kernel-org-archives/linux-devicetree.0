From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v7 3/7] ARM: dts: imx: Add Advantech BA-16 Qseven module
Date: Thu, 4 Feb 2016 18:41:07 -0500
Message-ID: <56B3E193.8090603@timesys.com>
References: <1454109558-22800-1-git-send-email-akshay.bhat@timesys.com>
 <1454109558-22800-4-git-send-email-akshay.bhat@timesys.com>
 <20160203144051.GQ8307@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160203144051.GQ8307@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/03/2016 09:40 AM, Shawn Guo wrote:
> On Fri, Jan 29, 2016 at 06:19:14PM -0500, Akshay Bhat wrote:
>> +&ssi1 {
>> +	fsl,mode = "i2s-master";
>
> In Documentation/devicetree/bindings/sound/fsl,ssi.txt, I do not see
> 'i2s-master' as a valid value for fsl,mode property.
>
> Shawn
>
Will fix this in the next rev (was copied over from an older kernel).

Is there a tool to find such errors (to help catch these errors before 
submitting it)?

Thanks,
Akshay

>> +	status = "okay";
>> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

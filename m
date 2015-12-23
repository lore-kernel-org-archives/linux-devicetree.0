From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 3/7] ARM: dts: imx: Add Advantech BA-16 Qseven module
Date: Wed, 23 Dec 2015 17:22:41 -0500
Message-ID: <567B1EB1.40208@timesys.com>
References: <1449177036-13317-1-git-send-email-akshay.bhat@timesys.com>
 <1449177036-13317-4-git-send-email-akshay.bhat@timesys.com>
 <20151222113742.GA26290@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151222113742.GA26290@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/22/2015 06:40 AM, Shawn Guo wrote:
> On Thu, Dec 03, 2015 at 04:10:32PM -0500, Akshay Bhat wrote:

>> +
>> +	rtc@32 {
>> +		compatible = "epson,rx8010";
>
> Is this compatible string documented somewhere?
>
Patches have been submitted to update the documentation for the above 
string along with a couple others that were missing/incorrect:

http://marc.info/?l=linux-i2c&m=145089597514804&w=2
http://marc.info/?l=linux-i2c&m=145089715915019&w=2
http://marc.info/?l=linux-i2c&m=145089835615289&w=2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

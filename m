From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 6/7] ARM: dts: imx: Add support for Advantech/GE B650v3
Date: Thu, 28 Jan 2016 13:54:26 -0500
Message-ID: <56AA63E2.5090103@timesys.com>
References: <1450908016-17384-1-git-send-email-akshay.bhat@timesys.com>
 <1450908016-17384-7-git-send-email-akshay.bhat@timesys.com>
 <20160128061919.GG9070@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160128061919.GG9070@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 01/28/2016 01:19 AM, Shawn Guo wrote:
> On Wed, Dec 23, 2015 at 05:00:15PM -0500, Akshay Bhat wrote:
>> Add support for Advantech/GE B650v3 board.
>>
>> Signed-off-by: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/Makefile         |   1 +
>>   arch/arm/boot/dts/imx6q-b650v3.dts | 114 +++++++++++++++++++++++++++++++++++++
>
> I compare it with imx6q-b450v3.dts.  They are basically identical except
> model name and compatible string.  What are the differences between
> these two boards from hardware POV?  Can we support them with one
> dts/dtb, so that we can save one duplicated dts?
>
> Shawn

The boards are different form factors. Since the hardware layout is 
different there are some board specific imx6 register settings needed 
(eg: usb phy settings, pcie gpr8 settings etc.).  We are in the process 
of submitting imx driver patches for the same and expect the 
imx6q-b450v3.dts and imx6q-b650v3.dts to be different in the near 
future. Hence would like to keep them separate.

https://patchwork.ozlabs.org/patch/568166/

Thanks,
Akshay
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

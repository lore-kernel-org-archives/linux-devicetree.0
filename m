From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/5] rtc: armada38x: Add the device tree binding documentation
Date: Thu, 15 Jan 2015 08:50:07 +0100
Message-ID: <54B7712F.2090509@free-electrons.com>
References: <1421257155-3379-1-git-send-email-gregory.clement@free-electrons.com>	<1421257155-3379-2-git-send-email-gregory.clement@free-electrons.com> <20150114202252.457d328e@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150114202252.457d328e-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On 14/01/2015 20:22, Thomas Petazzoni wrote:
> Dear Gregory CLEMENT,
> 
> On Wed, 14 Jan 2015 18:39:11 +0100, Gregory CLEMENT wrote:
> 
>> +Required properties:
>> +- compatible : Should be "marvell,armada-380-rtc"
>> +- reg: physical base address of the controller and length of memory
>> +  mapped region, associated to the reg-name "rtc". The other entry is
>> +  related to the interrupt control from the SoC, associated to the
>> +  reg-name "soc-interrupt".
> 
> soc-interrupt or...

I changed all the name from soc-interrupt to soc-int except here.
I will fix it.

> 
>> +- reg-names: names of the mapped memory regions listed in regs
>> +    property in the same order: "rtc" and "soc-int".
> 
> soc-int ?
> 
>> +rtc@a3800 {
>> +	compatible = "marvell,armada-380-rtc";
>> +	reg = <0xa3800 0x20>, <0x184a0 0x0c>;
> 
> Any reason to use <0x184A0 0xC> instead of <0x184A8 0x4> ? According to
> the datasheet, there is only this 184A8 register for RTC stuff.

Yes but according to the code I saw there were other registers related to the RTC
from 0x184A0. Even if we don't use them now I prefer having an accurate mapping from
the beginning for avoiding using negative offset as we needed to do in the past.

Thanks,

Gregory


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

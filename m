From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 4/5] dmaengine: mv_xor: Allow selecting mv_xor for mvebu only compatible SoC
Date: Wed, 13 Apr 2016 14:24:25 +0200
Message-ID: <874mb51yti.fsf@free-electrons.com>
References: <1460485158-32122-1-git-send-email-gregory.clement@free-electrons.com>
	<1460485158-32122-5-git-send-email-gregory.clement@free-electrons.com>
	<20160412183536.GJ27057@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160412183536.GJ27057-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org> (Jason Cooper's
	message of "Tue, 12 Apr 2016 18:35:36 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Romain Perier <romain.perier-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason,
 
 On mar., avril 12 2016, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:

> On Tue, Apr 12, 2016 at 08:19:17PM +0200, Gregory CLEMENT wrote:
>> Armada 3700 SoC uses the mv_xor driver but don't select anymore the
>> PLAT_ORION symbol. This commit extends the dependency of the mv_xor
>> driver to the more modern SoCs only compatible with ARCH_MVEBU, which
>> allows using it with the Armada 3700 SoC.
>> 
>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  drivers/dma/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
>> index d96d87c56f2e..cdc50c2c172f 100644
>> --- a/drivers/dma/Kconfig
>> +++ b/drivers/dma/Kconfig
>> @@ -332,7 +332,7 @@ config MPC512X_DMA
>>  
>>  config MV_XOR
>>  	bool "Marvell XOR engine support"
>> -	depends on PLAT_ORION
>> +	depends on PLAT_ORION || ARCH_MVEBU
>
> || COMPILE_TEST ?

OK and I've just test that it can be compiled on x86 without error or
warning. I am going to send a v3 with this modification.

Thanks,

Gregory

>
> thx,
>
> Jason.

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

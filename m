From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 3/4] powerpc/mpc85xx: Add FSL QorIQ DPAA BMan support
 to device tree(s)
Date: Wed, 3 Dec 2014 01:53:39 -0600
Message-ID: <547EC183.2070005@Freescale.com>
References: <1417428135-12895-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1417428135-12895-4-git-send-email-Emilian.Medve@Freescale.com>
 <1417566777.15957.227.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417566777.15957.227.camel-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Geoff Thorpe <Geoff.Thorpe-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Hai-Ying Wang <Haiying.Wang-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Chunhe Lan <Chunhe.Lan-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Poonam Aggrwal <poonam.aggrwal-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Scott,


On 12/02/2014 06:32 PM, Scott Wood wrote:
> On Mon, 2014-12-01 at 04:02 -0600, Emil Medve wrote:
>> diff --git a/arch/powerpc/boot/dts/t4240rdb.dts b/arch/powerpc/boot/dts/t4240rdb.dts
>> index 53761d4..431bf4e 100644
>> --- a/arch/powerpc/boot/dts/t4240rdb.dts
>> +++ b/arch/powerpc/boot/dts/t4240rdb.dts
>> @@ -69,10 +69,27 @@
>>  		device_type = "memory";
>>  	};
>>  
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		bman_fbpr: bman-fbpr {
>> +			compatible = "fsl,bman-fbpr";
>> +			alloc-ranges = <0 0 0xffff 0xffffffff>;
>> +			size = <0 0x1000000>;
>> +			alignment = <0 0x1000000>;
>> +		};
>> +	};
> 
> Can't this be done at the SoC level rather than board level?

The size of the memory is not SoC specific. Among other things is
determined by the number of MACs that are pinned-out on the board


Cheers,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

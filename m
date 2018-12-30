From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 3/3] sh_eth: add R8A77980 support
Date: Sun, 30 Dec 2018 23:15:38 +0300
Message-ID: <4b552371-543c-c475-5eef-e8c0f055a008@cogentembedded.com>
References: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
 <a0dec765-3196-c09d-b41c-c1eb3025a8ad@cogentembedded.com>
 <1a075eb3-0575-5df9-c49d-7642930360c1@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1a075eb3-0575-5df9-c49d-7642930360c1@cogentembedded.com>
Content-Language: en-MW
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/30/2018 08:24 PM, Sergei Shtylyov wrote:

>> Finally, add support for the DT probing of the R-Car V3H (AKA R8A77980) --
>> it's the only R-Car gen3 SoC having the GEther controller -- others have
>> only EtherAVB...
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>>
> [...]
>> Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
>> ===================================================================
>> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
>> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c
>> @@ -753,6 +753,49 @@ static struct sh_eth_cpu_data rcar_gen2_
>>  	.rmiimode	= 1,
>>  	.magic		= 1,
>>  };
>> +
>> +/* R8A77980 */
>> +static struct sh_eth_cpu_data r8a77980_data = {
>> +	.soft_reset	= sh_eth_soft_reset_gether,
>> +
>> +	.set_duplex	= sh_eth_set_duplex,
>> +	.set_rate	= sh_eth_set_rate_gether,
>> +
>> +	.register_type  = SH_ETH_REG_GIGABIT,
>> +
>> +	.edtrr_trns	= EDTRR_TRNS_GETHER,
>> +	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD | ECSR_MPD,
>> +	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP |
>> +			  ECSIPR_MPDIP,
>> +	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
>> +			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
>> +			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
>> +			  EESIPR_RMAFIP | EESIPR_RRFIP |
>> +			  EESIPR_RTLFIP | EESIPR_RTSFIP |
>> +			  EESIPR_PREIP | EESIPR_CERFIP,
>> +
>> +	.tx_check       = EESR_FTC | EESR_CD | EESR_RTO,
>> +	.eesr_err_check = EESR_TWB1 | EESR_TWB | EESR_TABT | EESR_RABT |
>> +			  EESR_RFE | EESR_RDE | EESR_RFRMER |
>> +			  EESR_TFE | EESR_TDE | EESR_ECI,
>> +	.fdr_value	= 0x0000070f,
>> +
>> +	.apr		= 1,
>> +	.mpr		= 1,
>> +	.tpauser	= 1,
>> +	.bculr		= 1,
>> +	.hw_swap	= 1,
>> +	.nbst		= 1,
>> +	.rpadir		= 1,
>> +	.rpadir_value   = 2 << 16,
>> +	.no_trimd	= 1,
>> +	.no_ade		= 1,
>> +	.xdfar_rw	= 1,
>> +	.hw_checksum	= 1,
> 
>    Ugh, the "intelligent" checksum is not actually supported, just a simplistic
> checksum (from byte 14). I'll send a fix.

   Surprisingly, testing has shown that the manual is wrong and thus "intelligent"
checksumming is implemented. When I remove that flag, DHCP doesn't work.

>> +	.select_mii	= 1,
>> +	.magic		= 1,
>> +	.cexcr		= 1,
>> +};
>>  #endif /* CONFIG_OF */
>>  
>>  static void sh_eth_set_rate_sh7724(struct net_device *ndev)
> [...]

MBR, Sergei

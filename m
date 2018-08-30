From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH] ARM: dts: imx6ull: fix pinmux input_val for uart5 rx pin
Date: Thu, 30 Aug 2018 15:46:04 +0200
Message-ID: <1d81ae5d-7d55-c059-1e1a-d3efb3588c37@denx.de>
References: <20180830124702.12572-1-hs@denx.de>
 <218369fa-8ec1-fd3c-dd2e-b4821e11cb62@armadeus.com>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <218369fa-8ec1-fd3c-dd2e-b4821e11cb62@armadeus.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Sébastien,

Am 30.08.2018 um 15:25 schrieb Sébastien Szymanski:
> Hi,
> 
> On 08/30/2018 02:47 PM, Heiko Schocher wrote:
>> on the imx6ull the input_val for uart5 rx function
>> of pin MX6UL_PAD_UART5_RX_DATA__UART5_DCE_RX
>> is 7 and not 5 as on the imx6ul. With this
>> patch, console on an imx6ull based board works
>> with uart5.
>>
>> Signed-off-by: Heiko Schocher <hs@denx.de>
> 
> This is already fixed on v4.19-rc1 and also on a few others PADs that
> have similar issue.
> Moreover signals common for both i.MX6UL and i.MX6ULL should have
> IMX6UL_ as prefix:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit/?h=for-next&id=387301d5b88e2fe91de9baf4ca25f771cc633f70

My patch was based on current HEAD ...Ah, got it, this patch is in
"for-next"

Thanks! And sorry for the noise.

bye,
Heiko
> 
> Regards,
> 
>>
>> ---
>>
>>   arch/arm/boot/dts/imx6ull-pinfunc.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6ull-pinfunc.h b/arch/arm/boot/dts/imx6ull-pinfunc.h
>> index fdc46bb09cc1a..d835aeae5485b 100644
>> --- a/arch/arm/boot/dts/imx6ull-pinfunc.h
>> +++ b/arch/arm/boot/dts/imx6ull-pinfunc.h
>> @@ -61,5 +61,6 @@
>>   #define MX6ULL_PAD_CSI_DATA05__ESAI_TX_CLK                        0x01F8 0x0484 0x0000 0x9 0x0
>>   #define MX6ULL_PAD_CSI_DATA06__ESAI_TX5_RX0                       0x01FC 0x0488 0x0000 0x9 0x0
>>   #define MX6ULL_PAD_CSI_DATA07__ESAI_T0                            0x0200 0x048C 0x0000 0x9 0x0
>> +#define MX6ULL_PAD_UART5_RX_DATA__UART5_DCE_RX		0x00C0 0x034C 0x0644 0 7
>>   
>>   #endif /* __DTS_IMX6ULL_PINFUNC_H */
>>
> 
> 

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

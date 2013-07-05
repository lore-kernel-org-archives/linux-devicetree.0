From: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [RFC PATCH 03/13] ARM: at91: DTS: sam9x5: add clock for SSC DT entry
Date: Fri, 5 Jul 2013 17:16:50 +0200
Message-ID: <CACQ1gAjM+676e9srFOkbu2sBcYC25jszVuH0b7FvMm1DFc-sEQ@mail.gmail.com>
References: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com>
 <1372667978-4718-4-git-send-email-richard.genoud@gmail.com> <51D24366.5000101@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51D24366.5000101@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>
Cc: devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

2013/7/2 Bo Shen <voice.shen@atmel.com>:
> Hi Richard,
>
>
> On 7/1/2013 16:39, Richard Genoud wrote:
>>
>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> ---
>>   arch/arm/mach-at91/at91sam9x5.c |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-at91/at91sam9x5.c
>> b/arch/arm/mach-at91/at91sam9x5.c
>> index 2abee66..191eb4b 100644
>> --- a/arch/arm/mach-at91/at91sam9x5.c
>> +++ b/arch/arm/mach-at91/at91sam9x5.c
>> @@ -233,6 +233,7 @@ static struct clk_lookup periph_clocks_lookups[] = {
>>         CLKDEV_CON_DEV_ID("mci_clk", "f000c000.mmc", &mmc1_clk),
>>         CLKDEV_CON_DEV_ID("dma_clk", "ffffec00.dma-controller",
>> &dma0_clk),
>>         CLKDEV_CON_DEV_ID("dma_clk", "ffffee00.dma-controller",
>> &dma1_clk),
>> +       CLKDEV_CON_DEV_ID("pclk", "at91sam9g45_ssc.0", &ssc_clk),
>
>
> Actually, we don't use this anymore. Am I right?
correct !
I'll drop it.

Thanks,
Richard.

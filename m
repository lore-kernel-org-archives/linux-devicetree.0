From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH 3/6] OF: pinctrl: MIPS: lantiq: adds support for FALCON
 SoC
Date: Mon, 30 Jul 2012 11:41:20 +0200
Message-ID: <501656C0.9030609@openwrt.org>
References: <1343112660-12245-1-git-send-email-blogic@openwrt.org>	<1343112660-12245-3-git-send-email-blogic@openwrt.org> <CACRpkdYP8PdcnS2h_-+n9ZdBmMuBPUv9so9WsUyS-X5rMz1qsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYP8PdcnS2h_-+n9ZdBmMuBPUv9so9WsUyS-X5rMz1qsQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Thomas Langer <thomas.langer@lantiq.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 28/07/12 01:23, Linus Walleij wrote:
> On Tue, Jul 24, 2012 at 8:50 AM, John Crispin <blogic@openwrt.org> wrote:
>
>> Implement support for pinctrl on lantiq/falcon socs. The FALCON has 5 banks
>> of up to 32 pins.
>>
>> Signed-off-by: John Crispin <blogic@openwrt.org>
>> Signed-off-by: Thomas Langer <thomas.langer@lantiq.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: devicetree-discuss@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
> No big issues and looking really sweet so:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
>> --- a/arch/mips/lantiq/Kconfig
>> +++ b/arch/mips/lantiq/Kconfig
>> @@ -20,6 +20,7 @@ config SOC_XWAY
>>
>>  config SOC_FALCON
>>         bool "FALCON"
>> +       select PINCTRL_FALCON
> I think you need to add "select PINCTRL" above "select PINCTRL_FALCON"
> for this to work.
>
> Atleast I had to do that in the past to get things working.

Hi Linus,

config LANTIQ selects PINCTRL  globally for all Lantiq SoC so an
explicit select can be avoided here

Thanks for the review,
John

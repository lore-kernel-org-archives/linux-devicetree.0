From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/4] ARM: multi_v7_defconfig: enable UniPhier SoC family
Date: Sat, 18 Apr 2015 01:00:16 +0900
Message-ID: <CAK7LNAQ7rX7+YQHNmuXvRH7TKcVpNUdDRr5qUS6PYxPa=NYP0A@mail.gmail.com>
References: <1429170038-16757-1-git-send-email-yamada.masahiro@socionext.com>
 <1429170038-16757-3-git-send-email-yamada.masahiro@socionext.com>
 <3561768.u8t9ftxvsL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3561768.u8t9ftxvsL@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,


2015-04-16 18:42 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Thursday 16 April 2015 16:40:36 Masahiro Yamada wrote:
>> Add UniPhier, a new citizen in the ARM multi platform.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  arch/arm/configs/multi_v7_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index d7f038d..24005cf 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -81,6 +81,7 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>>  CONFIG_ARCH_TEGRA_114_SOC=y
>>  CONFIG_ARCH_TEGRA_124_SOC=y
>>  CONFIG_TEGRA_EMC_SCALING_ENABLE=y
>> +CONFIG_ARCH_UNIPHIER=y
>>  CONFIG_ARCH_U8500=y
>>  CONFIG_MACH_HREFV60=y
>>  CONFIG_MACH_SNOWBALL=y
>>
>
> Any additional device drivers you need?
>

Our drivers are still based-on old kernel version (pre-DT) with local
ugly hacking.
I need more time to re-write them based on the current coding style
(almost from scratch),
so I'd like to do it as a second round.

This series is just mainlining a minimal support with a serial console.
I think it is a good starting point.
The UART device is 16550-compatible, so I do not need any additional driver.



-- 
Best Regards
Masahiro Yamada

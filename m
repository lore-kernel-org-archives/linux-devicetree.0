From: Helmut Klein <hgkr.klein@gmail.com>
Subject: Re: [PATCH v2,1/3] meson_uart: expose CLKID_UARTx
Date: Tue, 28 Mar 2017 20:18:25 +0200
Message-ID: <71489b62-78c8-7082-587e-8598dc43ca59@gmail.com>
References: <20170328092545.4644-1-hgkr.klein@gmail.com>
 <20170328092545.4644-2-hgkr.klein@gmail.com>
 <1490716277.20764.6.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490716277.20764.6.camel@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

i know for sure that the bluetooth chip of my system is connected to 
uart_A. so this clock must be exposed.

i don't know if the other 2 uarts are used on other hardware. so i will 
remove them from my patch.

Helmut

On 28.03.2017 17:51, Jerome Brunet wrote:
> On Tue, 2017-03-28 at 11:25 +0200, Helmut Klein wrote:
>> Expose the clock ids for the three none AO uarts to the dt-bindings
>
> Are they all used in the device tree ?
> We try to only expose what we need in the DT
> The recent discussion over CLKID_CPUCLK proved it was a sane thing to do.
>
>>
>> Signed-off-by: Helmut Klein <hgkr.klein@gmail.com>
>> ---
>>  drivers/clk/meson/gxbb.h              | 6 +++---
>>  include/dt-bindings/clock/gxbb-clkc.h | 3 +++
>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
>> index 8ee2022ce5d5..1edfaa5fe307 100644
>> --- a/drivers/clk/meson/gxbb.h
>> +++ b/drivers/clk/meson/gxbb.h
>> @@ -194,7 +194,7 @@
>>  /* #define CLKID_SAR_ADC */
>>  #define CLKID_SMART_CARD	  24
>>  #define CLKID_RNG0		  25
>> -#define CLKID_UART0		  26
>> +/* CLKID_UART0 */
>>  #define CLKID_SDHC		  27
>>  #define CLKID_STREAM		  28
>>  #define CLKID_ASYNC_FIFO	  29
>> @@ -216,7 +216,7 @@
>>  #define CLKID_ADC		  45
>>  #define CLKID_BLKMV		  46
>>  #define CLKID_AIU		  47
>> -#define CLKID_UART1		  48
>> +/* CLKID_UART1 */
>>  #define CLKID_G2D		  49
>>  /* CLKID_USB0 */
>>  /* CLKID_USB1 */
>> @@ -236,7 +236,7 @@
>>  /* CLKID_USB0_DDR_BRIDGE */
>>  #define CLKID_MMC_PCLK		  66
>>  #define CLKID_DVIN		  67
>> -#define CLKID_UART2		  68
>> +/* CLKID_UART2 */
>>  /* #define CLKID_SANA */
>>  #define CLKID_VPU_INTR		  70
>>  #define CLKID_SEC_AHB_AHB3_BRIDGE 71
>> diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-
>> bindings/clock/gxbb-clkc.h
>> index 692846c7941b..7b329df47752 100644
>> --- a/include/dt-bindings/clock/gxbb-clkc.h
>> +++ b/include/dt-bindings/clock/gxbb-clkc.h
>> @@ -15,13 +15,16 @@
>>  #define CLKID_SPI		34
>>  #define CLKID_I2C		22
>>  #define CLKID_SAR_ADC		23
>> +#define CLKID_UART0		26
>>  #define CLKID_ETH		36
>> +#define CLKID_UART1		48
>>  #define CLKID_USB0		50
>>  #define CLKID_USB1		51
>>  #define CLKID_USB		55
>>  #define CLKID_HDMI_PCLK		63
>>  #define CLKID_USB1_DDR_BRIDGE	64
>>  #define CLKID_USB0_DDR_BRIDGE	65
>> +#define CLKID_UART2		68
>>  #define CLKID_SANA		69
>>  #define CLKID_GCLK_VENCI_INT0	77
>>  #define CLKID_AO_I2C		93
>> --
>> 2.11.0
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>

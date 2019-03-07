From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY
 resets
Date: Thu, 7 Mar 2019 13:23:32 +0100
Message-ID: <b09ab1a0-9c6a-3d4c-b658-6ac1dd9ec0f5@baylibre.com>
References: <20190304104916.3937-1-narmstrong@baylibre.com>
 <CAFBinCAkMSeMuXj++cWBYP4WFwAMEwm-EFHtLA5X85oe6kekTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCAkMSeMuXj++cWBYP4WFwAMEwm-EFHtLA5X85oe6kekTw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/03/2019 23:02, Martin Blumenstingl wrote:
> On Mon, Mar 4, 2019 at 11:49 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The G12A Documentation lacked these 2 reset lines, but they are present and
>> used for each USB 2 PHYs.
>>
>> Add them to the dt-bindings for the upcoming USB support.
>>
>> Fixes: dbfc54534dfc ("dt-bindings: reset: meson: add g12a bindings")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
>> ---
>>  include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> index 8063e8314eef..6d487c5eba2c 100644
>> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> @@ -51,7 +51,10 @@
>>  #define RESET_SD_EMMC_A                        44
>>  #define RESET_SD_EMMC_B                        45
>>  #define RESET_SD_EMMC_C                        46
>> -/*                                     47-60 */
>> +/*                                     47      */
>> +#define RESET_USB_PHY20                        48
>> +#define RESET_USB_PHY21                        49
> because it's always hard to look up, here's the reference to that
> information Amlogic's buildroot kernel
> (buildroot_openlinux_kernel_4.9_fbdev_20180706):
> kernel/aml-4.9/drivers/amlogic/usb/phy/phy-aml-new-usb2-v2.c uses:
> writel((val | (0x3 << 16)), (void __iomem *) ((unsigned
> long)phy->reset_regs + (0x21 * 4 - 0x8)));
> 
> this translates to:
> - (0x21 * 4 - 0x8) = RESET1 register / reset line ID 32 and above
> (reset line 0 is at "0x20 * 4 - 0x08")
> - bits 16 and 17 = add 32 to that gives us reset IDs 48 and 49

Exactly, thanks for pointing this !

Neil

> 
> 
> Regards
> Martin
> 

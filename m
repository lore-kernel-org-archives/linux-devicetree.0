Return-Path: <SRS0=nSMN=AM=gmail.com=liuxuenetmail@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170910093026.4386-1-starnight@g.ncu.edu.tw>
References: <20170910093026.4386-1-starnight@g.ncu.edu.tw>
From: Xue Liu <liuxuenetmail@gmail.com>
Date: Mon, 11 Sep 2017 09:48:36 +0200
Message-ID: <CAJuUDwu5=ohGXRxvaxi-mEUEsq-oSn98et174+SZRksyCgeRww@mail.gmail.com>
Subject: Re: [PATCH] linux-wpan: Add an IEEE 802.15.4 over LoRa Semtech
 SX1276/77/78/79 device driver
Content-Type: multipart/alternative; boundary="001a1143971e89eb060558e52783"
To: Jian-Hong Pan <starnight@g.ncu.edu.tw>
Cc: Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-wpan@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a1143971e89eb060558e52783
Content-Type: text/plain; charset="UTF-8"

Hello Pan,

>From my point of view, it is not a good idea to write sx127x driver for
IEEE 802154. Because LoRa is not compatible with IEEE 802.15.4 in PHY and
MAC layer.

I think it is better to make individual Phy and MAC layers for LoRa in
Linux kernel, where a sx127x driver will make sense.

Regards,

Xue Liu

On 10 September 2017 at 11:30, Jian-Hong Pan <starnight@g.ncu.edu.tw> wrote:

> LoRa is an implementation of LPWPAN.
> Chirp Spread Spectrum (CSS) modulation, which is used by LoRa has been
> specified by IEEE 802.15.4a.
> This driver implements IEEE 802.15.4 mac over LoRa physical layer not
> LoRaWAN.
>
> Signed-off-by: Jian-Hong Pan <starnight@g.ncu.edu.tw>
> ---
>  .../devicetree/bindings/net/ieee802154/sx1278.txt  |   30 +
>  drivers/net/ieee802154/Kconfig                     |   12 +
>  drivers/net/ieee802154/Makefile                    |    1 +
>  drivers/net/ieee802154/sx1278.c                    | 1636
> ++++++++++++++++++++
>  4 files changed, 1679 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ieee802154/
> sx1278.txt
>  create mode 100644 drivers/net/ieee802154/sx1278.c
>
> diff --git a/Documentation/devicetree/bindings/net/ieee802154/sx1278.txt
> b/Documentation/devicetree/bindings/net/ieee802154/sx1278.txt
> new file mode 100644
> index 000000000000..78ca60feac30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ieee802154/sx1278.txt
> @@ -0,0 +1,30 @@
> +* SX1278 IEEE 802.15.4 Compatible Radio *
> +
> +Required properties:
> +  - compatible:                should be "semtech,sx1276",
> "semtech,sx1277",
> +                       "semtech,sx1277" or "semtech,sx1279" depends on
> your
> +                       transceiver board
> +  - spi-max-frequency: maximal bus speed, should be set something under or
> +                       equal 10000000 Hz
> +  - reg:               the chipselect index
> +  - clock-frequency:   the external crystal oscillator frequency in Hz of
> the
> +                       transceiver
> +Optional properties:
> +  - center-carrier-frq:        the RF center carrier frequency in Hz
> +  - rf-bandwidth:      the RF bandwidth in Hz
> +  - minimal-RF-channel:        the minimal RF channel number and the
> value must be with
> +                       prefix "/bits/ 8" because of being a byte datatype
> +  - maximum-RF-channel: the maximum RF channel number and the value must
> be with
> +                       prefix "/bits/ 8" because of being a byte datatype
> +  - spreading-factor:  the spreading factor of Chirp Spread Spectrum
> modulation
> +
> +Example:
> +
> +       sx1278@0 {
> +               compatible = "semtech,sx1278";
> +               spi-max-frequency = <15200>;
> +               reg = <0>;
> +               clock-frequency = <32000000>;
> +               minimal-RF-channel = /bits/ 8 <11>;
> +               maximum-RF-channel = /bits/ 8 <11>;
> +       };
> diff --git a/drivers/net/ieee802154/Kconfig b/drivers/net/ieee802154/
> Kconfig
> index 303ba4133920..57ed64e55d13 100644
> --- a/drivers/net/ieee802154/Kconfig
> +++ b/drivers/net/ieee802154/Kconfig
> @@ -104,3 +104,15 @@ config IEEE802154_CA8210_DEBUGFS
>           exposes a debugfs node for each CA8210 instance which allows
>           direct use of the Cascoda API, exposing the 802.15.4 MAC
>           management entities.
> +
> +config IEEE802154_SX1278
> +       tristate "Semtech SX1276/77/78/79 transceiver driver"
> +       depends on IEEE802154_DRIVERS && MAC802154
> +       depends on SPI
> +       select REGMAP_SPI
> +       ---help---
> +         Say Y here to enable the SX1278 SPI 802.15.4 wireless
> +         controller.
> +
> +         This driver can also be built as a module. To do so, say M here.
> +         the module will be called 'sx1278'.
> diff --git a/drivers/net/ieee802154/Makefile b/drivers/net/ieee802154/
> Makefile
> index 8374bb44a145..634e8e1bfad6 100644
> --- a/drivers/net/ieee802154/Makefile
> +++ b/drivers/net/ieee802154/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_IEEE802154_CC2520) += cc2520.o
>  obj-$(CONFIG_IEEE802154_ATUSB) += atusb.o
>  obj-$(CONFIG_IEEE802154_ADF7242) += adf7242.o
>  obj-$(CONFIG_IEEE802154_CA8210) += ca8210.o
> +obj-$(CONFIG_IEEE802154_SX1278) += sx1278.o
> diff --git a/drivers/net/ieee802154/sx1278.c b/drivers/net/ieee802154/
> sx1278.c
> new file mode 100644
> index 000000000000..2018407a0ab7
> --- /dev/null
> +++ b/drivers/net/ieee802154/sx1278.c
> @@ -0,0 +1,1636 @@
> +/*-
> + * Copyright (c) 2017 Jian-Hong, Pan <starnight@g.ncu.edu.tw>
> + *
> + * All rights reserved.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer,
> + *    without modification.
> + * 2. Redistributions in binary form must reproduce at minimum a
> disclaimer
> + *    similar to the "NO WARRANTY" disclaimer below ("Disclaimer") and any
> + *    redistribution must be conditioned upon including a substantially
> + *    similar Disclaimer requirement for further binary redistribution.
> + * 3. Neither the names of the above-listed copyright holders nor the
> names
> + *    of any contributors may be used to endorse or promote products
> derived
> + *    from this software without specific prior written permission.
> + *
> + * Alternatively, this software may be distributed under the terms of the
> + * GNU General Public License ("GPL") version 2 as published by the Free
> + * Software Foundation.
> + *
> + * NO WARRANTY
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + * ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + * LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
> + * AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
> + * OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> BUSINESS
> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
> + * IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> OTHERWISE)
> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> + * THE POSSIBILITY OF SUCH DAMAGES.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/timer.h>
> +#include <linux/device.h>
> +#include <linux/acpi.h>
> +#include <linux/of_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/spi/spi.h>
> +#include <linux/regmap.h>
> +#include <net/mac802154.h>
> +
> +/*------------------------------ LoRa Functions
> ------------------------------*/
> +
> +#ifndef F_XOSC
> +#define F_XOSC         32000000
> +#endif
> +static u32 xosc_frq = F_XOSC;
> +module_param(xosc_frq, uint, 0000);
> +MODULE_PARM_DESC(xosc_frq, "Crystal oscillator frequency of the LoRa
> chip");
> +
> +#define        __POW_2_19      0x80000
> +
> +#ifndef SX127X_SPRF
> +#define SX127X_SPRF    512
> +#endif
> +static u32 sprf = SX127X_SPRF;
> +module_param(sprf, uint, 0000);
> +MODULE_PARM_DESC(sprf, "Spreading factor of Chirp Spread Spectrum
> modulation");
> +
> +#ifndef SX127X_RX_BYTE_TIMEOUT
> +#define SX127X_RX_BYTE_TIMEOUT 1023
> +#endif
> +static u32 rx_timeout = SX127X_RX_BYTE_TIMEOUT;
> +module_param(rx_timeout, uint, 0000);
> +MODULE_PARM_DESC(rx_timeout, "RX time-out value as number of symbols");
> +
> +/* SX127X Registers addresses */
> +#define SX127X_REG_FIFO                                0x00
> +#define SX127X_REG_OP_MODE                     0x01
> +#define SX127X_REG_FRF_MSB                     0x06
> +#define SX127X_REG_FRF_MID                     0x07
> +#define SX127X_REG_FRF_LSB                     0x08
> +#define SX127X_REG_PA_CONFIG                   0x09
> +#define SX127X_REG_PA_RAMP                     0x0A
> +#define SX127X_REG_OCP                         0x0B
> +#define SX127X_REG_LNA                         0x0C
> +#define SX127X_REG_FIFO_ADDR_PTR               0x0D
> +#define SX127X_REG_FIFO_TX_BASE_ADDR           0x0E
> +#define SX127X_REG_FIFO_RX_BASE_ADDR           0x0F
> +#define SX127X_REG_FIFO_RX_CURRENT_ADDR                0x10
> +#define SX127X_REG_IRQ_FLAGS_MASK              0x11
> +#define SX127X_REG_IRQ_FLAGS                   0x12
> +#define SX127X_REG_RX_NB_BYTES                 0x13
> +#define SX127X_REG_RX_HEADER_CNT_VALUE_MSB     0x14
> +#define SX127X_REG_RX_HEADER_CNT_VALUE_LSB     0x15
> +#define SX127X_REG_RX_PACKET_CNT_VALUE_MSB     0x16
> +#define SX127X_REG_RX_PACKET_CNT_VALUE_LSB     0x17
> +#define SX127X_REG_MODEM_STAT                  0x18
> +#define SX127X_REG_PKT_SNR_VALUE               0x19
> +#define SX127X_REG_PKT_RSSI_VALUE              0x1A
> +#define SX127X_REG_RSSI_VALUE                  0x1B
> +#define SX127X_REG_HOP_CHANNEL                 0x1C
> +#define SX127X_REG_MODEM_CONFIG1               0x1D
> +#define SX127X_REG_MODEM_CONFIG2               0x1E
> +#define SX127X_REG_SYMB_TIMEOUT_LSB            0x1F
> +#define SX127X_REG_PREAMBLE_MSB                        0x20
> +#define SX127X_REG_PREAMBLE_LSB                        0x21
> +#define SX127X_REG_PAYLOAD_LENGTH              0x22
> +#define SX127X_REG_MAX_PAYLOAD_LENGTH          0x23
> +#define SX127X_REG_HOP_PERIOD                  0x24
> +#define SX127X_REG_FIFO_RX_BYTE_ADDR           0x25
> +#define SX127X_REG_MODEM_CONFIG3               0x26
> +#define SX127X_REG_FEI_MSB                     0x28
> +#define SX127X_REG_FEI_MID                     0x29
> +#define SX127X_REG_FEI_LSB                     0x2A
> +#define SX127X_REG_RSSI_WIDEBAND               0x2C
> +#define SX127X_REG_DETECT_OPTIMIZE             0x31
> +#define SX127X_REG_INVERT_IRQ                  0x33
> +#define SX127X_REG_DETECTION_THRESHOLD         0x37
> +#define SX127X_REG_SYNC_WORD                   0x39
> +#define SX127X_REG_VERSION                     0x42
> +#define SX127X_REG_TCXO                                0x4B
> +#define SX127X_REG_PA_DAC                      0x4D
> +#define SX127X_REG_FORMER_TEMP                 0x5B
> +#define SX127X_REG_AGC_REF                     0x61
> +#define SX127X_REG_AGC_THRESH1                 0x62
> +#define SX127X_REG_AGC_THRESH2                 0x63
> +#define SX127X_REG_AGC_THRESH3                 0x64
> +#define SX127X_REG_PLL                         0x70
> +#define SX127X_MAX_REG                         SX127X_REG_PLL
> +
> +/* SX127X's operating states in LoRa mode */
> +#define SX127X_SLEEP_MODE                      0x00
> +#define SX127X_STANDBY_MODE                    0x01
> +#define SX127X_FSTX_MODE                       0x02
> +#define SX127X_TX_MODE                         0x03
> +#define SX127X_FSRX_MODE                       0x04
> +#define SX127X_RXCONTINUOUS_MODE               0x05
> +#define SX127X_RXSINGLE_MODE                   0x06
> +#define SX127X_CAD_MODE                                0x07
> +
> +/* SX127X's IRQ flags in LoRa mode */
> +#define SX127X_FLAG_RXTIMEOUT                  0x80
> +#define        SX127X_FLAG_RXDONE                      0x40
> +#define SX127X_FLAG_PAYLOADCRCERROR            0x20
> +#define SX127X_FLAG_VALIDHEADER                        0x10
> +#define SX127X_FLAG_TXDONE                     0x08
> +#define SX127X_FLAG_CADDONE                    0x04
> +#define SX127X_FLAG_FHSSCHANGECHANNEL          0x02
> +#define SX127X_FLAG_CADDETECTED                        0x01
> +
> +/* SX127X's IRQ flags' mask for output pins in LoRa mode */
> +#define SX127X_FLAGMASK_RXTIMEOUT              0x80
> +#define        SX127X_FLAGMASK_RXDONE                  0x40
> +#define SX127X_FLAGMASK_PAYLOADCRCERROR                0x20
> +#define SX127X_FLAGMASK_VALIDHEADER            0x10
> +#define SX127X_FLAGMASK_TXDONE                 0x08
> +#define SX127X_FLAGMASK_CADDONE                        0x04
> +#define SX127X_FLAGMASK_FHSSCHANGECHANNEL      0x02
> +#define SX127X_FLAGMASK_CADDETECTED            0x01
> +
> +/* SX127X's RX/TX FIFO base address */
> +#define SX127X_FIFO_RX_BASE_ADDRESS            0x00
> +#define SX127X_FIFO_TX_BASE_ADDRESS            0x80
> +
> +struct sx1278_phy {
> +       struct ieee802154_hw *hw;
> +       struct regmap *map;
> +
> +       bool suspended;
> +       u8 opmode;
> +       struct timer_list timer;
> +       struct work_struct irqwork;
> +       /* Lock the RX and TX actions. */
> +       spinlock_t buf_lock;
> +       struct sk_buff *tx_buf;
> +       u8 tx_delay;
> +       bool one_to_be_sent;
> +       bool post_tx_done;
> +       bool is_busy;
> +};
> +
> +/**
> + * sx127X_read_version - Get LoRa device's chip version
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     Positive / negtive values for version code / failed
> + *             Version code:   bits 7-4 full version number,
> + *                             bits 3-0 metal mask revision number
> + */
> +int
> +sx127X_read_version(struct regmap *map)
> +{
> +       u8 v;
> +       int status;
> +
> +       status = regmap_raw_read(map, SX127X_REG_VERSION, &v, 1);
> +
> +       if ((status == 0) && (v > 0) && (v < 0xFF))
> +               status = v;
> +       else
> +               status = -ENODEV;
> +
> +       return status;
> +}
> +
> +/**
> + * sx127X_get_mode - Get LoRa device's mode register
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     LoRa device's register value
> + */
> +u8
> +sx127X_get_mode(struct regmap *map)
> +{
> +       u8 op_mode;
> +
> +       /* Get original OP Mode register. */
> +       regmap_raw_read(map, SX127X_REG_OP_MODE, &op_mode, 1);
> +
> +       return op_mode;
> +}
> +
> +/**
> + * sx127X_set_state - Set LoRa device's operating state
> + * @map:       the device as a regmap to communicate with
> + * @st:                LoRa device's operating state going to be assigned
> + */
> +void
> +sx127X_set_state(struct regmap *map, u8 st)
> +{
> +       u8 op_mode;
> +
> +       /* Get original OP Mode register. */
> +       op_mode = sx127X_get_mode(map);
> +       /* Set device to designated state. */
> +       op_mode = (op_mode & 0xF8) | (st & 0x07);
> +       regmap_raw_write(map, SX127X_REG_OP_MODE, &op_mode, 1);
> +}
> +
> +/**
> + * sx127X_get_state - Get LoRa device's operating state
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     LoRa device's operating state
> + */
> +u8
> +sx127X_get_state(struct regmap *map)
> +{
> +       u8 op_mode;
> +
> +       op_mode = sx127X_get_mode(map) & 0x07;
> +
> +       return op_mode;
> +}
> +
> +/**
> + * sx127X_set_lorafrq - Set RF frequency
> + * @map:       the device as a regmap to communicate with
> + * @fr:                RF frequency going to be assigned in Hz
> + */
> +void
> +sx127X_set_lorafrq(struct regmap *map, u32 fr)
> +{
> +       u64 frt64;
> +       u32 frt;
> +       u8 buf[3];
> +       u8 i;
> +       u32 f_xosc;
> +
> +#ifdef CONFIG_OF
> +       /* Set the LoRa module's crystal oscillator's clock if OF is
> defined. */
> +       struct device_node *of_node = (regmap_get_device(map))->of_node;
> +
> +       if (of_property_read_u32(of_node, "clock-frequency", &f_xosc))
> +               f_xosc = xosc_frq;
> +#else
> +       f_xosc = xosc_frq;
> +#endif
> +
> +       frt64 = (uint64_t)fr * (uint64_t)__POW_2_19;
> +       do_div(frt64, f_xosc);
> +       frt = frt64;
> +
> +       for (i = 2; i >= 0; i--) {
> +               buf[i] = frt % 256;
> +               frt = frt >> 8;
> +       }
> +
> +       regmap_raw_write(map, SX127X_REG_FRF_MSB, buf, 3);
> +}
> +
> +/**
> + * sx127X_get_lorafrq - Get RF frequency
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     RF frequency in Hz
> + */
> +u32
> +sx127X_get_lorafrq(struct regmap *map)
> +{
> +       u64 frt = 0;
> +       u8 buf[3];
> +       u8 i;
> +       int status;
> +       u32 fr;
> +       u32 f_xosc;
> +
> +#ifdef CONFIG_OF
> +       /* Set the LoRa module's crystal oscillator's clock if OF is
> defined. */
> +       struct device_node *of_node = (regmap_get_device(map))->of_node;
> +
> +       if (of_property_read_u32(of_node, "clock-frequency", &f_xosc))
> +               f_xosc = xosc_frq;
> +#else
> +       f_xosc = xosc_frq;
> +#endif
> +
> +       status = regmap_raw_read(map, SX127X_REG_FRF_MSB, buf, 3);
> +       if (status < 0)
> +               return 0.0;
> +
> +       for (i = 0; i <= 2; i++)
> +               frt = frt * 256 + buf[i];
> +
> +       fr =  frt * f_xosc / __POW_2_19;
> +
> +       return fr;
> +}
> +
> +/**
> + * sx127X_set_lorapower - Set RF output power
> + * @map:       the device as a regmap to communicate with
> + * @pout:      RF output power going to be assigned in dbm
> + */
> +void
> +sx127X_set_lorapower(struct regmap *map, s32 pout)
> +{
> +       u8 pacf;
> +       u8 boost;
> +       u8 output_power;
> +       s32 pmax;
> +
> +       if (pout > 14) {
> +               /* Pout > 14dbm */
> +               boost = 1;
> +               pmax = 7;
> +               output_power = pout - 2;
> +       } else if (pout < 0) {
> +               /* Pout < 0dbm */
> +               boost = 0;
> +               pmax = 2;
> +               output_power = 3 + pout;
> +       } else {
> +               /* 0dbm <= Pout <= 14dbm */
> +               boost = 0;
> +               pmax = 7;
> +               output_power = pout;
> +       }
> +
> +       pacf = (boost << 7) | (pmax << 4) | (output_power);
> +       regmap_raw_write(map, SX127X_REG_PA_CONFIG, &pacf, 1);
> +}
> +
> +/**
> + * sx127X_get_lorapower - Get RF output power
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     RF output power in dbm
> + */
> +s32
> +sx127X_get_lorapower(struct regmap *map)
> +{
> +       u8 pac;
> +       u8 boost;
> +       s32 output_power;
> +       s32 pmax;
> +       s32 pout;
> +
> +       regmap_raw_read(map, SX127X_REG_PA_CONFIG, &pac, 1);
> +       boost = (pac & 0x80) >> 7;
> +       output_power = pac & 0x0F;
> +       if (boost) {
> +               pout = 2 + output_power;
> +       } else {
> +               /* Power max should be pmax/10.  It is 10 times for now. */
> +               pmax = (108 + 6 * ((pac & 0x70) >> 4));
> +               pout = (pmax - (150 - output_power * 10)) / 10;
> +       }
> +
> +       return pout;
> +}
> +
> +/**
> + * sx127X_dbm2mbm - dbm to mbm unit conversion
> + * @dbm:       the value in dbm
> + *
> + * Return:     the value in mbm
> + */
> +#define sx127X_dbm2mbm(dbm)    (dbm * 100)
> +
> +/**
> + * sx127X_mbm2dbm - mbm to dbm unit conversion
> + * @mbm:       the value in mbm
> + *
> + * Return:     the value in dbm
> + */
> +#define sx127X_mbm2dbm(mbm)    (mbm / 100)
> +
> +s8 lna_gain[] = {
> +        0,
> +       -6,
> +       -12,
> +       -24,
> +       -26,
> +       -48
> +};
> +
> +/**
> + * sx127X_set_loralna - Set RF LNA gain
> + * @map:       the device as a regmap to communicate with
> + * @db:                RF LNA gain going to be assigned in db
> + */
> +void
> +sx127X_set_loralna(struct regmap *map, s32 db)
> +{
> +       u8 i, g;
> +       u8 lnacf;
> +
> +       for (i = 0; i < 5; i++) {
> +               if (lna_gain[i] <= db)
> +                       break;
> +       }
> +       g = i + 1;
> +
> +       regmap_raw_read(map, SX127X_REG_LNA, &lnacf, 1);
> +       lnacf = (lnacf & 0x1F) | (g << 5);
> +       regmap_raw_write(map, SX127X_REG_LNA, &lnacf, 1);
> +}
> +
> +/**
> + * sx127X_get_loralna - Get RF LNA gain
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     RF LNA gain db
> + */
> +s32
> +sx127X_get_loralna(struct regmap *map)
> +{
> +       s32 db;
> +       s8 i, g;
> +       u8 lnacf;
> +
> +       regmap_raw_read(map, SX127X_REG_LNA, &lnacf, 1);
> +       g = (lnacf >> 5);
> +       i = g - 1;
> +       db = lna_gain[i];
> +
> +       return db;
> +}
> +
> +/**
> + * sx127X_set_loralnaagc - Set RF LNA go with auto gain control or manual
> + * @map:       the device as a regmap to communicate with
> + * @yesno:     1 / 0 for auto gain control / manual
> + */
> +void
> +sx127X_set_loralnaagc(struct regmap *map, s32 yesno)
> +{
> +       u8 mcf3;
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG3, &mcf3, 1);
> +       mcf3 = (yesno) ? (mcf3 | 0x04) : (mcf3 & (~0x04));
> +       regmap_raw_write(map, SX127X_REG_MODEM_CONFIG3, &mcf3, 1);
> +}
> +
> +/**
> + * sx127X_get_loraallflag - Get all of the LoRa device IRQ flags' current
> state
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     All of the LoRa device's IRQ flags' current state in a byte
> + */
> +u8
> +sx127X_get_loraallflag(struct regmap *map)
> +{
> +       u8 flags;
> +
> +       regmap_raw_read(map, SX127X_REG_IRQ_FLAGS, &flags, 1);
> +
> +       return flags;
> +}
> +
> +/**
> + * sx127X_get_loraallflag - Get interested LoRa device IRQ flag's current
> state
> + * @map:       the device as a regmap to communicate with
> + * @f:         the interested LoRa device's IRQ flag
> + *
> + * Return:     The interested LoRa device's IRQ flag's current state in a
> byte
> + */
> +#define sx127X_get_loraflag(map, f)    (sx127X_get_loraallflag(map) & (f))
> +
> +/**
> + * sx127X_clear_loraflag - Clear designated LoRa device's IRQ flag
> + * @map:       the device as a regmap to communicate with
> + * @f:         flags going to be cleared
> + */
> +void
> +sx127X_clear_loraflag(struct regmap *map, u8 f)
> +{
> +       u8 flag;
> +
> +       /* Get oiginal flag. */
> +       flag = sx127X_get_loraallflag(map);
> +       /* Set the designated bits of the flag. */
> +       flag |= f;
> +       regmap_raw_write(map, SX127X_REG_IRQ_FLAGS, &flag, 1);
> +}
> +
> +/**
> + * sx127X_clear_loraallflag - Clear designated LoRa device's all IRQ flags
> + * @map:       the device as a regmap to communicate with
> + */
> +#define sx127X_clear_loraallflag(spi)  sx127X_clear_loraflag(spi, 0xFF)
> +
> +/**
> + * sx127X_set_lorasprf - Set the RF modulation's spreading factor
> + * @map:       the device as a regmap to communicate with
> + * @c_s:       Spreading factor in chips / symbol
> + */
> +void
> +sx127X_set_lorasprf(struct regmap *map, u32 c_s)
> +{
> +       u8 sf;
> +       u8 mcf2;
> +
> +       for (sf = 6; sf < 12; sf++) {
> +               if (c_s == ((u32)1 << sf))
> +                       break;
> +       }
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, &mcf2, 1);
> +       mcf2 = (mcf2 & 0x0F) | (sf << 4);
> +       regmap_raw_write(map, SX127X_REG_MODEM_CONFIG2, &mcf2, 1);
> +}
> +
> +/**
> + * sx127X_get_lorasprf - Get the RF modulation's spreading factor
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     Spreading factor in chips / symbol
> + */
> +u32
> +sx127X_get_lorasprf(struct regmap *map)
> +{
> +       u8 sf;
> +       u32 c_s;
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, &sf, 1);
> +       sf = sf >> 4;
> +       c_s = 1 << sf;
> +
> +       return c_s;
> +}
> +
> +const u32 hz[] = {
> +         7800,
> +        10400,
> +        15600,
> +        20800,
> +        31250,
> +        41700,
> +        62500,
> +       125000,
> +       250000,
> +       500000
> +};
> +
> +/**
> + * sx127X_set_lorabw - Set RF bandwidth
> + * @map:       the device as a regmap to communicate with
> + * @bw:                RF bandwidth going to be assigned in Hz
> + */
> +void
> +sx127X_set_lorabw(struct regmap *map, u32 bw)
> +{
> +       u8 i;
> +       u8 mcf1;
> +
> +       for (i = 0; i < 9; i++) {
> +               if (hz[i] >= bw)
> +                       break;
> +       }
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, &mcf1, 1);
> +       mcf1 = (mcf1 & 0x0F) | (i << 4);
> +       regmap_raw_write(map, SX127X_REG_MODEM_CONFIG1, &mcf1, 1);
> +}
> +
> +/**
> + * sx127X_get_lorabw - Get RF bandwidth
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     RF bandwidth in Hz
> + */
> +u32
> +sx127X_get_lorabw(struct regmap *map)
> +{
> +       u8 mcf1;
> +       u8 bw;
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, &mcf1, 1);
> +       bw = mcf1 >> 4;
> +
> +       return hz[bw];
> +}
> +
> +/**
> + * sx127X_set_loracr  - Set LoRa package's coding rate
> + * @map:       the device as a regmap to communicate with
> + * @cr:                Coding rate going to be assigned in a byte
> + *             high 4 bits / low 4 bits: numerator / denominator
> + */
> +void
> +sx127X_set_loracr(struct regmap *map, u8 cr)
> +{
> +       u8 mcf1;
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, &mcf1, 1);
> +       mcf1 = (mcf1 & 0x0E) | (((cr & 0xF) - 4) << 1);
> +       regmap_raw_write(map, SX127X_REG_MODEM_CONFIG1, &mcf1, 1);
> +}
> +
> +/**
> + * sx127X_get_loracr - Get LoRa package's coding rate
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     Coding rate in a byte
> + *             high 4 bits / low 4 bits: numerator / denominator
> + */
> +u8
> +sx127X_get_loracr(struct regmap *map)
> +{
> +       u8 mcf1;
> +       u8 cr;  /* ex: 0x45 represents cr=4/5 */
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, &mcf1, 1);
> +       cr = 0x40 + ((mcf1 & 0x0E) >> 1) + 4;
> +
> +       return cr;
> +}
> +
> +/**
> + * sx127X_set_loraimplicit - Set LoRa packages with Explicit / Implicit
> Header
> + * @map:       the device as a regmap to communicate with
> + * @yesno:     1 / 0 for Implicit Header Mode / Explicit Header Mode
> + */
> +void
> +sx127X_set_loraimplicit(struct regmap *map, u8 yesno)
> +{
> +       u8 mcf1;
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, &mcf1, 1);
> +       mcf1 = (yesno) ? (mcf1 | 0x01) : (mcf1 & 0xFE);
> +       regmap_raw_write(map, SX127X_REG_MODEM_CONFIG1, &mcf1, 1);
> +}
> +
> +/**
> + * sx127X_set_lorarxbytetimeout - Set RX operation time-out in terms of
> symbols
> + * @map:       the device as a regmap to communicate with
> + * @n:         Time-out in terms of symbols (bytes) going to be assigned
> + */
> +void
> +sx127X_set_lorarxbytetimeout(struct regmap *map, u32 n)
> +{
> +       u8 buf[2];
> +       u8 mcf2;
> +
> +       if (n < 1)
> +               n = 1;
> +       if (n > 1023)
> +               n = 1023;
> +
> +       /* Read original Modem config 2. */
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, &mcf2, 1);
> +
> +       /* LSB */
> +       buf[1] = n % 256;
> +       /* MSB */
> +       buf[0] = (mcf2 & 0xFC) | (n >> 8);
> +
> +       regmap_raw_write(map, SX127X_REG_MODEM_CONFIG2, buf, 2);
> +}
> +
> +/**
> + * sx127X_set_lorarxtimeout - Set RX operation time-out seconds
> + * @map:       the device as a regmap to communicate with
> + * @ms:                The RX time-out time in ms
> + */
> +void
> +sx127X_set_lorarxtimeout(struct regmap *map, u32 ms)
> +{
> +       u32 n;
> +
> +       n = ms * sx127X_get_lorabw(map) / (sx127X_get_lorasprf(map) *
> 1000);
> +
> +       sx127X_set_lorarxbytetimeout(map, n);
> +}
> +
> +/**
> + * sx127X_get_lorarxbytetimeout - Get RX operation time-out in terms of
> symbols
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     Time-out in terms of symbols (bytes)
> + */
> +u32
> +sx127X_get_lorarxbytetimeout(struct regmap *map)
> +{
> +       u32 n;
> +       u8 buf[2];
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, buf, 2);
> +
> +       n = (buf[0] & 0x03) * 256 + buf[1];
> +
> +       return n;
> +}
> +
> +/**
> + * sx127X_get_lorarxtimeout - Get RX operation time-out seconds
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     The RX time-out time in ms
> + */
> +u32
> +sx127X_get_lorarxtimeout(struct regmap *map)
> +{
> +       u32 ms;
> +
> +       ms = 1000 * sx127X_get_lorarxbytetimeout(map) *
> +               sx127X_get_lorasprf(map) / sx127X_get_lorabw(map);
> +
> +       return ms;
> +}
> +
> +/**
> + * sx127X_set_loramaxrxbuff - Maximum payload length in LoRa packet
> + * @map:       the device as a regmap to communicate with
> + * @len:       the max payload length going to be assigned in bytes
> + */
> +void
> +sx127X_set_loramaxrxbuff(struct regmap *map, u8 len)
> +{
> +       regmap_raw_write(map, SX127X_REG_MAX_PAYLOAD_LENGTH, &len, 1);
> +}
> +
> +/**
> + * sx127X_get_loralastpktpayloadlen - Get the RX last packet payload
> length
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     the actual RX last packet payload length in bytes
> + */
> +u8
> +sx127X_get_loralastpktpayloadlen(struct regmap *map)
> +{
> +       u8 len;
> +
> +       regmap_raw_read(map, SX127X_REG_RX_NB_BYTES, &len, 1);
> +
> +       return len;
> +}
> +
> +/**
> + * sx127X_readloradata - Read data from LoRa device (read RX FIFO)
> + * @map:       the device as a regmap to communicate with
> + * @buf:       buffer going to be read data into
> + * @len:       the length of the data going to be read in bytes
> + *
> + * Return:     Positive / negtive values for the actual data length read
> from
> + *             the LoRa device in bytes / failed
> + */
> +ssize_t
> +sx127X_readloradata(struct regmap *map, u8 *buf, size_t len)
> +{
> +       u8 start_adr;
> +       int ret;
> +
> +       /* Set chip FIFO pointer to FIFO last packet address. */
> +       start_adr = SX127X_FIFO_RX_BASE_ADDRESS;
> +       regmap_raw_write(map, SX127X_REG_FIFO_ADDR_PTR, &start_adr, 1);
> +
> +       /* Read LoRa packet payload. */
> +       len = (len <= IEEE802154_MTU) ? len : IEEE802154_MTU;
> +       ret = regmap_raw_read(map, SX127X_REG_FIFO, buf, len);
> +
> +       return (ret >= 0) ? len : ret;
> +}
> +
> +/**
> + * sx127X_sendloradata - Send data through LoRa device (write TX FIFO)
> + * @rm:                the device as a regmap to communicate with
> + * @buf:       buffer going to be send
> + * @len:       the length of the buffer in bytes
> + *
> + * Return:     the actual length written into the LoRa device in bytes
> + */
> +size_t
> +sx127X_sendloradata(struct regmap *map, u8 *buf, size_t len)
> +{
> +       u8 base_adr;
> +       u8 blen;
> +
> +       /* Set chip FIFO pointer to FIFO TX base. */
> +       base_adr = SX127X_FIFO_TX_BASE_ADDRESS;
> +       regmap_raw_write(map, SX127X_REG_FIFO_ADDR_PTR, &base_adr, 1);
> +
> +       /* Write payload synchronously to fill the FIFO of the chip. */
> +       blen = (len <= IEEE802154_MTU) ? len : IEEE802154_MTU;
> +       regmap_raw_write(map, SX127X_REG_FIFO, buf, blen);
> +
> +       /* Set the FIFO payload length. */
> +       regmap_raw_write(map, SX127X_REG_PAYLOAD_LENGTH, &blen, 1);
> +
> +       return blen;
> +}
> +
> +/**
> + * sx127X_get_loralastpktsnr - Get last LoRa packet's SNR
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     the last LoRa packet's SNR in db
> + */
> +s32
> +sx127X_get_loralastpktsnr(struct regmap *map)
> +{
> +       s32 db;
> +       s8 snr;
> +
> +       regmap_raw_read(map, SX127X_REG_PKT_SNR_VALUE, &snr, 1);
> +       db = snr / 4;
> +
> +       return db;
> +}
> +
> +/**
> + * sx127X_get_loralastpktrssi - Get last LoRa packet's SNR
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     the last LoRa packet's RSSI in dbm
> + */
> +s32
> +sx127X_get_loralastpktrssi(struct regmap *map)
> +{
> +       s32 dbm;
> +       u8 lhf;
> +       u8 rssi;
> +       s8 snr;
> +
> +       /* Get LoRa is in high or low frequency mode. */
> +       lhf = sx127X_get_mode(map) & 0x08;
> +       /* Get RSSI value. */
> +       regmap_raw_read(map, SX127X_REG_PKT_RSSI_VALUE, &rssi, 1);
> +       dbm = (lhf) ? -164 + rssi : -157 + rssi;
> +
> +       /* Adjust to correct the last packet RSSI if SNR < 0. */
> +       regmap_raw_read(map, SX127X_REG_PKT_SNR_VALUE, &snr, 1);
> +       if (snr < 0)
> +               dbm += snr / 4;
> +
> +       return dbm;
> +}
> +
> +/**
> + * sx127X_get_lorarssi - Get current RSSI value
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     the current RSSI in dbm
> + */
> +s32
> +sx127X_get_lorarssi(struct regmap *map)
> +{
> +       s32 dbm;
> +       u8 lhf;
> +       u8 rssi;
> +
> +       /* Get LoRa is in high or low frequency mode. */
> +       lhf = sx127X_get_mode(map) & 0x08;
> +       /* Get RSSI value. */
> +       regmap_raw_read(map, SX127X_REG_RSSI_VALUE, &rssi, 1);
> +       dbm = (lhf) ? -164 + rssi : -157 + rssi;
> +
> +       return dbm;
> +}
> +
> +/**
> + * sx127X_set_lorapreamblelen - Set LoRa preamble length
> + * @map:       the device as a regmap to communicate with
> + * @len:       the preamble length going to be assigned
> + */
> +void
> +sx127X_set_lorapreamblelen(struct regmap *map, u32 len)
> +{
> +       u8 pl[2];
> +
> +       pl[1] = len % 256;
> +       pl[0] = (len >> 8) % 256;
> +
> +       regmap_raw_write(map, SX127X_REG_PREAMBLE_MSB, pl, 2);
> +}
> +
> +/**
> + * sx127X_get_lorapreamblelen - Get LoRa preamble length
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     length of the LoRa preamble
> + */
> +u32
> +sx127X_get_lorapreamblelen(struct regmap *map)
> +{
> +       u8 pl[2];
> +       u32 len;
> +
> +       regmap_raw_read(map, SX127X_REG_PREAMBLE_MSB, pl, 2);
> +       len = pl[0] * 256 + pl[1];
> +
> +       return len;
> +}
> +
> +/**
> + * sx127X_set_loracrc - Enable CRC generation and check on received
> payload
> + * @map:       the device as a regmap to communicate with
> + * @yesno:     1 / 0 for check / not check
> + */
> +void
> +sx127X_set_loracrc(struct regmap *map, u8 yesno)
> +{
> +       u8 mcf2;
> +
> +       regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, &mcf2, 1);
> +       mcf2 = (yesno) ? mcf2 | (1 << 2) : mcf2 & (~(1 << 2));
> +       regmap_raw_write(map, SX127X_REG_MODEM_CONFIG2, &mcf2, 1);
> +}
> +
> +/**
> + * sx127X_set_boost - Set RF power amplifier boost in normal output range
> + * @map:       the device as a regmap to communicate with
> + * @yesno:     1 / 0 for boost / not boost
> + */
> +void
> +sx127X_set_boost(struct regmap *map, u8 yesno)
> +{
> +       u8 pacf;
> +
> +       regmap_raw_read(map, SX127X_REG_PA_CONFIG, &pacf, 1);
> +       pacf = (yesno) ? pacf | (1 << 7) : pacf & (~(1 << 7));
> +       regmap_raw_write(map, SX127X_REG_PA_CONFIG, &pacf, 1);
> +}
> +
> +/**
> + * sx127X_start_loramode - Start the device and set it in LoRa mode
> + * @map:       the device as a regmap to communicate with
> + */
> +void
> +sx127X_start_loramode(struct regmap *map)
> +{
> +       u8 op_mode;
> +       u8 base_adr;
> +#ifdef CONFIG_OF
> +       struct device_node *of_node = (regmap_get_device(map))->of_node;
> +#endif
> +
> +       /* Get original OP Mode register. */
> +       op_mode = sx127X_get_mode(map);
> +       dev_dbg(regmap_get_device(map),
> +               "the original OP mode is 0x%X\n", op_mode);
> +
> +       /* Set device to sleep state. */
> +       sx127X_set_state(map, SX127X_SLEEP_MODE);
> +       /* Set device to LoRa mode. */
> +       op_mode = sx127X_get_mode(map);
> +       op_mode = op_mode | 0x80;
> +       regmap_raw_write(map, SX127X_REG_OP_MODE, &op_mode, 1);
> +       /* Set device to standby state. */
> +       sx127X_set_state(map, SX127X_STANDBY_MODE);
> +       op_mode = sx127X_get_mode(map);
> +       dev_dbg(regmap_get_device(map),
> +               "the current OP mode is 0x%X\n", op_mode);
> +
> +       /* Set LoRa in explicit header mode. */
> +       sx127X_set_loraimplicit(map, 0);
> +
> +       /* Set chip FIFO RX base. */
> +       base_adr = SX127X_FIFO_RX_BASE_ADDRESS;
> +       regmap_raw_write(map, SX127X_REG_FIFO_RX_BASE_ADDR, &base_adr, 1);
> +       /* Set chip FIFO TX base. */
> +       base_adr = SX127X_FIFO_TX_BASE_ADDRESS;
> +       regmap_raw_write(map, SX127X_REG_FIFO_TX_BASE_ADDR, &base_adr, 1);
> +
> +       /* Set the CSS spreading factor. */
> +#ifdef CONFIG_OF
> +       of_property_read_u32(of_node, "spreading-factor", &sprf);
> +#endif
> +       sx127X_set_lorasprf(map, sprf);
> +
> +       /* Set RX time-out value. */
> +       sx127X_set_lorarxbytetimeout(map, rx_timeout);
> +
> +       /* Clear all of the IRQ flags. */
> +       sx127X_clear_loraallflag(map);
> +       /* Set chip to RX state waiting for receiving. */
> +       sx127X_set_state(map, SX127X_RXSINGLE_MODE);
> +}
> +
> +/**
> + * init_sx127x - Initial the SX127X device
> + * @map:       the device as a regmap to communicate with
> + *
> + * Return:     0 / negtive values for success / failed
> + */
> +int
> +init_sx127x(struct regmap *map)
> +{
> +       int v;
> +#ifdef DEBUG
> +       u8 fv, mv;
> +#endif
> +
> +       dev_dbg(regmap_get_device(map), "init sx127X\n");
> +
> +       v = sx127X_read_version(map);
> +       if (v > 0) {
> +#ifdef DEBUG
> +               fv = (v >> 4) & 0xF;
> +               mv = v & 0xF;
> +               dev_dbg(regmap_get_device(map), "chip version %d.%d\n",
> fv, mv);
> +#endif
> +               return 0;
> +       } else {
> +               return -ENODEV;
> +       }
> +}
> +
> +/*---------------------- SX1278 IEEE 802.15.4 Functions
> ----------------------*/
> +
> +/* LoRa device's sensitivity in dbm. */
> +#ifndef SX1278_IEEE_SENSITIVITY
> +#define SX1278_IEEE_SENSITIVITY        (-148)
> +#endif
> +static s32 sensitivity = SX1278_IEEE_SENSITIVITY;
> +module_param(sensitivity, int, 0000);
> +MODULE_PARM_DESC(sensitivity, "RF receiver's sensitivity");
> +
> +#define SX1278_IEEE_ENERGY_RANGE       (-sensitivity)
> +
> +static int
> +sx1278_ieee_ed(struct ieee802154_hw *hw, u8 *level)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       s32 rssi;
> +       s32 range = SX1278_IEEE_ENERGY_RANGE - 10;
> +
> +       dev_dbg(regmap_get_device(phy->map), "%s\n", __func__);
> +
> +       /* ED: IEEE  802.15.4-2011 8.2.5 Recevier ED. */
> +       rssi = sx127X_get_lorarssi(phy->map);
> +       if (rssi < (sensitivity + 10))
> +               *level = 0;
> +       else if (rssi >= 0)
> +               *level = 255;
> +       else
> +               *level = ((s32)255 * (rssi + range) / range) % 255;
> +
> +       return 0;
> +}
> +
> +#ifndef SX1278_IEEE_CHANNEL_MIN
> +#define SX1278_IEEE_CHANNEL_MIN                11
> +#endif
> +static u8 channel_min = SX1278_IEEE_CHANNEL_MIN;
> +module_param(channel_min, byte, 0000);
> +MODULE_PARM_DESC(channel_min, "Minimal channel number");
> +
> +#ifndef SX1278_IEEE_CHANNEL_MAX
> +#define SX1278_IEEE_CHANNEL_MAX                11
> +#endif
> +static u8 channel_max = SX1278_IEEE_CHANNEL_MAX;
> +module_param(channel_max, byte, 0000);
> +MODULE_PARM_DESC(channel_max, "Maximum channel number");
> +
> +#ifndef SX1278_IEEE_CENTER_CARRIER_FRQ
> +#define SX1278_IEEE_CENTER_CARRIER_FRQ 434000000
> +#endif
> +static u32 carrier_frq = SX1278_IEEE_CENTER_CARRIER_FRQ;
> +module_param(carrier_frq, uint, 0000);
> +MODULE_PARM_DESC(carrier_frq, "Center carrier frequency in Hz");
> +
> +#ifndef SX1278_IEEE_BANDWIDTH
> +#define SX1278_IEEE_BANDWIDTH          500000
> +#endif
> +static u32 bandwidth = SX1278_IEEE_BANDWIDTH;
> +module_param(bandwidth, uint, 0000);
> +MODULE_PARM_DESC(bandwidth, "Bandwidth in Hz");
> +
> +struct rf_frq {
> +       u32 carrier;
> +       u32 bw;
> +       u8 ch_min;
> +       u8 ch_max;
> +};
> +
> +void
> +sx1278_ieee_get_rf_config(struct ieee802154_hw *hw, struct rf_frq *rf)
> +{
> +#ifdef CONFIG_OF
> +       struct sx1278_phy *phy = hw->priv;
> +       struct device_node *of_node = (regmap_get_device(phy->map))-
> >of_node;
> +
> +       /* Set the LoRa chip's center carrier frequency. */
> +       if (of_property_read_u32(of_node, "center-carrier-frq",
> &rf->carrier))
> +               rf->carrier = carrier_frq;
> +
> +       /* Set the LoRa chip's RF bandwidth. */
> +       if (of_property_read_u32(of_node, "rf-bandwidth", &rf->carrier))
> +               rf->bw = bandwidth;
> +
> +       /* Set the LoRa chip's min & max RF channel if OF is defined. */
> +       if (of_property_read_u8(of_node, "minimal-RF-channel",
> &rf->ch_min))
> +               rf->ch_min = channel_min;
> +
> +       if (of_property_read_u8(of_node, "maximum-RF-channel",
> &rf->ch_max))
> +               rf->ch_max = channel_max;
> +#else
> +       rf->carrier = carrier_frq;
> +       rf->bw = bandwidth;
> +       rf->ch_min = channel_min;
> +       rf->ch_max = channel_max;
> +#endif
> +}
> +
> +static int
> +sx1278_ieee_set_channel(struct ieee802154_hw *hw, u8 page, u8 channel)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       struct rf_frq rf;
> +       u32 fr;
> +       s8 d;
> +
> +       dev_dbg(regmap_get_device(phy->map),
> +               "%s channel: %u", __func__, channel);
> +
> +       sx1278_ieee_get_rf_config(hw, &rf);
> +
> +       if (channel < rf.ch_min)
> +               channel = rf.ch_min;
> +       else if (channel > rf.ch_max)
> +               channel = rf.ch_max;
> +
> +       d = channel - (rf.ch_min + rf.ch_max) / 2;
> +       fr = rf.carrier + d * rf.bw;
> +
> +       sx127X_set_lorafrq(phy->map, fr);
> +
> +       return 0;
> +}
> +
> +/* in mbm */
> +s32 sx1278_powers[] = {
> +       -200, -100, 0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000,
> 1100,
> +       1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200,
> 2300};
> +
> +static int
> +sx1278_ieee_set_txpower(struct ieee802154_hw *hw, s32 mbm)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       s32 dbm = sx127X_mbm2dbm(mbm);
> +
> +       dev_dbg(regmap_get_device(phy->map),
> +               "%s TX power: %d mbm", __func__, mbm);
> +
> +       sx127X_set_lorapower(phy->map, dbm);
> +
> +       return 0;
> +}
> +
> +int
> +sx1278_ieee_rx(struct ieee802154_hw *hw)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       bool do_rx;
> +
> +       dev_dbg(regmap_get_device(phy->map), "%s\n", __func__);
> +
> +       spin_lock(&phy->buf_lock);
> +       if (!phy->is_busy) {
> +               phy->is_busy = true;
> +               do_rx = true;
> +       } else {
> +               do_rx = false;
> +       }
> +       spin_unlock(&phy->buf_lock);
> +
> +       if (do_rx) {
> +               sx127X_set_state(phy->map, SX127X_RXSINGLE_MODE);
> +               return 0;
> +       } else {
> +               return -EBUSY;
> +       }
> +}
> +
> +static int
> +sx1278_ieee_rx_complete(struct ieee802154_hw *hw)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       struct sk_buff *skb;
> +       u8 len;
> +       u8 lqi;
> +       s32 rssi;
> +       s32 range = SX1278_IEEE_ENERGY_RANGE;
> +       int err;
> +
> +       skb = dev_alloc_skb(IEEE802154_MTU);
> +       if (!skb) {
> +               err = -ENOMEM;
> +               goto sx1278_ieee_rx_err;
> +       }
> +
> +       len = sx127X_get_loralastpktpayloadlen(phy->map);
> +       sx127X_readloradata(phy->map, skb_put(skb, len), len);
> +
> +       /* LQI: IEEE  802.15.4-2011 8.2.6 Link quality indicator. */
> +       rssi = sx127X_get_loralastpktrssi(phy->map);
> +       rssi = (rssi > 0) ? 0 : rssi;
> +       lqi = ((s32)255 * (rssi + range) / range) % 255;
> +
> +       ieee802154_rx_irqsafe(hw, skb, lqi);
> +
> +       spin_lock(&phy->buf_lock);
> +       phy->is_busy = false;
> +       spin_unlock(&phy->buf_lock);
> +
> +       dev_dbg(regmap_get_device(phy->map),
> +               "%s: len=%u LQI=%u\n", __func__, len, lqi);
> +
> +       return 0;
> +
> +sx1278_ieee_rx_err:
> +       return err;
> +}
> +
> +int
> +sx1278_ieee_tx(struct ieee802154_hw *hw)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       struct sk_buff *tx_buf = phy->tx_buf;
> +       bool do_tx = false;
> +
> +       dev_dbg(regmap_get_device(phy->map),
> +               "%s: len=%u\n", __func__, tx_buf->len);
> +
> +       if (!phy->post_tx_done) {
> +               sx127X_sendloradata(phy->map, tx_buf->data, tx_buf->len);
> +               phy->post_tx_done = true;
> +       }
> +
> +       spin_lock(&phy->buf_lock);
> +       if (!phy->is_busy) {
> +               phy->is_busy = true;
> +               do_tx = true;
> +               phy->one_to_be_sent = false;
> +       }
> +       spin_unlock(&phy->buf_lock);
> +
> +       if (do_tx) {
> +               /* Set chip as TX state and transfer the data in FIFO. */
> +               phy->opmode = (phy->opmode & 0xF8) | SX127X_TX_MODE;
> +               regmap_write_async(phy->map, SX127X_REG_OP_MODE,
> phy->opmode);
> +               return 0;
> +       } else {
> +               return -EBUSY;
> +       }
> +}
> +
> +static int
> +sx1278_ieee_tx_complete(struct ieee802154_hw *hw)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       struct sk_buff *skb = phy->tx_buf;
> +
> +       dev_dbg(regmap_get_device(phy->map), "%s\n", __func__);
> +
> +       ieee802154_xmit_complete(hw, skb, false);
> +
> +       spin_lock(&phy->buf_lock);
> +       phy->is_busy = false;
> +       phy->tx_buf = NULL;
> +       spin_unlock(&phy->buf_lock);
> +
> +       return 0;
> +}
> +
> +static int
> +sx1278_ieee_xmit(struct ieee802154_hw *hw, struct sk_buff *skb)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       int ret;
> +
> +       dev_dbg(regmap_get_device(phy->map), "%s\n", __func__);
> +
> +       WARN_ON(phy->suspended);
> +
> +       spin_lock(&phy->buf_lock);
> +       if (phy->tx_buf) {
> +               ret = -EBUSY;
> +       } else {
> +               phy->tx_buf = skb;
> +               phy->one_to_be_sent = true;
> +               phy->post_tx_done = false;
> +               ret = 0;
> +       }
> +       spin_unlock(&phy->buf_lock);
> +
> +       return ret;
> +}
> +
> +static int
> +sx1278_ieee_start(struct ieee802154_hw *hw)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +
> +       dev_dbg(regmap_get_device(phy->map), "interface up\n");
> +
> +       phy->suspended = false;
> +       sx127X_start_loramode(phy->map);
> +       phy->opmode = sx127X_get_mode(phy->map);
> +       add_timer(&phy->timer);
> +
> +       return 0;
> +}
> +
> +static void
> +sx1278_ieee_stop(struct ieee802154_hw *hw)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +
> +       dev_dbg(regmap_get_device(phy->map), "interface down\n");
> +
> +       phy->suspended = true;
> +       del_timer(&phy->timer);
> +       sx127X_set_state(phy->map, SX127X_SLEEP_MODE);
> +}
> +
> +static int
> +sx1278_ieee_set_promiscuous_mode(struct ieee802154_hw *hw, const bool on)
> +{
> +       return 0;
> +}
> +
> +void
> +sx1278_ieee_statemachine(struct ieee802154_hw *hw)
> +{
> +       struct sx1278_phy *phy = hw->priv;
> +       u8 flags;
> +       u8 state;
> +       bool do_next_rx = false;
> +
> +       flags = sx127X_get_loraallflag(phy->map);
> +       state = sx127X_get_state(phy->map);
> +
> +       if (flags & (SX127X_FLAG_RXTIMEOUT | SX127X_FLAG_PAYLOADCRCERROR))
> {
> +               sx127X_clear_loraflag(phy->map, SX127X_FLAG_RXTIMEOUT
> +                                               |
> SX127X_FLAG_PAYLOADCRCERROR
> +                                               | SX127X_FLAG_RXDONE);
> +               spin_lock(&phy->buf_lock);
> +               phy->is_busy = false;
> +               spin_unlock(&phy->buf_lock);
> +               do_next_rx = true;
> +       } else if (flags & SX127X_FLAG_RXDONE) {
> +               sx1278_ieee_rx_complete(phy->hw);
> +               sx127X_clear_loraflag(phy->map, SX127X_FLAG_RXDONE);
> +               do_next_rx = true;
> +       }
> +
> +       if (flags & SX127X_FLAG_TXDONE) {
> +               sx1278_ieee_tx_complete(phy->hw);
> +               sx127X_clear_loraflag(phy->map, SX127X_FLAG_TXDONE);
> +               phy->tx_delay = 10;
> +               do_next_rx = true;
> +       }
> +
> +       if (phy->one_to_be_sent &&
> +           (state == SX127X_STANDBY_MODE) &&
> +           (phy->tx_delay == 0)) {
> +               if (!sx1278_ieee_tx(phy->hw))
> +                       do_next_rx = false;
> +       }
> +
> +       if (do_next_rx)
> +               sx1278_ieee_rx(phy->hw);
> +
> +       if (phy->tx_delay > 0)
> +               phy->tx_delay -= 1;
> +
> +       if (!phy->suspended) {
> +               phy->timer.expires = jiffies_64 + 1;
> +               add_timer(&phy->timer);
> +       }
> +}
> +
> +/**
> + * sx1278_timer_irqwork - The actual work which checks the IRQ flags of
> the chip
> + * @work:      the work entry listed in the workqueue
> + */
> +static void
> +sx1278_timer_irqwork(struct work_struct *work)
> +{
> +       struct sx1278_phy *phy;
> +
> +       phy = container_of(work, struct sx1278_phy, irqwork);
> +       sx1278_ieee_statemachine(phy->hw);
> +}
> +
> +/**
> + * sx1278_timer_isr - Callback function for the timer interrupt
> + * @arg:       the general argument for this callback function
> + */
> +static void
> +sx1278_timer_isr(unsigned long arg)
> +{
> +       struct sx1278_phy *phy = (struct sx1278_phy *)arg;
> +
> +       schedule_work(&phy->irqwork);
> +}
> +
> +static const struct ieee802154_ops sx1278_ops = {
> +       .owner = THIS_MODULE,
> +       .xmit_async = sx1278_ieee_xmit,
> +       .ed = sx1278_ieee_ed,
> +       .set_channel = sx1278_ieee_set_channel,
> +       .set_txpower = sx1278_ieee_set_txpower,
> +       .start = sx1278_ieee_start,
> +       .stop = sx1278_ieee_stop,
> +       .set_promiscuous_mode = sx1278_ieee_set_promiscuous_mode,
> +};
> +
> +/**
> + * sx1278X_ieee_channel_mask - Get the available channels' mask of LoRa
> device
> + * @hw:                LoRa IEEE 802.15.4 device
> + *
> + * Return:     The bitwise channel mask in 4 bytes
> + */
> +u32
> +sx1278_ieee_channel_mask(struct ieee802154_hw *hw)
> +{
> +       struct rf_frq rf;
> +       u32 mask;
> +
> +       sx1278_ieee_get_rf_config(hw, &rf);
> +
> +       mask = ((u32)(1 << (rf.ch_max + 1)) - (u32)(1 << rf.ch_min));
> +
> +       return mask;
> +}
> +
> +static int
> +sx1278_ieee_add_one(struct sx1278_phy *phy)
> +{
> +       struct ieee802154_hw *hw = phy->hw;
> +       int err;
> +
> +       /* Define channels could be used. */
> +       hw->phy->supported.channels[0] = sx1278_ieee_channel_mask(hw);
> +       /* SX1278 phy channel 11 as default */
> +       hw->phy->current_channel = 11;
> +
> +       /* Define RF power. */
> +       hw->phy->supported.tx_powers = sx1278_powers;
> +       hw->phy->supported.tx_powers_size = ARRAY_SIZE(sx1278_powers);
> +       hw->phy->transmit_power = sx1278_powers[12];
> +
> +       ieee802154_random_extended_addr(&hw->phy->perm_extended_addr);
> +       hw->flags = IEEE802154_HW_TX_OMIT_CKSUM
> +                       | IEEE802154_HW_RX_OMIT_CKSUM
> +                       | IEEE802154_HW_PROMISCUOUS;
> +
> +       err = ieee802154_register_hw(hw);
> +       if (err)
> +               goto err_reg;
> +
> +       INIT_WORK(&phy->irqwork, sx1278_timer_irqwork);
> +
> +       init_timer(&phy->timer);
> +       phy->timer.expires = jiffies_64 + HZ;
> +       phy->timer.function = sx1278_timer_isr;
> +       phy->timer.data = (unsigned long)phy;
> +
> +       spin_lock_init(&phy->buf_lock);
> +
> +       err = init_sx127x(phy->map);
> +       if (err)
> +               goto err_reg;
> +
> +       return 0;
> +
> +err_reg:
> +       dev_err(regmap_get_device(phy->map),
> +               "register as IEEE 802.15.4 device failed\n");
> +       return err;
> +}
> +
> +static void
> +sx1278_ieee_del(struct sx1278_phy *phy)
> +{
> +       if (!phy)
> +               return;
> +
> +       del_timer(&phy->timer);
> +       flush_work(&phy->irqwork);
> +
> +       ieee802154_unregister_hw(phy->hw);
> +       ieee802154_free_hw(phy->hw);
> +}
> +
> +/*--------------------------- SX1278 SPI Functions
> ---------------------------*/
> +
> +/* The compatible chip array. */
> +#ifdef CONFIG_OF
> +static const struct of_device_id sx1278_dt_ids[] = {
> +       { .compatible = "semtech,sx1276" },
> +       { .compatible = "semtech,sx1277" },
> +       { .compatible = "semtech,sx1278" },
> +       { .compatible = "semtech,sx1279" },
> +       { .compatible = "sx1278" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, sx1278_dt_ids);
> +#endif
> +
> +/* The compatible ACPI device array. */
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id sx1278_acpi_ids[] = {
> +       { .id = "sx1278" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(acpi, sx1278_acpi_ids);
> +#endif
> +
> +/* The compatible SPI device id array. */
> +static const struct spi_device_id sx1278_spi_ids[] = {
> +       { .name = "sx1278" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(spi, sx1278_spi_ids);
> +
> +bool sx1278_reg_volatile(struct device *dev, unsigned int reg)
> +{
> +       return true;
> +}
> +
> +/* The SX1278 regmap config. */
> +struct regmap_config sx1278_regmap_config = {
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +       .max_register = SX127X_MAX_REG,
> +       .read_flag_mask = 0x00,
> +       .write_flag_mask = 0x80,
> +       .volatile_reg = sx1278_reg_volatile,
> +};
> +
> +/* The SPI probe callback function. */
> +static int sx1278_spi_probe(struct spi_device *spi)
> +{
> +       struct ieee802154_hw *hw;
> +       struct sx1278_phy *phy;
> +       int err;
> +
> +       hw = ieee802154_alloc_hw(sizeof(*phy), &sx1278_ops);
> +       if (!hw) {
> +               dev_err(&spi->dev, "not enough memory\n");
> +               return -ENOMEM;
> +       }
> +
> +       phy = hw->priv;
> +       phy->hw = hw;
> +       hw->parent = &spi->dev;
> +       phy->map = devm_regmap_init_spi(spi, &sx1278_regmap_config);
> +
> +       /* Set the SPI device's driver data for later usage. */
> +       spi_set_drvdata(spi, phy);
> +
> +       err = sx1278_ieee_add_one(phy);
> +       if (err < 0) {
> +               dev_err(&spi->dev, "no SX1278 compatible device\n");
> +               goto sx1278_spi_probe_err;
> +       }
> +
> +       dev_info(&spi->dev,
> +                "add an IEEE 802.15.4 over LoRa SX1278 compatible
> device\n");
> +
> +       return 0;
> +
> +sx1278_spi_probe_err:
> +       sx1278_ieee_del(phy);
> +       return err;
> +}
> +
> +/* The SPI remove callback function. */
> +static int sx1278_spi_remove(struct spi_device *spi)
> +{
> +       struct sx1278_phy *phy = spi_get_drvdata(spi);
> +
> +       sx1278_ieee_del(phy);
> +
> +       return 0;
> +}
> +
> +#define __DRIVER_NAME  "sx1278"
> +
> +/* The SPI driver which acts as a protocol driver in this kernel module.
> */
> +static struct spi_driver sx1278_spi_driver = {
> +       .driver = {
> +               .name = __DRIVER_NAME,
> +               .owner = THIS_MODULE,
> +#ifdef CONFIG_OF
> +               .of_match_table = of_match_ptr(sx1278_dt_ids),
> +#endif
> +#ifdef CONFIG_ACPI
> +               .acpi_match_table = ACPI_PTR(sx1278_acpi_ids),
> +#endif
> +       },
> +       .probe = sx1278_spi_probe,
> +       .remove = sx1278_spi_remove,
> +       .id_table = sx1278_spi_ids,
> +};
> +
> +/* Register SX1278 kernel module. */
> +module_spi_driver(sx1278_spi_driver);
> +
> +MODULE_AUTHOR("Jian-Hong Pan, <starnight@g.ncu.edu.tw>");
> +MODULE_DESCRIPTION("LoRa device SX1278 driver with IEEE 802.15.4
> interface");
> +MODULE_LICENSE("Dual BSD/GPL");
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wpan" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



--

--001a1143971e89eb060558e52783
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Pan,<div><br></div><div>From my point of view, it is=
 not a good idea to write sx127x driver for IEEE 802154. Because LoRa is no=
t compatible with IEEE 802.15.4 in PHY and MAC layer.</div><div><br></div><=
div>I think it is better to make individual Phy and MAC layers for LoRa in =
Linux kernel, where a sx127x driver will make sense.</div><div><br></div><d=
iv>Regards,</div><div><br></div><div>Xue Liu=C2=A0<br></div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On 10 September 2017 at 11=
:30, Jian-Hong Pan <span dir=3D"ltr">&lt;<a href=3D"mailto:starnight@g.ncu.=
edu.tw" target=3D"_blank">starnight@g.ncu.edu.tw</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">LoRa is an implementation of LPWPAN.<br>
Chirp Spread Spectrum (CSS) modulation, which is used by LoRa has been<br>
specified by IEEE 802.15.4a.<br>
This driver implements IEEE 802.15.4 mac over LoRa physical layer not<br>
LoRaWAN.<br>
<br>
Signed-off-by: Jian-Hong Pan &lt;<a href=3D"mailto:starnight@g.ncu.edu.tw">=
starnight@g.ncu.edu.tw</a>&gt;<br>
---<br>
=C2=A0.../devicetree/bindings/net/<wbr>ieee802154/sx1278.txt=C2=A0 |=C2=A0 =
=C2=A030 +<br>
=C2=A0drivers/net/ieee802154/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +<br>
=C2=A0drivers/net/ieee802154/<wbr>Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0drivers/net/ieee802154/sx1278.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1636 ++++++++++++++++++++<br>
=C2=A04 files changed, 1679 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/net/ieee802=
154/<wbr>sx1278.txt<br>
=C2=A0create mode 100644 drivers/net/ieee802154/sx1278.<wbr>c<br>
<br>
diff --git a/Documentation/devicetree/<wbr>bindings/net/ieee802154/<wbr>sx1=
278.txt b/Documentation/devicetree/<wbr>bindings/net/ieee802154/<wbr>sx1278=
.txt<br>
new file mode 100644<br>
index 000000000000..78ca60feac30<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/net/ieee802154/<wbr>sx1278.txt=
<br>
@@ -0,0 +1,30 @@<br>
+* SX1278 IEEE 802.15.4 Compatible Radio *<br>
+<br>
+Required properties:<br>
+=C2=A0 - compatible:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 should be &quot;semtech,sx1276&quot;, &quot;semtech,sx1277&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;semtech,sx1277&quot; or &quot;semtech,sx1279&quot; depends =
on your<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0transceiver board<br>
+=C2=A0 - spi-max-frequency: maximal bus speed, should be set something und=
er or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0equal 10000000 Hz<br>
+=C2=A0 - reg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the ch=
ipselect index<br>
+=C2=A0 - clock-frequency:=C2=A0 =C2=A0the external crystal oscillator freq=
uency in Hz of the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0transceiver<br>
+Optional properties:<br>
+=C2=A0 - center-carrier-frq:=C2=A0 =C2=A0 =C2=A0 =C2=A0 the RF center carr=
ier frequency in Hz<br>
+=C2=A0 - rf-bandwidth:=C2=A0 =C2=A0 =C2=A0 the RF bandwidth in Hz<br>
+=C2=A0 - minimal-RF-channel:=C2=A0 =C2=A0 =C2=A0 =C2=A0 the minimal RF cha=
nnel number and the value must be with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0prefix &quot;/bits/ 8&quot; because of being a byte datatype<br>
+=C2=A0 - maximum-RF-channel: the maximum RF channel number and the value m=
ust be with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0prefix &quot;/bits/ 8&quot; because of being a byte datatype<br>
+=C2=A0 - spreading-factor:=C2=A0 the spreading factor of Chirp Spread Spec=
trum modulation<br>
+<br>
+Example:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;semtech,sx1278&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =
=3D &lt;15200&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequency =3D=
 &lt;32000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minimal-RF-channel =
=3D /bits/ 8 &lt;11&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maximum-RF-channel =
=3D /bits/ 8 &lt;11&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
diff --git a/drivers/net/ieee802154/<wbr>Kconfig b/drivers/net/ieee802154/<=
wbr>Kconfig<br>
index 303ba4133920..57ed64e55d13 100644<br>
--- a/drivers/net/ieee802154/<wbr>Kconfig<br>
+++ b/drivers/net/ieee802154/<wbr>Kconfig<br>
@@ -104,3 +104,15 @@ config IEEE802154_CA8210_DEBUGFS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exposes a debugfs node for each CA8210 i=
nstance which allows<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 direct use of the Cascoda API, exposing =
the 802.15.4 MAC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 management entities.<br>
+<br>
+config IEEE802154_SX1278<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Semtech SX1276/77/78/79 transcei=
ver driver&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on IEEE802154_DRIVERS &amp;&amp; MAC802=
154<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on SPI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select REGMAP_SPI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0---help---<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here to enable the SX1278 SPI 802.=
15.4 wireless<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0controller.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a modul=
e. To do so, say M here.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the module will be called &#39;sx1278&#3=
9;.<br>
diff --git a/drivers/net/ieee802154/<wbr>Makefile b/drivers/net/ieee802154/=
<wbr>Makefile<br>
index 8374bb44a145..634e8e1bfad6 100644<br>
--- a/drivers/net/ieee802154/<wbr>Makefile<br>
+++ b/drivers/net/ieee802154/<wbr>Makefile<br>
@@ -5,3 +5,4 @@ obj-$(CONFIG_IEEE802154_<wbr>CC2520) +=3D cc2520.o<br>
=C2=A0obj-$(CONFIG_IEEE802154_ATUSB) +=3D atusb.o<br>
=C2=A0obj-$(CONFIG_IEEE802154_<wbr>ADF7242) +=3D adf7242.o<br>
=C2=A0obj-$(CONFIG_IEEE802154_<wbr>CA8210) +=3D ca8210.o<br>
+obj-$(CONFIG_IEEE802154_<wbr>SX1278) +=3D sx1278.o<br>
diff --git a/drivers/net/ieee802154/<wbr>sx1278.c b/drivers/net/ieee802154/=
<wbr>sx1278.c<br>
new file mode 100644<br>
index 000000000000..2018407a0ab7<br>
--- /dev/null<br>
+++ b/drivers/net/ieee802154/<wbr>sx1278.c<br>
@@ -0,0 +1,1636 @@<br>
+/*-<br>
+ * Copyright (c) 2017 Jian-Hong, Pan &lt;<a href=3D"mailto:starnight@g.ncu=
.edu.tw">starnight@g.ncu.edu.tw</a>&gt;<br>
+ *<br>
+ * All rights reserved.<br>
+ *<br>
+ * Redistribution and use in source and binary forms, with or without<br>
+ * modification, are permitted provided that the following conditions<br>
+ * are met:<br>
+ * 1. Redistributions of source code must retain the above copyright<br>
+ *=C2=A0 =C2=A0 notice, this list of conditions and the following disclaim=
er,<br>
+ *=C2=A0 =C2=A0 without modification.<br>
+ * 2. Redistributions in binary form must reproduce at minimum a disclaime=
r<br>
+ *=C2=A0 =C2=A0 similar to the &quot;NO WARRANTY&quot; disclaimer below (&=
quot;Disclaimer&quot;) and any<br>
+ *=C2=A0 =C2=A0 redistribution must be conditioned upon including a substa=
ntially<br>
+ *=C2=A0 =C2=A0 similar Disclaimer requirement for further binary redistri=
bution.<br>
+ * 3. Neither the names of the above-listed copyright holders nor the name=
s<br>
+ *=C2=A0 =C2=A0 of any contributors may be used to endorse or promote prod=
ucts derived<br>
+ *=C2=A0 =C2=A0 from this software without specific prior written permissi=
on.<br>
+ *<br>
+ * Alternatively, this software may be distributed under the terms of the<=
br>
+ * GNU General Public License (&quot;GPL&quot;) version 2 as published by =
the Free<br>
+ * Software Foundation.<br>
+ *<br>
+ * NO WARRANTY<br>
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS<br>
+ * &#39;&#39;AS IS&#39;&#39; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUD=
ING, BUT NOT<br>
+ * LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY<=
br>
+ * AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL<=
br>
+ * THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,=
<br>
+ * OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF=
<br>
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINES=
S<br>
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER<br=
>
+ * IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWI=
SE)<br>
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF<=
br>
+ * THE POSSIBILITY OF SUCH DAMAGES.<br>
+ *<br>
+ */<br>
+<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/timer.h&gt;<br>
+#include &lt;linux/device.h&gt;<br>
+#include &lt;linux/acpi.h&gt;<br>
+#include &lt;linux/of_device.h&gt;<br>
+#include &lt;linux/spinlock.h&gt;<br>
+#include &lt;linux/spi/spi.h&gt;<br>
+#include &lt;linux/regmap.h&gt;<br>
+#include &lt;net/mac802154.h&gt;<br>
+<br>
+/*---------------------------<wbr>--- LoRa Functions ---------------------=
---------<wbr>*/<br>
+<br>
+#ifndef F_XOSC<br>
+#define F_XOSC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032000000<br>
+#endif<br>
+static u32 xosc_frq =3D F_XOSC;<br>
+module_param(xosc_frq, uint, 0000);<br>
+MODULE_PARM_DESC(xosc_frq, &quot;Crystal oscillator frequency of the LoRa =
chip&quot;);<br>
+<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 __POW_2_19=C2=A0 =C2=A0 =C2=A0 0x80000<=
br>
+<br>
+#ifndef SX127X_SPRF<br>
+#define SX127X_SPRF=C2=A0 =C2=A0 512<br>
+#endif<br>
+static u32 sprf =3D SX127X_SPRF;<br>
+module_param(sprf, uint, 0000);<br>
+MODULE_PARM_DESC(sprf, &quot;Spreading factor of Chirp Spread Spectrum mod=
ulation&quot;);<br>
+<br>
+#ifndef SX127X_RX_BYTE_TIMEOUT<br>
+#define SX127X_RX_BYTE_TIMEOUT 1023<br>
+#endif<br>
+static u32 rx_timeout =3D SX127X_RX_BYTE_TIMEOUT;<br>
+module_param(rx_timeout, uint, 0000);<br>
+MODULE_PARM_DESC(rx_timeout, &quot;RX time-out value as number of symbols&=
quot;);<br>
+<br>
+/* SX127X Registers addresses */<br>
+#define SX127X_REG_FIFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00<br>
+#define SX127X_REG_OP_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01<br>
+#define SX127X_REG_FRF_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x06<br>
+#define SX127X_REG_FRF_MID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x07<br>
+#define SX127X_REG_FRF_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x08<br>
+#define SX127X_REG_PA_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x09<br>
+#define SX127X_REG_PA_RAMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0A<br>
+#define SX127X_REG_OCP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0B<br>
+#define SX127X_REG_LNA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0C<br>
+#define SX127X_REG_FIFO_ADDR_PTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0D<br>
+#define SX127X_REG_FIFO_TX_BASE_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x0E<br>
+#define SX127X_REG_FIFO_RX_BASE_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x0F<br>
+#define SX127X_REG_FIFO_RX_CURRENT_<wbr>ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<br>
+#define SX127X_REG_IRQ_FLAGS_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x11<br>
+#define SX127X_REG_IRQ_FLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x12<br>
+#define SX127X_REG_RX_NB_BYTES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x13<br>
+#define SX127X_REG_RX_HEADER_CNT_<wbr>VALUE_MSB=C2=A0 =C2=A0 =C2=A00x14<br=
>
+#define SX127X_REG_RX_HEADER_CNT_<wbr>VALUE_LSB=C2=A0 =C2=A0 =C2=A00x15<br=
>
+#define SX127X_REG_RX_PACKET_CNT_<wbr>VALUE_MSB=C2=A0 =C2=A0 =C2=A00x16<br=
>
+#define SX127X_REG_RX_PACKET_CNT_<wbr>VALUE_LSB=C2=A0 =C2=A0 =C2=A00x17<br=
>
+#define SX127X_REG_MODEM_STAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x18<br>
+#define SX127X_REG_PKT_SNR_VALUE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x19<br>
+#define SX127X_REG_PKT_RSSI_VALUE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x1A<br>
+#define SX127X_REG_RSSI_VALUE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x1B<br>
+#define SX127X_REG_HOP_CHANNEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x1C<br>
+#define SX127X_REG_MODEM_CONFIG1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x1D<br>
+#define SX127X_REG_MODEM_CONFIG2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x1E<br>
+#define SX127X_REG_SYMB_TIMEOUT_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x1F<br>
+#define SX127X_REG_PREAMBLE_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x20<br>
+#define SX127X_REG_PREAMBLE_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x21<br>
+#define SX127X_REG_PAYLOAD_LENGTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x22<br>
+#define SX127X_REG_MAX_PAYLOAD_LENGTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
23<br>
+#define SX127X_REG_HOP_PERIOD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x24<br>
+#define SX127X_REG_FIFO_RX_BYTE_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x25<br>
+#define SX127X_REG_MODEM_CONFIG3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x26<br>
+#define SX127X_REG_FEI_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x28<br>
+#define SX127X_REG_FEI_MID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x29<br>
+#define SX127X_REG_FEI_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2A<br>
+#define SX127X_REG_RSSI_WIDEBAND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x2C<br>
+#define SX127X_REG_DETECT_OPTIMIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x31<br>
+#define SX127X_REG_INVERT_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x33<br>
+#define SX127X_REG_DETECTION_THRESHOLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
37<br>
+#define SX127X_REG_SYNC_WORD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x39<br>
+#define SX127X_REG_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x42<br>
+#define SX127X_REG_TCXO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4B<br>
+#define SX127X_REG_PA_DAC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4D<br>
+#define SX127X_REG_FORMER_TEMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x5B<br>
+#define SX127X_REG_AGC_REF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x61<br>
+#define SX127X_REG_AGC_THRESH1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x62<br>
+#define SX127X_REG_AGC_THRESH2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x63<br>
+#define SX127X_REG_AGC_THRESH3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x64<br>
+#define SX127X_REG_PLL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x70<br>
+#define SX127X_MAX_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SX127X_REG_PLL<br>
+<br>
+/* SX127X&#39;s operating states in LoRa mode */<br>
+#define SX127X_SLEEP_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00<br>
+#define SX127X_STANDBY_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x01<br>
+#define SX127X_FSTX_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x02<br>
+#define SX127X_TX_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x03<br>
+#define SX127X_FSRX_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x04<br>
+#define SX127X_RXCONTINUOUS_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x05<br>
+#define SX127X_RXSINGLE_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x06<br>
+#define SX127X_CAD_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x07<br>
+<br>
+/* SX127X&#39;s IRQ flags in LoRa mode */<br>
+#define SX127X_FLAG_RXTIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x80<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 SX127X_FLAG_RXDONE=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40<br>
+#define SX127X_FLAG_PAYLOADCRCERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x20<br>
+#define SX127X_FLAG_VALIDHEADER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<br>
+#define SX127X_FLAG_TXDONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x08<br>
+#define SX127X_FLAG_CADDONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x04<br>
+#define SX127X_FLAG_FHSSCHANGECHANNEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
02<br>
+#define SX127X_FLAG_CADDETECTED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01<br>
+<br>
+/* SX127X&#39;s IRQ flags&#39; mask for output pins in LoRa mode */<br>
+#define SX127X_FLAGMASK_RXTIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x80<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 SX127X_FLAGMASK_RXDONE=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40<br>
+#define SX127X_FLAGMASK_<wbr>PAYLOADCRCERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x20<br>
+#define SX127X_FLAGMASK_VALIDHEADER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x10<br>
+#define SX127X_FLAGMASK_TXDONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x08<br>
+#define SX127X_FLAGMASK_CADDONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04<br>
+#define SX127X_FLAGMASK_<wbr>FHSSCHANGECHANNEL=C2=A0 =C2=A0 =C2=A0 0x02<br=
>
+#define SX127X_FLAGMASK_CADDETECTED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x01<br>
+<br>
+/* SX127X&#39;s RX/TX FIFO base address */<br>
+#define SX127X_FIFO_RX_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x00<br>
+#define SX127X_FIFO_TX_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x80<br>
+<br>
+struct sx1278_phy {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ieee802154_hw *hw;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap *map;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool suspended;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 opmode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct timer_list timer;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct work_struct irqwork;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Lock the RX and TX actions. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t buf_lock;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sk_buff *tx_buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 tx_delay;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool one_to_be_sent;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool post_tx_done;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_busy;<br>
+};<br>
+<br>
+/**<br>
+ * sx127X_read_version - Get LoRa device&#39;s chip version<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0Positive / negtive values for version code /=
 failed<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Version code:=C2=A0 =C2=
=A0bits 7-4 full version number,<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bits 3-0 metal mask revision number<br>
+ */<br>
+int<br>
+sx127X_read_version(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 v;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int status;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D regmap_raw_read(map, SX127X_REG_VERS=
ION, &amp;v, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((status =3D=3D 0) &amp;&amp; (v &gt; 0) &am=
p;&amp; (v &lt; 0xFF))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D v;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D -ENODEV;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_mode - Get LoRa device&#39;s mode register<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0LoRa device&#39;s register value<br>
+ */<br>
+u8<br>
+sx127X_get_mode(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 op_mode;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get original OP Mode register. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_OP_MODE, &amp;o=
p_mode, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return op_mode;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_state - Set LoRa device&#39;s operating state<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @st:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LoRa device=
&#39;s operating state going to be assigned<br>
+ */<br>
+void<br>
+sx127X_set_state(struct regmap *map, u8 st)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 op_mode;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get original OP Mode register. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0op_mode =3D sx127X_get_mode(map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set device to designated state. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0op_mode =3D (op_mode &amp; 0xF8) | (st &amp; 0x=
07);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_OP_MODE, &amp;=
op_mode, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_state - Get LoRa device&#39;s operating state<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0LoRa device&#39;s operating state<br>
+ */<br>
+u8<br>
+sx127X_get_state(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 op_mode;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0op_mode =3D sx127X_get_mode(map) &amp; 0x07;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return op_mode;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_lorafrq - Set RF frequency<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @fr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RF frequenc=
y going to be assigned in Hz<br>
+ */<br>
+void<br>
+sx127X_set_lorafrq(struct regmap *map, u32 fr)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 frt64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 frt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 buf[3];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 f_xosc;<br>
+<br>
+#ifdef CONFIG_OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the LoRa module&#39;s crystal oscillator=
&#39;s clock if OF is defined. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *of_node =3D (regmap_get_dev=
ice(map))-&gt;of_<wbr>node;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(of_node, &quot;clock-f=
requency&quot;, &amp;f_xosc))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_xosc =3D xosc_frq=
;<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0f_xosc =3D xosc_frq;<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frt64 =3D (uint64_t)fr * (uint64_t)__POW_2_19;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do_div(frt64, f_xosc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frt =3D frt64;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 2; i &gt;=3D 0; i--) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[i] =3D frt % 25=
6;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frt =3D frt &gt;&gt=
; 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_FRF_MSB, buf, =
3);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_lorafrq - Get RF frequency<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0RF frequency in Hz<br>
+ */<br>
+u32<br>
+sx127X_get_lorafrq(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 frt =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 buf[3];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int status;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 fr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 f_xosc;<br>
+<br>
+#ifdef CONFIG_OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the LoRa module&#39;s crystal oscillator=
&#39;s clock if OF is defined. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *of_node =3D (regmap_get_dev=
ice(map))-&gt;of_<wbr>node;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(of_node, &quot;clock-f=
requency&quot;, &amp;f_xosc))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_xosc =3D xosc_frq=
;<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0f_xosc =3D xosc_frq;<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D regmap_raw_read(map, SX127X_REG_FRF_=
MSB, buf, 3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0.0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt;=3D 2; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frt =3D frt * 256 +=
 buf[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fr =3D=C2=A0 frt * f_xosc / __POW_2_19;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return fr;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_lorapower - Set RF output power<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @pout:=C2=A0 =C2=A0 =C2=A0 RF output power going to be assigned in dbm<=
br>
+ */<br>
+void<br>
+sx127X_set_lorapower(struct regmap *map, s32 pout)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pacf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 boost;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 output_power;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 pmax;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pout &gt; 14) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pout &gt; 14dbm =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boost =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmax =3D 7;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output_power =3D po=
ut - 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (pout &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pout &lt; 0dbm *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boost =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmax =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output_power =3D 3 =
+ pout;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0dbm &lt;=3D Pou=
t &lt;=3D 14dbm */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boost =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmax =3D 7;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output_power =3D po=
ut;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pacf =3D (boost &lt;&lt; 7) | (pmax &lt;&lt; 4)=
 | (output_power);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_PA_CONFIG, &am=
p;pacf, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_lorapower - Get RF output power<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0RF output power in dbm<br>
+ */<br>
+s32<br>
+sx127X_get_lorapower(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pac;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 boost;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 output_power;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 pmax;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 pout;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_PA_CONFIG, &amp=
;pac, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0boost =3D (pac &amp; 0x80) &gt;&gt; 7;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0output_power =3D pac &amp; 0x0F;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (boost) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pout =3D 2 + output=
_power;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Power max should=
 be pmax/10.=C2=A0 It is 10 times for now. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmax =3D (108 + 6 *=
 ((pac &amp; 0x70) &gt;&gt; 4));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pout =3D (pmax - (1=
50 - output_power * 10)) / 10;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return pout;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_dbm2mbm - dbm to mbm unit conversion<br>
+ * @dbm:=C2=A0 =C2=A0 =C2=A0 =C2=A0the value in dbm<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0the value in mbm<br>
+ */<br>
+#define sx127X_dbm2mbm(dbm)=C2=A0 =C2=A0 (dbm * 100)<br>
+<br>
+/**<br>
+ * sx127X_mbm2dbm - mbm to dbm unit conversion<br>
+ * @mbm:=C2=A0 =C2=A0 =C2=A0 =C2=A0the value in mbm<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0the value in dbm<br>
+ */<br>
+#define sx127X_mbm2dbm(mbm)=C2=A0 =C2=A0 (mbm / 100)<br>
+<br>
+s8 lna_gain[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-12,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-24,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-26,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-48<br>
+};<br>
+<br>
+/**<br>
+ * sx127X_set_loralna - Set RF LNA gain<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @db:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RF LNA gain=
 going to be assigned in db<br>
+ */<br>
+void<br>
+sx127X_set_loralna(struct regmap *map, s32 db)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 i, g;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 lnacf;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 5; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lna_gain[i] &lt=
;=3D db)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g =3D i + 1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_LNA, &amp;lnacf=
, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lnacf =3D (lnacf &amp; 0x1F) | (g &lt;&lt; 5);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_LNA, &amp;lnac=
f, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_loralna - Get RF LNA gain<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0RF LNA gain db<br>
+ */<br>
+s32<br>
+sx127X_get_loralna(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 db;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s8 i, g;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 lnacf;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_LNA, &amp;lnacf=
, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g =3D (lnacf &gt;&gt; 5);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D g - 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db =3D lna_gain[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return db;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_loralnaagc - Set RF LNA go with auto gain control or manual<=
br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @yesno:=C2=A0 =C2=A0 =C2=A01 / 0 for auto gain control / manual<br>
+ */<br>
+void<br>
+sx127X_set_loralnaagc(struct regmap *map, s32 yesno)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf3;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG3, =
&amp;mcf3, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mcf3 =3D (yesno) ? (mcf3 | 0x04) : (mcf3 &amp; =
(~0x04));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_MODEM_CONFIG3,=
 &amp;mcf3, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_loraallflag - Get all of the LoRa device IRQ flags&#39; curr=
ent state<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0All of the LoRa device&#39;s IRQ flags&#39; =
current state in a byte<br>
+ */<br>
+u8<br>
+sx127X_get_loraallflag(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_IRQ_FLAGS, &amp=
;flags, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return flags;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_loraallflag - Get interested LoRa device IRQ flag&#39;s curr=
ent state<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @f:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the interested LoRa device&#39;s I=
RQ flag<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0The interested LoRa device&#39;s IRQ flag&#3=
9;s current state in a byte<br>
+ */<br>
+#define sx127X_get_loraflag(map, f)=C2=A0 =C2=A0 (sx127X_get_loraallflag(m=
ap) &amp; (f))<br>
+<br>
+/**<br>
+ * sx127X_clear_loraflag - Clear designated LoRa device&#39;s IRQ flag<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @f:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags going to be cleared<br>
+ */<br>
+void<br>
+sx127X_clear_loraflag(struct regmap *map, u8 f)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 flag;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get oiginal flag. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag =3D sx127X_get_loraallflag(map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the designated bits of the flag. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag |=3D f;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_IRQ_FLAGS, &am=
p;flag, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_clear_loraallflag - Clear designated LoRa device&#39;s all IRQ f=
lags<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ */<br>
+#define sx127X_clear_loraallflag(spi)=C2=A0 sx127X_clear_loraflag(spi, 0xF=
F)<br>
+<br>
+/**<br>
+ * sx127X_set_lorasprf - Set the RF modulation&#39;s spreading factor<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @c_s:=C2=A0 =C2=A0 =C2=A0 =C2=A0Spreading factor in chips / symbol<br>
+ */<br>
+void<br>
+sx127X_set_lorasprf(struct regmap *map, u32 c_s)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 sf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (sf =3D 6; sf &lt; 12; sf++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (c_s =3D=3D ((u3=
2)1 &lt;&lt; sf))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, =
&amp;mcf2, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mcf2 =3D (mcf2 &amp; 0x0F) | (sf &lt;&lt; 4);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_MODEM_CONFIG2,=
 &amp;mcf2, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_lorasprf - Get the RF modulation&#39;s spreading factor<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0Spreading factor in chips / symbol<br>
+ */<br>
+u32<br>
+sx127X_get_lorasprf(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 sf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 c_s;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, =
&amp;sf, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sf =3D sf &gt;&gt; 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0c_s =3D 1 &lt;&lt; sf;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return c_s;<br>
+}<br>
+<br>
+const u32 hz[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07800,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 10400,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 15600,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 20800,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 31250,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 41700,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 62500,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0125000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0250000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0500000<br>
+};<br>
+<br>
+/**<br>
+ * sx127X_set_lorabw - Set RF bandwidth<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @bw:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RF bandwidt=
h going to be assigned in Hz<br>
+ */<br>
+void<br>
+sx127X_set_lorabw(struct regmap *map, u32 bw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 9; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hz[i] &gt;=3D b=
w)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, =
&amp;mcf1, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mcf1 =3D (mcf1 &amp; 0x0F) | (i &lt;&lt; 4);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_MODEM_CONFIG1,=
 &amp;mcf1, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_lorabw - Get RF bandwidth<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0RF bandwidth in Hz<br>
+ */<br>
+u32<br>
+sx127X_get_lorabw(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 bw;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, =
&amp;mcf1, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bw =3D mcf1 &gt;&gt; 4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return hz[bw];<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_loracr=C2=A0 - Set LoRa package&#39;s coding rate<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @cr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Coding rate=
 going to be assigned in a byte<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0high 4 bits / low 4 bits=
: numerator / denominator<br>
+ */<br>
+void<br>
+sx127X_set_loracr(struct regmap *map, u8 cr)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, =
&amp;mcf1, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mcf1 =3D (mcf1 &amp; 0x0E) | (((cr &amp; 0xF) -=
 4) &lt;&lt; 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_MODEM_CONFIG1,=
 &amp;mcf1, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_loracr - Get LoRa package&#39;s coding rate<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0Coding rate in a byte<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0high 4 bits / low 4 bits=
: numerator / denominator<br>
+ */<br>
+u8<br>
+sx127X_get_loracr(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 cr;=C2=A0 /* ex: 0x45 represents cr=3D4/5 */=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, =
&amp;mcf1, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cr =3D 0x40 + ((mcf1 &amp; 0x0E) &gt;&gt; 1) + =
4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return cr;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_loraimplicit - Set LoRa packages with Explicit / Implicit He=
ader<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @yesno:=C2=A0 =C2=A0 =C2=A01 / 0 for Implicit Header Mode / Explicit He=
ader Mode<br>
+ */<br>
+void<br>
+sx127X_set_loraimplicit(<wbr>struct regmap *map, u8 yesno)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG1, =
&amp;mcf1, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mcf1 =3D (yesno) ? (mcf1 | 0x01) : (mcf1 &amp; =
0xFE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_MODEM_CONFIG1,=
 &amp;mcf1, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_lorarxbytetimeout - Set RX operation time-out in terms of sy=
mbols<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @n:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Time-out in terms of symbols (byte=
s) going to be assigned<br>
+ */<br>
+void<br>
+sx127X_set_lorarxbytetimeout(<wbr>struct regmap *map, u32 n)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 buf[2];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n &lt; 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n &gt; 1023)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D 1023;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read original Modem config 2. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, =
&amp;mcf2, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* LSB */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf[1] =3D n % 256;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* MSB */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf[0] =3D (mcf2 &amp; 0xFC) | (n &gt;&gt; 8);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_MODEM_CONFIG2,=
 buf, 2);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_lorarxtimeout - Set RX operation time-out seconds<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @ms:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The RX time=
-out time in ms<br>
+ */<br>
+void<br>
+sx127X_set_lorarxtimeout(<wbr>struct regmap *map, u32 ms)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 n;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D ms * sx127X_get_lorabw(map) / (sx127X_get=
_lorasprf(map) * 1000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_lorarxbytetimeout(<wbr>map, n);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_lorarxbytetimeout - Get RX operation time-out in terms of sy=
mbols<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0Time-out in terms of symbols (bytes)<br>
+ */<br>
+u32<br>
+sx127X_get_lorarxbytetimeout(<wbr>struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 buf[2];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, =
buf, 2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D (buf[0] &amp; 0x03) * 256 + buf[1];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return n;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_lorarxtimeout - Get RX operation time-out seconds<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0The RX time-out time in ms<br>
+ */<br>
+u32<br>
+sx127X_get_lorarxtimeout(<wbr>struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ms;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ms =3D 1000 * sx127X_get_lorarxbytetimeout(<wbr=
>map) *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_get_lorasprf=
(map) / sx127X_get_lorabw(map);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ms;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_loramaxrxbuff - Maximum payload length in LoRa packet<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @len:=C2=A0 =C2=A0 =C2=A0 =C2=A0the max payload length going to be assi=
gned in bytes<br>
+ */<br>
+void<br>
+sx127X_set_loramaxrxbuff(<wbr>struct regmap *map, u8 len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_MAX_PAYLOAD_LE=
NGTH, &amp;len, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_<wbr>loralastpktpayloadlen - Get the RX last packet payload =
length<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0the actual RX last packet payload length in =
bytes<br>
+ */<br>
+u8<br>
+sx127X_get_<wbr>loralastpktpayloadlen(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 len;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_RX_NB_BYTES, &a=
mp;len, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_readloradata - Read data from LoRa device (read RX FIFO)<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @buf:=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer going to be read data into<br>
+ * @len:=C2=A0 =C2=A0 =C2=A0 =C2=A0the length of the data going to be read=
 in bytes<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0Positive / negtive values for the actual dat=
a length read from<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the LoRa device in bytes=
 / failed<br>
+ */<br>
+ssize_t<br>
+sx127X_readloradata(struct regmap *map, u8 *buf, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 start_adr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set chip FIFO pointer to FIFO last packet ad=
dress. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start_adr =3D SX127X_FIFO_RX_BASE_ADDRESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_FIFO_ADDR_PTR,=
 &amp;start_adr, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read LoRa packet payload. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D (len &lt;=3D IEEE802154_MTU) ? len : IE=
EE802154_MTU;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_raw_read(map, SX127X_REG_FIFO, b=
uf, len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (ret &gt;=3D 0) ? len : ret;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_sendloradata - Send data through LoRa device (write TX FIFO)<br>
+ * @rm:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the device =
as a regmap to communicate with<br>
+ * @buf:=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer going to be send<br>
+ * @len:=C2=A0 =C2=A0 =C2=A0 =C2=A0the length of the buffer in bytes<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0the actual length written into the LoRa devi=
ce in bytes<br>
+ */<br>
+size_t<br>
+sx127X_sendloradata(struct regmap *map, u8 *buf, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 base_adr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 blen;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set chip FIFO pointer to FIFO TX base. */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0base_adr =3D SX127X_FIFO_TX_BASE_ADDRESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_FIFO_ADDR_PTR,=
 &amp;base_adr, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Write payload synchronously to fill the FIFO=
 of the chip. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0blen =3D (len &lt;=3D IEEE802154_MTU) ? len : I=
EEE802154_MTU;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_FIFO, buf, ble=
n);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the FIFO payload length. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_PAYLOAD_LENGTH=
, &amp;blen, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return blen;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_loralastpktsnr - Get last LoRa packet&#39;s SNR<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0the last LoRa packet&#39;s SNR in db<br>
+ */<br>
+s32<br>
+sx127X_get_loralastpktsnr(<wbr>struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 db;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s8 snr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_PKT_SNR_VALUE, =
&amp;snr, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0db =3D snr / 4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return db;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_loralastpktrssi - Get last LoRa packet&#39;s SNR<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0the last LoRa packet&#39;s RSSI in dbm<br>
+ */<br>
+s32<br>
+sx127X_get_loralastpktrssi(<wbr>struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 dbm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 lhf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 rssi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s8 snr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get LoRa is in high or low frequency mode. *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lhf =3D sx127X_get_mode(map) &amp; 0x08;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get RSSI value. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_PKT_RSSI_VALUE,=
 &amp;rssi, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dbm =3D (lhf) ? -164 + rssi : -157 + rssi;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Adjust to correct the last packet RSSI if SN=
R &lt; 0. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_PKT_SNR_VALUE, =
&amp;snr, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (snr &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dbm +=3D snr / 4;<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return dbm;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_lorarssi - Get current RSSI value<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0the current RSSI in dbm<br>
+ */<br>
+s32<br>
+sx127X_get_lorarssi(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 dbm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 lhf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 rssi;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get LoRa is in high or low frequency mode. *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lhf =3D sx127X_get_mode(map) &amp; 0x08;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get RSSI value. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_RSSI_VALUE, &am=
p;rssi, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dbm =3D (lhf) ? -164 + rssi : -157 + rssi;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return dbm;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_lorapreamblelen - Set LoRa preamble length<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @len:=C2=A0 =C2=A0 =C2=A0 =C2=A0the preamble length going to be assigne=
d<br>
+ */<br>
+void<br>
+sx127X_set_lorapreamblelen(<wbr>struct regmap *map, u32 len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pl[2];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pl[1] =3D len % 256;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pl[0] =3D (len &gt;&gt; 8) % 256;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_PREAMBLE_MSB, =
pl, 2);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_get_lorapreamblelen - Get LoRa preamble length<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0length of the LoRa preamble<br>
+ */<br>
+u32<br>
+sx127X_get_lorapreamblelen(<wbr>struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pl[2];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 len;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_PREAMBLE_MSB, p=
l, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D pl[0] * 256 + pl[1];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_loracrc - Enable CRC generation and check on received payloa=
d<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @yesno:=C2=A0 =C2=A0 =C2=A01 / 0 for check / not check<br>
+ */<br>
+void<br>
+sx127X_set_loracrc(struct regmap *map, u8 yesno)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mcf2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_MODEM_CONFIG2, =
&amp;mcf2, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mcf2 =3D (yesno) ? mcf2 | (1 &lt;&lt; 2) : mcf2=
 &amp; (~(1 &lt;&lt; 2));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_MODEM_CONFIG2,=
 &amp;mcf2, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_set_boost - Set RF power amplifier boost in normal output range<=
br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ * @yesno:=C2=A0 =C2=A0 =C2=A01 / 0 for boost / not boost<br>
+ */<br>
+void<br>
+sx127X_set_boost(struct regmap *map, u8 yesno)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pacf;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_read(map, SX127X_REG_PA_CONFIG, &amp=
;pacf, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pacf =3D (yesno) ? pacf | (1 &lt;&lt; 7) : pacf=
 &amp; (~(1 &lt;&lt; 7));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_PA_CONFIG, &am=
p;pacf, 1);<br>
+}<br>
+<br>
+/**<br>
+ * sx127X_start_loramode - Start the device and set it in LoRa mode<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ */<br>
+void<br>
+sx127X_start_loramode(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 op_mode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 base_adr;<br>
+#ifdef CONFIG_OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *of_node =3D (regmap_get_dev=
ice(map))-&gt;of_<wbr>node;<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get original OP Mode register. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0op_mode =3D sx127X_get_mode(map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(map)<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;the original =
OP mode is 0x%X\n&quot;, op_mode);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set device to sleep state. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_state(map, SX127X_SLEEP_MODE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set device to LoRa mode. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0op_mode =3D sx127X_get_mode(map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0op_mode =3D op_mode | 0x80;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_OP_MODE, &amp;=
op_mode, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set device to standby state. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_state(map, SX127X_STANDBY_MODE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0op_mode =3D sx127X_get_mode(map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(map)<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;the current O=
P mode is 0x%X\n&quot;, op_mode);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set LoRa in explicit header mode. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_loraimplicit(map, 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set chip FIFO RX base. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0base_adr =3D SX127X_FIFO_RX_BASE_ADDRESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_FIFO_RX_BASE_A=
DDR, &amp;base_adr, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set chip FIFO TX base. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0base_adr =3D SX127X_FIFO_TX_BASE_ADDRESS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_raw_write(map, SX127X_REG_FIFO_TX_BASE_A=
DDR, &amp;base_adr, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the CSS spreading factor. */<br>
+#ifdef CONFIG_OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u32(of_node, &quot;spreading-f=
actor&quot;, &amp;sprf);<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_lorasprf(map, sprf);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set RX time-out value. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_lorarxbytetimeout(<wbr>map, rx_timeo=
ut);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear all of the IRQ flags. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_clear_loraallflag(map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set chip to RX state waiting for receiving. =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_state(map, SX127X_RXSINGLE_MODE);<br=
>
+}<br>
+<br>
+/**<br>
+ * init_sx127x - Initial the SX127X device<br>
+ * @map:=C2=A0 =C2=A0 =C2=A0 =C2=A0the device as a regmap to communicate w=
ith<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A00 / negtive values for success / failed<br>
+ */<br>
+int<br>
+init_sx127x(struct regmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
+#ifdef DEBUG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 fv, mv;<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(map)<wbr>, &quot;init=
 sx127X\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0v =3D sx127X_read_version(map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (v &gt; 0) {<br>
+#ifdef DEBUG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fv =3D (v &gt;&gt; =
4) &amp; 0xF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv =3D v &amp; 0xF;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_=
device(map)<wbr>, &quot;chip version %d.%d\n&quot;, fv, mv);<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+/*---------------------- SX1278 IEEE 802.15.4 Functions ------------------=
----*/<br>
+<br>
+/* LoRa device&#39;s sensitivity in dbm. */<br>
+#ifndef SX1278_IEEE_SENSITIVITY<br>
+#define SX1278_IEEE_SENSITIVITY=C2=A0 =C2=A0 =C2=A0 =C2=A0 (-148)<br>
+#endif<br>
+static s32 sensitivity =3D SX1278_IEEE_SENSITIVITY;<br>
+module_param(sensitivity, int, 0000);<br>
+MODULE_PARM_DESC(sensitivity, &quot;RF receiver&#39;s sensitivity&quot;);<=
br>
+<br>
+#define SX1278_IEEE_ENERGY_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0(-sensitivity)<=
br>
+<br>
+static int<br>
+sx1278_ieee_ed(struct ieee802154_hw *hw, u8 *level)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 rssi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 range =3D SX1278_IEEE_ENERGY_RANGE - 10;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map), &q=
uot;%s\n&quot;, __func__);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ED: IEEE=C2=A0 802.15.4-2011 8.2.5 Recevier =
ED. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rssi =3D sx127X_get_lorarssi(phy-&gt;map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rssi &lt; (sensitivity + 10))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*level =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (rssi &gt;=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*level =3D 255;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*level =3D ((s32)25=
5 * (rssi + range) / range) % 255;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+#ifndef SX1278_IEEE_CHANNEL_MIN<br>
+#define SX1278_IEEE_CHANNEL_MIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 11<br>
+#endif<br>
+static u8 channel_min =3D SX1278_IEEE_CHANNEL_MIN;<br>
+module_param(channel_min, byte, 0000);<br>
+MODULE_PARM_DESC(channel_min, &quot;Minimal channel number&quot;);<br>
+<br>
+#ifndef SX1278_IEEE_CHANNEL_MAX<br>
+#define SX1278_IEEE_CHANNEL_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 11<br>
+#endif<br>
+static u8 channel_max =3D SX1278_IEEE_CHANNEL_MAX;<br>
+module_param(channel_max, byte, 0000);<br>
+MODULE_PARM_DESC(channel_max, &quot;Maximum channel number&quot;);<br>
+<br>
+#ifndef SX1278_IEEE_CENTER_CARRIER_FRQ<br>
+#define SX1278_IEEE_CENTER_CARRIER_FRQ 434000000<br>
+#endif<br>
+static u32 carrier_frq =3D SX1278_IEEE_CENTER_CARRIER_<wbr>FRQ;<br>
+module_param(carrier_frq, uint, 0000);<br>
+MODULE_PARM_DESC(carrier_frq, &quot;Center carrier frequency in Hz&quot;);=
<br>
+<br>
+#ifndef SX1278_IEEE_BANDWIDTH<br>
+#define SX1278_IEEE_BANDWIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 500000<br>
+#endif<br>
+static u32 bandwidth =3D SX1278_IEEE_BANDWIDTH;<br>
+module_param(bandwidth, uint, 0000);<br>
+MODULE_PARM_DESC(bandwidth, &quot;Bandwidth in Hz&quot;);<br>
+<br>
+struct rf_frq {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 carrier;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 bw;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 ch_min;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 ch_max;<br>
+};<br>
+<br>
+void<br>
+sx1278_ieee_get_rf_config(<wbr>struct ieee802154_hw *hw, struct rf_frq *rf=
)<br>
+{<br>
+#ifdef CONFIG_OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *of_node =3D (regmap_get_dev=
ice(phy-&gt;map))-<wbr>&gt;of_node;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the LoRa chip&#39;s center carrier frequ=
ency. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(of_node, &quot;center-=
carrier-frq&quot;, &amp;rf-&gt;carrier))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rf-&gt;carrier =3D =
carrier_frq;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the LoRa chip&#39;s RF bandwidth. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(of_node, &quot;rf-band=
width&quot;, &amp;rf-&gt;carrier))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rf-&gt;bw =3D bandw=
idth;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the LoRa chip&#39;s min &amp; max RF cha=
nnel if OF is defined. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_u8(of_node, &quot;minimal-=
RF-channel&quot;, &amp;rf-&gt;ch_min))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rf-&gt;ch_min =3D c=
hannel_min;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_u8(of_node, &quot;maximum-=
RF-channel&quot;, &amp;rf-&gt;ch_max))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rf-&gt;ch_max =3D c=
hannel_max;<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rf-&gt;carrier =3D carrier_frq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rf-&gt;bw =3D bandwidth;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rf-&gt;ch_min =3D channel_min;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rf-&gt;ch_max =3D channel_max;<br>
+#endif<br>
+}<br>
+<br>
+static int<br>
+sx1278_ieee_set_channel(<wbr>struct ieee802154_hw *hw, u8 page, u8 channel=
)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rf_frq rf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 fr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s8 d;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s channel: %=
u&quot;, __func__, channel);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278_ieee_get_rf_config(hw, &amp;rf);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (channel &lt; rf.ch_min)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D rf.ch_m=
in;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (channel &gt; rf.ch_max)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D rf.ch_m=
ax;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d =3D channel - (rf.ch_min + rf.ch_max) / 2;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fr =3D rf.carrier + d * <a href=3D"http://rf.bw=
" rel=3D"noreferrer" target=3D"_blank">rf.bw</a>;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_lorafrq(phy-&gt;map, fr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+/* in mbm */<br>
+s32 sx1278_powers[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-200, -100, 0, 100, 200, 300, 400, 500, 600, 70=
0, 800, 900, 1000, 1100,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A01200, 1300, 1400, 1500, 1600, 1700, 1800, 1900,=
 2000, 2100, 2200, 2300};<br>
+<br>
+static int<br>
+sx1278_ieee_set_txpower(<wbr>struct ieee802154_hw *hw, s32 mbm)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 dbm =3D sx127X_mbm2dbm(mbm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s TX power: =
%d mbm&quot;, __func__, mbm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_lorapower(phy-&gt;map, dbm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+int<br>
+sx1278_ieee_rx(struct ieee802154_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool do_rx;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map), &q=
uot;%s\n&quot;, __func__);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;phy-&gt;buf_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!phy-&gt;is_busy) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;is_busy =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_rx =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_rx =3D false;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;phy-&gt;buf_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (do_rx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_state(ph=
y-&gt;map, SX127X_RXSINGLE_MODE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static int<br>
+sx1278_ieee_rx_complete(<wbr>struct ieee802154_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sk_buff *skb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 lqi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 rssi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 range =3D SX1278_IEEE_ENERGY_RANGE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0skb =3D dev_alloc_skb(IEEE802154_MTU);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!skb) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ENOMEM;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto sx1278_ieee_rx=
_err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D sx127X_get_<wbr>loralastpktpayloadlen(p=
hy-&gt;<wbr>map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_readloradata(phy-&gt;map, skb_put(skb, l=
en), len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* LQI: IEEE=C2=A0 802.15.4-2011 8.2.6 Link qua=
lity indicator. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rssi =3D sx127X_get_loralastpktrssi(<wbr>phy-&g=
t;map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rssi =3D (rssi &gt; 0) ? 0 : rssi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lqi =3D ((s32)255 * (rssi + range) / range) % 2=
55;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ieee802154_rx_irqsafe(hw, skb, lqi);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;phy-&gt;buf_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;is_busy =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;phy-&gt;buf_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s: len=3D%u =
LQI=3D%u\n&quot;, __func__, len, lqi);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+sx1278_ieee_rx_err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+}<br>
+<br>
+int<br>
+sx1278_ieee_tx(struct ieee802154_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sk_buff *tx_buf =3D phy-&gt;tx_buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool do_tx =3D false;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s: len=3D%u\=
n&quot;, __func__, tx_buf-&gt;len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!phy-&gt;post_tx_done) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_sendloradata=
(phy-&gt;map, tx_buf-&gt;data, tx_buf-&gt;len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;post_tx_don=
e =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;phy-&gt;buf_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!phy-&gt;is_busy) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;is_busy =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_tx =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;one_to_be_s=
ent =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;phy-&gt;buf_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (do_tx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set chip as TX s=
tate and transfer the data in FIFO. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;opmode =3D =
(phy-&gt;opmode &amp; 0xF8) | SX127X_TX_MODE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write_async(=
phy-&gt;map, SX127X_REG_OP_MODE, phy-&gt;opmode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static int<br>
+sx1278_ieee_tx_complete(<wbr>struct ieee802154_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sk_buff *skb =3D phy-&gt;tx_buf;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map), &q=
uot;%s\n&quot;, __func__);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ieee802154_xmit_complete(hw, skb, false);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;phy-&gt;buf_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;is_busy =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;tx_buf =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;phy-&gt;buf_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int<br>
+sx1278_ieee_xmit(struct ieee802154_hw *hw, struct sk_buff *skb)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map), &q=
uot;%s\n&quot;, __func__);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON(phy-&gt;suspended);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;phy-&gt;buf_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (phy-&gt;tx_buf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EBUSY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;tx_buf =3D =
skb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;one_to_be_s=
ent =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;post_tx_don=
e =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;phy-&gt;buf_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static int<br>
+sx1278_ieee_start(struct ieee802154_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map), &q=
uot;interface up\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;suspended =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_start_loramode(phy-&gt;<wbr>map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;opmode =3D sx127X_get_mode(phy-&gt;map)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0add_timer(&amp;phy-&gt;timer);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static void<br>
+sx1278_ieee_stop(struct ieee802154_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(regmap_get_device(phy-<wbr>&gt;map), &q=
uot;interface down\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;suspended =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0del_timer(&amp;phy-&gt;timer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_set_state(phy-&gt;map, SX127X_SLEEP_MODE=
);<br>
+}<br>
+<br>
+static int<br>
+sx1278_ieee_set_promiscuous_<wbr>mode(struct ieee802154_hw *hw, const bool=
 on)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+void<br>
+sx1278_ieee_statemachine(<wbr>struct ieee802154_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 state;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool do_next_rx =3D false;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D sx127X_get_loraallflag(phy-&gt;<wbr>m=
ap);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D sx127X_get_state(phy-&gt;map);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; (SX127X_FLAG_RXTIMEOUT | SX127X=
_FLAG_PAYLOADCRCERROR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_clear_lorafl=
ag(phy-&gt;<wbr>map, SX127X_FLAG_RXTIMEOUT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| SX127X_FLAG_PAYLOADCRCERROR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| SX127X_FLAG_RXDONE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;phy-=
&gt;buf_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;is_busy =3D=
 false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;ph=
y-&gt;buf_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_next_rx =3D true=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (flags &amp; SX127X_FLAG_RXDONE) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278_ieee_rx_comp=
lete(phy-&gt;<wbr>hw);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_clear_lorafl=
ag(phy-&gt;<wbr>map, SX127X_FLAG_RXDONE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_next_rx =3D true=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; SX127X_FLAG_TXDONE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278_ieee_tx_comp=
lete(phy-&gt;<wbr>hw);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx127X_clear_lorafl=
ag(phy-&gt;<wbr>map, SX127X_FLAG_TXDONE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;tx_delay =
=3D 10;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_next_rx =3D true=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (phy-&gt;one_to_be_sent &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(state =3D=3D SX127X_STANDBY_MODE=
) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(phy-&gt;tx_delay =3D=3D 0)) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sx1278_ieee_tx=
(phy-&gt;hw))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0do_next_rx =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (do_next_rx)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278_ieee_rx(phy-=
&gt;hw);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (phy-&gt;tx_delay &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;tx_delay -=
=3D 1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!phy-&gt;suspended) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;timer.expir=
es =3D jiffies_64 + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_timer(&amp;phy-=
&gt;timer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+/**<br>
+ * sx1278_timer_irqwork - The actual work which checks the IRQ flags of th=
e chip<br>
+ * @work:=C2=A0 =C2=A0 =C2=A0 the work entry listed in the workqueue<br>
+ */<br>
+static void<br>
+sx1278_timer_irqwork(struct work_struct *work)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy =3D container_of(work, struct sx1278_phy, i=
rqwork);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278_ieee_statemachine(phy-&gt;<wbr>hw);<br>
+}<br>
+<br>
+/**<br>
+ * sx1278_timer_isr - Callback function for the timer interrupt<br>
+ * @arg:=C2=A0 =C2=A0 =C2=A0 =C2=A0the general argument for this callback =
function<br>
+ */<br>
+static void<br>
+sx1278_timer_isr(unsigned long arg)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D (struct sx1278_phy *=
)arg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0schedule_work(&amp;phy-&gt;irqwork);<br>
+}<br>
+<br>
+static const struct ieee802154_ops sx1278_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MODULE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.xmit_async =3D sx1278_ieee_xmit,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.ed =3D sx1278_ieee_ed,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_channel =3D sx1278_ieee_set_channel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_txpower =3D sx1278_ieee_set_txpower,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.start =3D sx1278_ieee_start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.stop =3D sx1278_ieee_stop,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_promiscuous_mode =3D sx1278_ieee_set_promi=
scuous_<wbr>mode,<br>
+};<br>
+<br>
+/**<br>
+ * sx1278X_ieee_channel_mask - Get the available channels&#39; mask of LoR=
a device<br>
+ * @hw:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LoRa IEEE 8=
02.15.4 device<br>
+ *<br>
+ * Return:=C2=A0 =C2=A0 =C2=A0The bitwise channel mask in 4 bytes<br>
+ */<br>
+u32<br>
+sx1278_ieee_channel_mask(<wbr>struct ieee802154_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rf_frq rf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278_ieee_get_rf_config(hw, &amp;rf);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D ((u32)(1 &lt;&lt; (rf.ch_max + 1)) - (=
u32)(1 &lt;&lt; rf.ch_min));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return mask;<br>
+}<br>
+<br>
+static int<br>
+sx1278_ieee_add_one(struct sx1278_phy *phy)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ieee802154_hw *hw =3D phy-&gt;hw;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Define channels could be used. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw-&gt;phy-&gt;supported.channels[0] =3D sx1278=
_ieee_channel_mask(hw);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* SX1278 phy channel 11 as default */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw-&gt;phy-&gt;current_channel =3D 11;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Define RF power. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw-&gt;phy-&gt;supported.tx_powers =3D sx1278_p=
owers;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw-&gt;phy-&gt;supported.tx_powers_<wbr>size =
=3D ARRAY_SIZE(sx1278_powers);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw-&gt;phy-&gt;transmit_power =3D sx1278_powers=
[12];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ieee802154_random_extended_<wbr>addr(&amp;hw-&g=
t;phy-&gt;perm_extended_<wbr>addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw-&gt;flags =3D IEEE802154_HW_TX_OMIT_CKSUM<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| IEEE802154_HW_RX_OMIT_CKSUM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| IEEE802154_HW_PROMISCUOUS;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D ieee802154_register_hw(hw);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_WORK(&amp;phy-&gt;irqwork, sx1278_timer_ir=
qwork);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init_timer(&amp;phy-&gt;timer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;timer.expires =3D jiffies_64 + HZ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;timer.function =3D sx1278_timer_isr;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;timer.data =3D (unsigned long)phy;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;phy-&gt;buf_lock)<wbr>;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D init_sx127x(phy-&gt;map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+err_reg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(regmap_get_device(phy-<wbr>&gt;map),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;register as I=
EEE 802.15.4 device failed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+}<br>
+<br>
+static void<br>
+sx1278_ieee_del(struct sx1278_phy *phy)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!phy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0del_timer(&amp;phy-&gt;timer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flush_work(&amp;phy-&gt;irqwork);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ieee802154_unregister_hw(phy-&gt;<wbr>hw);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ieee802154_free_hw(phy-&gt;hw);<br>
+}<br>
+<br>
+/*--------------------------- SX1278 SPI Functions -----------------------=
----*/<br>
+<br>
+/* The compatible chip array. */<br>
+#ifdef CONFIG_OF<br>
+static const struct of_device_id sx1278_dt_ids[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;semtech,sx1276&quot; },=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;semtech,sx1277&quot; },=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;semtech,sx1278&quot; },=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;semtech,sx1279&quot; },=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sx1278&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br>
+};<br>
+MODULE_DEVICE_TABLE(of, sx1278_dt_ids);<br>
+#endif<br>
+<br>
+/* The compatible ACPI device array. */<br>
+#ifdef CONFIG_ACPI<br>
+static const struct acpi_device_id sx1278_acpi_ids[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .id =3D &quot;sx1278&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br>
+};<br>
+MODULE_DEVICE_TABLE(acpi, sx1278_acpi_ids);<br>
+#endif<br>
+<br>
+/* The compatible SPI device id array. */<br>
+static const struct spi_device_id sx1278_spi_ids[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;sx1278&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br>
+};<br>
+MODULE_DEVICE_TABLE(spi, sx1278_spi_ids);<br>
+<br>
+bool sx1278_reg_volatile(struct device *dev, unsigned int reg)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
+}<br>
+<br>
+/* The SX1278 regmap config. */<br>
+struct regmap_config sx1278_regmap_config =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_bits =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.val_bits =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_register =3D SX127X_MAX_REG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.read_flag_mask =3D 0x00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.write_flag_mask =3D 0x80,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.volatile_reg =3D sx1278_reg_volatile,<br>
+};<br>
+<br>
+/* The SPI probe callback function. */<br>
+static int sx1278_spi_probe(struct spi_device *spi)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ieee802154_hw *hw;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D ieee802154_alloc_hw(sizeof(*<wbr>phy), &=
amp;sx1278_ops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hw) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;spi-&g=
t;dev, &quot;not enough memory\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy =3D hw-&gt;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;hw =3D hw;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw-&gt;parent =3D &amp;spi-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-&gt;map =3D devm_regmap_init_spi(spi, &amp;=
sx1278_regmap_config);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the SPI device&#39;s driver data for lat=
er usage. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spi_set_drvdata(spi, phy);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D sx1278_ieee_add_one(phy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;spi-&g=
t;dev, &quot;no SX1278 compatible device\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto sx1278_spi_pro=
be_err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&amp;spi-&gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;add an IEEE =
802.15.4 over LoRa SX1278 compatible device\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+sx1278_spi_probe_err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278_ieee_del(phy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+}<br>
+<br>
+/* The SPI remove callback function. */<br>
+static int sx1278_spi_remove(struct spi_device *spi)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sx1278_phy *phy =3D spi_get_drvdata(spi)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sx1278_ieee_del(phy);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+#define __DRIVER_NAME=C2=A0 &quot;sx1278&quot;<br>
+<br>
+/* The SPI driver which acts as a protocol driver in this kernel module. *=
/<br>
+static struct spi_driver sx1278_spi_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D __DRIVER_=
NAME,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MOD=
ULE,<br>
+#ifdef CONFIG_OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 of_match_ptr(sx1278_dt_ids),<br>
+#endif<br>
+#ifdef CONFIG_ACPI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.acpi_match_table =
=3D ACPI_PTR(sx1278_acpi_ids),<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D sx1278_spi_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D sx1278_spi_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.id_table =3D sx1278_spi_ids,<br>
+};<br>
+<br>
+/* Register SX1278 kernel module. */<br>
+module_spi_driver(sx1278_spi_<wbr>driver);<br>
+<br>
+MODULE_AUTHOR(&quot;Jian-Hong Pan, &lt;<a href=3D"mailto:starnight@g.ncu.e=
du.tw">starnight@g.ncu.edu.tw</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;LoRa device SX1278 driver with IEEE 802.15.4 inte=
rface&quot;);<br>
+MODULE_LICENSE(&quot;Dual BSD/GPL&quot;);<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-wpan&q=
uot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/<wbr>m=
ajordomo-info.html</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><p styl=
e=3D"margin:0pt"><span style=3D"font-size:xx-small"></span></p><div><span s=
tyle=3D"font-size:13.3px;font-family:Verdana,Arial,Helvetica,sans-serif"><i=
mg src=3D"http://s.wisestamp.com/pixel.png?p=3Dmozilla&amp;v=3D2.0.3&amp;t=
=3D1285465679377&amp;u=3D537953&amp;e=3D630" height=3D"1" width=3D"1"></spa=
n></div></div>
</div>

--001a1143971e89eb060558e52783--

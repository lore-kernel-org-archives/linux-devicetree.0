From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: bcm283x: Add missing GPIO line names
Date: Mon, 21 Jan 2019 04:52:26 +0000
Message-ID: <CALeDE9OPnjGrg0QmLsVuOwQk-jzkggz=zaLTnrQGaJof_6Z8NA@mail.gmail.com>
References: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
 <1547297008-2740-7-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547297008-2740-7-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Gottfried Haider <gottfried.haider@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2019 at 12:44 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> The GPIO sysfs is deprecated and disabled in the defconfig files.
> So in order to motivate the usage of the new GPIO character device API
> add the missing GPIO line names for Raspberry Pi 2 and 3. In the lack
> of full schematics i would leave all undocumented pins as unnamed.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com>

Tested on RPi2/3/3B+ using lsgpio

> ---
>  arch/arm/boot/dts/bcm2836-rpi-2-b.dts      | 66 ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 70 ++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts      | 70 ++++++++++++++++++++++++++++++
>  3 files changed, 206 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
> index 871fc4a..7b4e651 100644
> --- a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
> +++ b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
> @@ -28,6 +28,72 @@
>  };
>
>  &gpio {
> +       /*
> +        * Taken from rpi_SCH_2b_1p2_reduced.pdf and
> +        * the official GPU firmware DT blob.
> +        *
> +        * Legend:
> +        * "NC" = not connected (no rail from the SoC)
> +        * "FOO" = GPIO line named "FOO" on the schematic
> +        * "FOO_N" = GPIO line named "FOO" on schematic, active low
> +        */
> +       gpio-line-names = "ID_SDA",
> +                         "ID_SCL",
> +                         "SDA1",
> +                         "SCL1",
> +                         "GPIO_GCLK",
> +                         "GPIO5",
> +                         "GPIO6",
> +                         "SPI_CE1_N",
> +                         "SPI_CE0_N",
> +                         "SPI_MISO",
> +                         "SPI_MOSI",
> +                         "SPI_SCLK",
> +                         "GPIO12",
> +                         "GPIO13",
> +                         /* Serial port */
> +                         "TXD0",
> +                         "RXD0",
> +                         "GPIO16",
> +                         "GPIO17",
> +                         "GPIO18",
> +                         "GPIO19",
> +                         "GPIO20",
> +                         "GPIO21",
> +                         "GPIO22",
> +                         "GPIO23",
> +                         "GPIO24",
> +                         "GPIO25",
> +                         "GPIO26",
> +                         "GPIO27",
> +                         "SDA0",
> +                         "SCL0",
> +                         "", /* GPIO30 */
> +                         "LAN_RUN",
> +                         "CAM_GPIO1",
> +                         "", /* GPIO33 */
> +                         "", /* GPIO34 */
> +                         "PWR_LOW_N",
> +                         "", /* GPIO36 */
> +                         "", /* GPIO37 */
> +                         "USB_LIMIT",
> +                         "", /* GPIO39 */
> +                         "PWM0_OUT",
> +                         "CAM_GPIO0",
> +                         "SMPS_SCL",
> +                         "SMPS_SDA",
> +                         "ETHCLK",
> +                         "PWM1_OUT",
> +                         "HDMI_HPD_N",
> +                         "STATUS_LED",
> +                         /* Used by SD Card */
> +                         "SD_CLK_R",
> +                         "SD_CMD_R",
> +                         "SD_DATA0_R",
> +                         "SD_DATA1_R",
> +                         "SD_DATA2_R",
> +                         "SD_DATA3_R";
> +
>         pinctrl-0 = <&gpioout &alt0 &i2s_alt0>;
>
>         /* I2S interface */
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> index d3ec6cd..c6fa34c 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> @@ -52,6 +52,76 @@
>         };
>  };
>
> +&gpio {
> +       /*
> +        * Taken from rpi_SCH_3bplus_1p0_reduced.pdf and
> +        * the official GPU firmware DT blob.
> +        *
> +        * Legend:
> +        * "NC" = not connected (no rail from the SoC)
> +        * "FOO" = GPIO line named "FOO" on the schematic
> +        * "FOO_N" = GPIO line named "FOO" on schematic, active low
> +        */
> +       gpio-line-names = "ID_SDA",
> +                         "ID_SCL",
> +                         "SDA1",
> +                         "SCL1",
> +                         "GPIO_GCLK",
> +                         "GPIO5",
> +                         "GPIO6",
> +                         "SPI_CE1_N",
> +                         "SPI_CE0_N",
> +                         "SPI_MISO",
> +                         "SPI_MOSI",
> +                         "SPI_SCLK",
> +                         "GPIO12",
> +                         "GPIO13",
> +                         /* Serial port */
> +                         "TXD1",
> +                         "RXD1",
> +                         "GPIO16",
> +                         "GPIO17",
> +                         "GPIO18",
> +                         "GPIO19",
> +                         "GPIO20",
> +                         "GPIO21",
> +                         "GPIO22",
> +                         "GPIO23",
> +                         "GPIO24",
> +                         "GPIO25",
> +                         "GPIO26",
> +                         "GPIO27",
> +                         "HDMI_HPD_N",
> +                         "STATUS_LED_G",
> +                         /* Used by BT module */
> +                         "CTS0",
> +                         "RTS0",
> +                         "TXD0",
> +                         "RXD0",
> +                         /* Used by Wifi */
> +                         "SD1_CLK",
> +                         "SD1_CMD",
> +                         "SD1_DATA0",
> +                         "SD1_DATA1",
> +                         "SD1_DATA2",
> +                         "SD1_DATA3",
> +                         "PWM0_OUT",
> +                         "PWM1_OUT",
> +                         "ETHCLK",
> +                         "WIFI_CLK",
> +                         "SDA0",
> +                         "SCL0",
> +                         "SMPS_SCL",
> +                         "SMPS_SDA",
> +                         /* Used by SD Card */
> +                         "SD_CLK_R",
> +                         "SD_CMD_R",
> +                         "SD_DATA0_R",
> +                         "SD_DATA1_R",
> +                         "SD_DATA2_R",
> +                         "SD_DATA3_R";
> +};
> +
>  &hdmi {
>         hpd-gpios = <&gpio 28 GPIO_ACTIVE_LOW>;
>  };
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> index 31b1c03..ce71f57 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -47,6 +47,76 @@
>         };
>  };
>
> +&gpio {
> +       /*
> +        * Taken from rpi_SCH_3b_1p2_reduced.pdf and
> +        * the official GPU firmware DT blob.
> +        *
> +        * Legend:
> +        * "NC" = not connected (no rail from the SoC)
> +        * "FOO" = GPIO line named "FOO" on the schematic
> +        * "FOO_N" = GPIO line named "FOO" on schematic, active low
> +        */
> +       gpio-line-names = "ID_SDA",
> +                         "ID_SCL",
> +                         "SDA1",
> +                         "SCL1",
> +                         "GPIO_GCLK",
> +                         "GPIO5",
> +                         "GPIO6",
> +                         "SPI_CE1_N",
> +                         "SPI_CE0_N",
> +                         "SPI_MISO",
> +                         "SPI_MOSI",
> +                         "SPI_SCLK",
> +                         "GPIO12",
> +                         "GPIO13",
> +                         /* Serial port */
> +                         "TXD1",
> +                         "RXD1",
> +                         "GPIO16",
> +                         "GPIO17",
> +                         "GPIO18",
> +                         "GPIO19",
> +                         "GPIO20",
> +                         "GPIO21",
> +                         "GPIO22",
> +                         "GPIO23",
> +                         "GPIO24",
> +                         "GPIO25",
> +                         "GPIO26",
> +                         "GPIO27",
> +                         "", /* GPIO 28 */
> +                         "LAN_RUN_BOOT",
> +                         /* Used by BT module */
> +                         "CTS0",
> +                         "RTS0",
> +                         "TXD0",
> +                         "RXD0",
> +                         /* Used by Wifi */
> +                         "SD1_CLK",
> +                         "SD1_CMD",
> +                         "SD1_DATA0",
> +                         "SD1_DATA1",
> +                         "SD1_DATA2",
> +                         "SD1_DATA3",
> +                         "PWM0_OUT",
> +                         "PWM1_OUT",
> +                         "ETHCLK",
> +                         "WIFI_CLK",
> +                         "SDA0",
> +                         "SCL0",
> +                         "SMPS_SCL",
> +                         "SMPS_SDA",
> +                         /* Used by SD Card */
> +                         "SD_CLK_R",
> +                         "SD_CMD_R",
> +                         "SD_DATA0_R",
> +                         "SD_DATA1_R",
> +                         "SD_DATA2_R",
> +                         "SD_DATA3_R";
> +};
> +
>  &pwm {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pwm0_gpio40 &pwm1_gpio41>;
> --
> 2.7.4
>

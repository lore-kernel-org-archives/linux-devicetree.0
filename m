From: <harald@ccbib.org>
Subject: Re: [PATCH] ARM: dts: imx23-olinuxino: Add i2c support
Date: Thu, 09 Apr 2015 00:43:04 +0200
Message-ID: <3f0efa88b69ea2e8eb22909b6fbe6f91@imap.cosmopool.net>
References: <1428515100-1496-1-git-send-email-harald@ccbib.org>
 <1158701263.68321.1428531175931.JavaMail.open-xchange@oxbaltgw03.schlund.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1158701263.68321.1428531175931.JavaMail.open-xchange@oxbaltgw03.schlund.de>
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
Cc: Fabio.Estevam@freescale.com, devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Stefan!

On Thu, 9 Apr 2015 00:12:55 +0200 (CEST), Stefan Wahren
<stefan.wahren@i2se.com> wrote:
> Hi Harald,
> 
> [ add devicetree mailinglist ]
> 
>> Harald Geyer <harald@ccbib.org> hat am 8. April 2015 um 19:45
>> geschrieben:
>>
>>
>> The imx23-olinuxino board has an i2c interface exposed on UEXT
connector.
> 
> AFAIK the iMX233-OLinuXino-MICRO don't have a UEXT connector.

Yes, but I don't think having default i2c pins there would be a bad thing.

> Maybe we reached the point to make dts files for every Olinuxino board.
> In that case we could also handle the USB Host / Peripherial issue.

Yes, I'm thinking in this direction. But even if peripherial mode works
on micro/nano (which I haven't been able to confirm yet) that doesn't mean
that it should be set in the default device tree. After all Olimex
themself
advertise the port as host. 

>> This patch provides the necessary devicetree code.
>> Tested with MOD-LCD1x9 from Olimex.
>>
>> This patch is based on work by Fadil Berisha with his permission.
However
>> all bugs are mine.
>>
>> Signed-off-by: Harald Geyer <harald@ccbib.org>
>> ---
>> arch/arm/boot/dts/imx23-olinuxino.dts | 6 +++++
>> arch/arm/boot/dts/imx23.dtsi | 40 ++++++++++++++++++++++++++++++++-
>> 2 files changed, 45 insertions(+), 1 deletion(-)
>>
>> [...]
>> --- a/arch/arm/boot/dts/imx23.dtsi
>> +++ b/arch/arm/boot/dts/imx23.dtsi
>> @@ -308,6 +308,39 @@
>> fsl,voltage = <MXS_VOLTAGE_HIGH>;
>> fsl,pull-up = <MXS_PULL_ENABLE>;
>> };
>> +
>> + i2c_pins_a: i2c@0 {
>> + reg = <0>;
>> + fsl,pinmux-ids = <
>> + MX23_PAD_I2C_SCL__I2C_SCL
>> + MX23_PAD_I2C_SDA__I2C_SDA
>> + >;
>> + fsl,drive-strength = <MXS_DRIVE_8mA>;
>> + fsl,voltage = <MXS_VOLTAGE_HIGH>;
>> + fsl,pull-up = <MXS_PULL_ENABLE>;
>> + };
>> +
>> + i2c_pins_b: i2c@1 {
>> + reg = <1>;
>> + fsl,pinmux-ids = <
>> + MX23_PAD_LCD_ENABLE__I2C_SCL
>> + MX23_PAD_LCD_HSYNC__I2C_SDA
>> + >;
>> + fsl,drive-strength = <MXS_DRIVE_8mA>;
>> + fsl,voltage = <MXS_VOLTAGE_HIGH>;
>> + fsl,pull-up = <MXS_PULL_ENABLE>;
>> + };
>> +
>> + i2c_pins_c: i2c@2 {
>> + reg = <2>;
>> + fsl,pinmux-ids = <
>> + MX23_PAD_SSP1_DATA1__I2C_SCL
>> + MX23_PAD_SSP1_DATA2__I2C_SDA
>> + >;
>> + fsl,drive-strength = <MXS_DRIVE_8mA>;
>> + fsl,voltage = <MXS_VOLTAGE_HIGH>;
>> + fsl,pull-up = <MXS_PULL_ENABLE>;
>> + };
> 
> Please add only i2c_pins_b because this pin muxing is the only used one.

I disagree: Having all possible i2c pin groups documented in devicetree is
a good thing. Also imx23.dtsi is more general then olinuxino - somebody
might produce a imx23 based board where one of the other pin groups makes
more sense to use. Well, even on olinuxino somebody might use i2c_pins_a
if they don't need an UART, but use an LCD.

Thanks,
Harald

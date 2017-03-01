From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v4 24/36] [media] add Omnivision OV5640 sensor driver
Date: Tue, 28 Feb 2017 16:43:59 -0800
Message-ID: <7fcea7e2-b684-9824-a46d-46b5e250a728@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-25-git-send-email-steve_longerbeam@mentor.com>
 <20170227144539.3la2veztkurhwa2p@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170227144539.3la2veztkurhwa2p@rob-hp-laptop>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, Steve Longerbeam <steve_longerbeam@mentor.com>, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org



On 02/27/2017 06:45 AM, Rob Herring wrote:
> On Wed, Feb 15, 2017 at 06:19:26PM -0800, Steve Longerbeam wrote:
>> This driver is based on ov5640_mipi.c from Freescale imx_3.10.17_1.0.0_beta
>> branch, modified heavily to bring forward to latest interfaces and code
>> cleanup.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>> ---
>>   .../devicetree/bindings/media/i2c/ov5640.txt       |   43 +
> Please split to separate commit.

Done.

>
>>   drivers/media/i2c/Kconfig                          |    7 +
>>   drivers/media/i2c/Makefile                         |    1 +
>>   drivers/media/i2c/ov5640.c                         | 2109 ++++++++++++++++++++
>>   4 files changed, 2160 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>>   create mode 100644 drivers/media/i2c/ov5640.c
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
>> new file mode 100644
>> index 0000000..4607bbe
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
>> @@ -0,0 +1,43 @@
>> +* Omnivision OV5640 MIPI CSI-2 sensor
>> +
>> +Required Properties:
>> +- compatible: should be "ovti,ov5640"
>> +- clocks: reference to the xclk input clock.
>> +- clock-names: should be "xclk".
>> +- DOVDD-supply: Digital I/O voltage supply, 1.8 volts
>> +- AVDD-supply: Analog voltage supply, 2.8 volts
>> +- DVDD-supply: Digital core voltage supply, 1.5 volts
>> +
>> +Optional Properties:
>> +- reset-gpios: reference to the GPIO connected to the reset pin, if any.
>> +- pwdn-gpios: reference to the GPIO connected to the pwdn pin, if any.
> Use powerdown-gpios here as that is a somewhat standard name.

Done.

>
> Both need to state what is the active state.

Done.

Steve

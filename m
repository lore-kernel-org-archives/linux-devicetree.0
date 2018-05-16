From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH RFC 2/6] dt-bindings: hwmon: Add Raspberry Pi voltage
 sensor
Date: Wed, 16 May 2018 15:23:27 +0100
Message-ID: <30fc5bac-0c4a-b2c4-a018-ea521510aaea@arm.com>
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
 <1526477827-10859-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1526477827-10859-3-git-send-email-stefan.wahren@i2se.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Eric Anholt <eric@anholt.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 16/05/18 14:37, Stefan Wahren wrote:
> Recent VC4 firmware provides a hardware-independent way to retrieve the
> under-voltage sensor on the following Raspberry Pi boards:
>    - Raspberry Pi B+ (via GPIO on SoC)
>    - Raspberry Pi A+ (via GPIO on SoC)
>    - Raspberry Pi 2 B (via GPIO on SoC)
>    - Raspberry Pi 3 B (via GPIO on port expander)
>    - Raspberry Pi 3 B+ (via PMIC)
> 
> TODO:
>    - try to make bcm2835 firmware a bus driver

Do you actually need a DT binding? From the probe routine in patch 2 it 
looks like this capability can be discovered dynamically by asking the 
firmware, therefore it might be more straightforward for the firmware 
driver itself to probe that and create a child device iff the feature is 
present, which the hwmon driver can then bind to as a pure platform driver.

Robin.

> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>   .../devicetree/bindings/hwmon/raspberrypi-hwmon.txt   | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt b/Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt
> new file mode 100644
> index 0000000..ec2523f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt
> @@ -0,0 +1,19 @@
> +Raspberry Pi voltage sensor
> +---------------------------
> +
> +The VC4 firmware exposes a mailbox interface that allows the ARM core
> +to access the board's voltage sensor.
> +
> +Required properties :
> +- compatible : Should be "raspberrypi,bcm2835-hwmon"
> +
> +Example:
> +
> +firmware: firmware-rpi {
> +	compatible = "raspberrypi,bcm2835-firmware";
> +	mboxes = <&mailbox>;
> +
> +	voltage-sensor {
> +		compatible = "raspberrypi,bcm2835-hwmon";
> +	};
> +};
> 

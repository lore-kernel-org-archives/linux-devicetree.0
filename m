From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RFC 2/6] dt-bindings: hwmon: Add Raspberry Pi voltage
 sensor
Date: Wed, 16 May 2018 07:52:14 -0700
Message-ID: <20180516145214.GA30775@roeck-us.net>
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
 <1526477827-10859-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1526477827-10859-3-git-send-email-stefan.wahren@i2se.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, May 16, 2018 at 03:37:03PM +0200, Stefan Wahren wrote:
> Recent VC4 firmware provides a hardware-independent way to retrieve the
> under-voltage sensor on the following Raspberry Pi boards:
>   - Raspberry Pi B+ (via GPIO on SoC)
>   - Raspberry Pi A+ (via GPIO on SoC)
>   - Raspberry Pi 2 B (via GPIO on SoC)
>   - Raspberry Pi 3 B (via GPIO on port expander)
>   - Raspberry Pi 3 B+ (via PMIC)
> 
> TODO:
>   - try to make bcm2835 firmware a bus driver
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  .../devicetree/bindings/hwmon/raspberrypi-hwmon.txt   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt
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

'hwmon' is very Linux specific. DT bindings are supposed to be
OS agnostic.

Guenter

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
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

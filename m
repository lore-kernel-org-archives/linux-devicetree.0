From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: nvmem: add binding for Raspberry Pi OTP
Date: Thu, 6 Dec 2018 17:49:41 -0600
Message-ID: <20181206234941.GA6340@bogus>
References: <1542805904-6446-1-git-send-email-stefan.wahren@i2se.com>
 <1542805904-6446-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1542805904-6446-2-git-send-email-stefan.wahren@i2se.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Eric Anholt <eric@anholt.net>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-rpi-kernel@lists.infradead.org, gregkh@linuxfoundation.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2018 at 02:11:40PM +0100, Stefan Wahren wrote:
> This patch adds the devicetree binding for Raspberry Pi customer OTP
> driver.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  .../nvmem/raspberrypi,bcm2835-customer-otp.txt     | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/raspberrypi,bcm2835-customer-otp.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/raspberrypi,bcm2835-customer-otp.txt b/Documentation/devicetree/bindings/nvmem/raspberrypi,bcm2835-customer-otp.txt
> new file mode 100644
> index 0000000..041ff17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/raspberrypi,bcm2835-customer-otp.txt
> @@ -0,0 +1,22 @@
> +Customer OTP Memory for Raspberry Pi
> +
> +The VC4 firmware exposes a mailbox interface that allows the ARM core
> +to access the customer part of the OTP memory.
> +
> +The OTP node must be a child node of the Raspberry Pi firmware node.
> +
> +Required properties :
> +- compatible     : Should be "raspberrypi,bcm2835-customer-otp"

Why do we need this child node? Can't the parent instantiate this?

Are there OTP fields you want to expose in DT?

> +
> +See nvmem.txt for more information.
> +
> +Example:
> +
> +firmware: firmware-rpi {
> +	compatible = "raspberrypi,bcm2835-firmware";
> +	mboxes = <&mailbox>;
> +
> +	customer_otp: otp {
> +		compatible = "raspberrypi,bcm2835-customer-otp";
> +	};
> +};
> -- 
> 2.7.4
> 

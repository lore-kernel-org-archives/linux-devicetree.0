From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: gpio: add raspberry pi GPIO
 expander binding
Date: Sat, 13 Jan 2018 11:06:02 +0100 (CET)
Message-ID: <553468547.42989.1515837962934@email.1und1.de>
References: <cover.1515698418.git.baruch@tkos.co.il>
 <a93ba9ec4d3d3ff6d1e2a79f4f813a2f86c4086b.1515698418.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a93ba9ec4d3d3ff6d1e2a79f4f813a2f86c4086b.1515698418.git.baruch@tkos.co.il>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Eric Anholt <eric@anholt.net>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Baruch Siach <baruch@tkos.co.il>
Cc: linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Baruch,

> Baruch Siach <baruch@tkos.co.il> hat am 11. Januar 2018 um 20:44 geschrieben:
> 
> 
> The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware over
> I2C. The firmware mailbox interface allows the ARM core to control the
> GPIO lines.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>   * Rename compatible string to raspberrypi,firmware-gpio
> ---
>  .../bindings/gpio/raspberrypi,firmware-gpio.txt    | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
> new file mode 100644
> index 000000000000..8faf269cf541
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
> @@ -0,0 +1,24 @@
> +Raspberry Pi GPIO expander
> +
> +The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware. The
> +firmware exposes a mailbox interface that allows the ARM core to control the
> +GPIO lines on the expander.
> +
> +Required properties:
> +
> +- compatible : Should be "raspberrypi,firmware-gpio"
> +- gpio-controller : Marks the device node as a gpio controller
> +- #gpio-cells : Should be two.  The first cell is the pin number, and
> +  the second cell is used to specify the gpio polarity:
> +  0 = active high
> +  1 = active low
> +- firmware : Reference to the RPi firmware device node
> +
> +Example:
> +
> +expgpio: expgpio {

just a nit, please change this to

expgpio: gpio-expander {

just like in patch #4


Thanks Stefan

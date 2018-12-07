From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: lpc18xx: add GPIO pin interrupt controller
 support
Date: Fri, 7 Dec 2018 11:00:20 +0100
Message-ID: <CACRpkdamMQCvi_JSck9y8xHyNUST9zq=j=kfwvD92_JMpcAPgA@mail.gmail.com>
References: <20181128224841.3646-1-vz@mleia.com>
 <20181128224841.3646-3-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181128224841.3646-3-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 11:48 PM Vladimir Zapolskiy <vz@mleia.com> wrote:

> The change adds support of LPC18xx/LPC43xx GPIO pin interrupt controller
> block within SoC GPIO controller. The new interrupt controller driver
> allows to configure and capture edge or level interrupts on 8 arbitrary
> selectedinput GPIO pins, and lift the signals to be reported as NVIC rising
> edge interrupts. Configuration of a particular GPIO pin to serve as
> interrupt and its mapping to an interrupt on NVIC is done by SCU pin
> controller, for more details see description of 'nxp,gpio-pin-interrupt'
> device tree property of a GPIO pin [1].
>
> From LPC18xx and LPC43xx User Manuals the GPIO controller consists of
> the following blocks:
> * GPIO pin interrupt block at 0x40087000, this change adds its support,
> * GPIO GROUP0 interrupt block at 0x40088000,
> * GPIO GROUP1 interrupt block at 0x40089000,
> * GPIO port block at 0x400F4000, it is supported by the original driver.
>
> While all 4 sub-controller blocks have their own I/O addresses, moreover
> all 3 interrupt blocks are APB0 peripherals and high-speed GPIO block is
> an AHB slave, according to the hardware manual the GPIO controller is
> seen as a single block, and 4 sub-controllers have the shared reset signal
> RGU #28 and clock to register interface CLK_CPU_GPIO on CCU1.
>
> Likely support of two GPIO group interrupt blocks won't be added in short
> term, because the mechanism to mask several interrupt sources is not well
> defined.
>
> [1] Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

It's quite complex, but your implementation is so crisp and clean
that there is nothing to complain about really.

We are discussing putting some hierarchy handling into the
gpiolib core, so you might want to simplify the code later to
make use of this, but for now it's perfectly fine.

Patch applied.

Yours,
Linus Walleij

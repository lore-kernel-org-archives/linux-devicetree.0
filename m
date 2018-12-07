From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: lpc18xx: describe interrupt
 controllers of GPIO controller
Date: Fri, 7 Dec 2018 10:56:37 +0100
Message-ID: <CACRpkdboOz-6EJyUQr3m+Qoa5-j4JjjEpjHWVq8hMufyhbWPrQ@mail.gmail.com>
References: <20181128224841.3646-1-vz@mleia.com>
 <20181128224841.3646-2-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181128224841.3646-2-vz@mleia.com>
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

> From LPC18xx and LPC43xx User Manuals the GPIO controller consists of
> the following weakly connected blocks:
> * GPIO pin interrupt block at 0x40087000,
> * GPIO GROUP0 interrupt block at 0x40088000,
> * GPIO GROUP1 interrupt block at 0x40089000,
> * GPIO port block at 0x400F4000.
>
> While all 4 sub-controller blocks have their own I/O addresses, moreover
> all 3 interrupt blocks are APB0 peripherals and high-speed GPIO block is
> an AHB slave, according to the hardware manual interrupt controllers and
> GPIO controller block are seen as a single device, all 4 sub-controllers
> have the shared reset signal RGU #28 and the same shared clock to access
> registers CLK_Mx_GPIO on CCU1.
>
> The change adds descriptions of the currently missing interrupt controller
> blocks found on GPIO controller, new added properties are 'reg-names',
> 'resets', 'interrupt-controller' and '#interrupt-cells', also the example
> is updated to reflect the changes in device tree binding description.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

That is some seriously Frankenstein hardware.

But I see no problem with the way you are dealing with it,
it seems pretty much to the point.

So: patch applied.

Yours,
Linus Walleij

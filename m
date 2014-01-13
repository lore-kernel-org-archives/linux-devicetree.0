From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: DT include files
Date: Mon, 13 Jan 2014 10:19:14 +0800
Message-ID: <20140113021912.GB23525@S2101-09.ap.freescale.net>
References: <20140103023211.GA25079@S2101-09.ap.freescale.net>
 <201401111415.29395.arnd@arndb.de>
 <20140112032516.GA23525@S2101-09.ap.freescale.net>
 <201401122121.20084.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201401122121.20084.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <t.figa@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, "arm@kernel.org" <arm@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 12, 2014 at 09:21:19PM +0100, Arnd Bergmann wrote:
> I was under the impression that the generic pinctrl binding was designed
> in a way to let you assign labels to each possible (reasonable)
> configuration so you didn't have get to this level of detail at the
> driver.

The generic part of pinctrl binding only covers the procedure how a
client device get its pinctrl state configuration from a pin controller
node.  That's what we defined in bindings/pinctrl/pinctrl-bindings.txt
and implemented in pinctrl core.  But the details of how a pinctrl state
configuration should be interpreted for a particular pin controller is
defined by individual pin controller binding like fsl,imx-pinctrl.txt,
and implemented in the pin controller driver like
drivers/pinctrl/pinctrl-imx.c.

> I'm also surprised that you have to know multiple constants
> (mux register, input register, config register offsets) to select a
> particular pin. I would have expected that you could have one constant
> from which the driver is able to compute the other ones.

That's what we do before.  We define a constant in the binding and have
the driver to maintain these data and look up the data using the
constant.  See commit below for imx6q example.

  d8fe357 pinctrl: pinctrl-imx: add imx6q pinctrl driver

The biggest problem with that approach is we have huge data to maintain
in the driver because of the complexity and flexibility of IMX pin
controller design.  And these data can not be init data.  Check that big
array of struct imx_pin_reg in commit above for what I'm talking about.
So when we build a v7 kernel image for IMX, we will have such big array
for each of these SoCs, imx50, imx51, imx53, imx6sl, imx6dl, imx6q, and
more to come.

That's why we went through the pain of breaking DT compatibility to move
all these data into device tree one year ago with the commit below.

  e164153 pinctrl: imx: move hard-coding data into device tree

Now kernel gets released from the floating and we do not even need to
touch kernel to add these data when new SoC support is added.

Shawn

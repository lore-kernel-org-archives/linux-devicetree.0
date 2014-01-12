From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: DT include files
Date: Sun, 12 Jan 2014 11:25:22 +0800
Message-ID: <20140112032516.GA23525@S2101-09.ap.freescale.net>
References: <20140103023211.GA25079@S2101-09.ap.freescale.net>
 <CAOesGMhP5t=QHj7TdDY9Nq+=WHeQXv1V0n9TGmmEnqSG9SaFKg@mail.gmail.com>
 <20140111031214.GK21717@S2101-09.ap.freescale.net>
 <201401111415.29395.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201401111415.29395.arnd@arndb.de>
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

On Sat, Jan 11, 2014 at 02:15:28PM +0100, Arnd Bergmann wrote:
> On Saturday 11 January 2014, Shawn Guo wrote:
> > While I agree such macro usage should be avoided or limited, it really
> > helps IMX pinctrl case to improve the readability and make the handwriting
> > of these pinctrl entries less error prone.  Isn't it the whole point of
> > introducing macro support for DTC?
> 
> The macros are useful for all cases where the binding defines an
> arbitrary number space, e.g. for the interrupt flags or when a
> clock or pin controller provides a set of pins/clocks that don't
> already have a number assigned to them. In this case, the header
> file can be shared between the dts and kernel source files to ensure
> that they are talking about the same things.
> 
> However, I don't like to see uses of such macros where the definition
> is done to match a hardware constant (bit number, register index, etc),
> like in the recently posted eDMA driver case. Here the macro /reduces/
> readability of the dts source IMHO, because you cannot easily check
> the dts file against the data sheet without cross-referencing the
> header file as well.

I agree with you that we shouldn't use macros for IP block resources
like irq number and dma channel.  Once we code these SoC specific
data/number in <soc>.dtsi, all that board level dts files need to do
is to include <soc>.dtsi, nothing else.  However, pinctrl data is a
different case.  Which pin is in use, which mux option is selected for
the pin, how the pin should be configured, all these are board specific.
So these pinctrl configuration should be defined by individual board
level dts file rather than <soc>.dtsi.

Let's say the mux option SPDIF_OUT of pin GPIO_17 is used on a few board
designs, hummingboard, nitrogen6x and wandboard.  If we do not use
macro, every author of these board dts files need to look into reference
manual to find out the following numbers

 - The mux register offset of pin GPIO_17
 - The select input register offset of pin GPIO_17
 - The config register offset of pin GPIO_17
 - The value of SPDIF_OUT mux option for GPIO_17
 - The select input value of SPDIF_OUT mux option for GPIO_17

, and then code these numbers in their <board>.dts by hand.  It's
boring and error prone.  As a comparison, we generate these numbers
from reference manual database using a tool and define a macro
MX6QDL_PAD_GPIO_17__SPDIF_OUT for these numbers.  The authors only need
to find out this macro from imx6q-pinfunc.dtsi and fill it into his dts.
Isn't the macro use here helping to ease everyone's life and make the
coding less error prone, since the macro is generated from database?

Shawn

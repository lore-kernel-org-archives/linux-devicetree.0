From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 0/9] Introduce STMFX I2C Multi-Function eXpander
Date: Mon, 1 Apr 2019 11:19:34 +0100
Message-ID: <20190401101934.GC4187@dell>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
 <b3cdddb0-8177-600c-7108-9a16e9067190@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b3cdddb0-8177-600c-7108-9a16e9067190@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

On Fri, 29 Mar 2019, Amelie DELAUNAY wrote:

> Hi,
> 
> A gentle ping on this series (mfd + pinctrl patches, DT patches will be 
> taken in STM32 soc tree).

I currently have over 100 reviews in my backlog.

Please be patient.  You are on the list.

> On 2/27/19 10:34 AM, Amelie Delaunay wrote:
> > This series adds support for STMicroelectronics Multi-Function eXpander
> > (STMFX), used on some STM32 discovery and evaluation boards.
> > 
> > STMFX is an STM32L152 slave controller whose firmware embeds the following
> > features:
> > - I/O expander (16 GPIOs + 8 extra if the other features are not enabled),
> > - resistive touchscreen controller,
> > - IDD measurement.
> > 
> > I2C stuff and chip initialization is based on an MFD parent driver, which
> > registers STMFX features MFD children.
> > 
> > ---
> > Changes in v4:
> > - mfd: move registers #define into the header
> > - mfd: merge stmfx and stmfx_ddata structures into one stmfx structure
> > - mfd: change stmfx_chip_init/exit and stmfx_irq_init/exit args: use
> >    i2c_client struct and i2c_get_clientdata
> > - mfd: fix typos
> > - mfd: add MFD cells for IDD and TS features
> > - pinctrl: rework registers #define
> > - dts: add STMFX support on stm32mp157c-ev1
> > Changes in v3:
> > - fix MFD interrupt bindings
> > - fix drivers/mfd/stmfx.c:103:8: warning: 'mask' may be used uninitialized
> >    in this function
> > Changes in v2:
> > - move to MFD parent driver for i2c stuff and chip initialization
> > - improve regmap configuration
> > - take advantage of the use of gpio-ranges
> > 
> > Amelie Delaunay (9):
> >    dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
> >    mfd: Add ST Multi-Function eXpander (STMFX) core driver
> >    dt-bindings: pinctrl: document the STMFX pinctrl bindings
> >    pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
> >    ARM: dts: stm32: add STMFX support on stm32746g-eval
> >    ARM: dts: stm32: add joystick support on stm32746g-eval
> >    ARM: dts: stm32: add orange and blue leds on stm32746g-eval
> >    ARM: dts: stm32: add STMFX support on stm32mp157c-ev1
> >    ARM: dts: stm32: add joystick support on stm32mp157c-ev1
> > 
> >   Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 +
> >   .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 +++
> >   arch/arm/boot/dts/stm32746g-eval.dts               |  66 ++
> >   arch/arm/boot/dts/stm32mp157c-ev1.dts              |  60 ++
> >   drivers/mfd/Kconfig                                |  13 +
> >   drivers/mfd/Makefile                               |   2 +-
> >   drivers/mfd/stmfx.c                                | 568 ++++++++++++++
> >   drivers/pinctrl/Kconfig                            |  12 +
> >   drivers/pinctrl/Makefile                           |   1 +
> >   drivers/pinctrl/pinctrl-stmfx.c                    | 820 +++++++++++++++++++++
> >   include/linux/mfd/stmfx.h                          | 123 ++++
> >   11 files changed, 1808 insertions(+), 1 deletion(-)
> >   create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
> >   create mode 100644 drivers/mfd/stmfx.c
> >   create mode 100644 drivers/pinctrl/pinctrl-stmfx.c
> >   create mode 100644 include/linux/mfd/stmfx.h
> > 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/9] mfd: Add ST Multi-Function eXpander (STMFX) core
 driver
Date: Thu, 9 May 2019 10:33:38 +0100
Message-ID: <20190509093338.GW31645@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <1557392336-28239-3-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557392336-28239-3-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Thu, 09 May 2019, Amelie Delaunay wrote:

> STMicroelectronics Multi-Function eXpander (STMFX) is a slave controller
> using I2C for communication with the main MCU. Main features are:
> - 16 fast GPIOs individually configurable in input/output
> - 8 alternate GPIOs individually configurable in input/output when other
> STMFX functions are not used
> - Main MCU IDD measurement
> - Resistive touchscreen controller
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  drivers/mfd/Kconfig       |  13 ++
>  drivers/mfd/Makefile      |   2 +-
>  drivers/mfd/stmfx.c       | 545 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/stmfx.h | 123 +++++++++++
>  4 files changed, 682 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mfd/stmfx.c
>  create mode 100644 include/linux/mfd/stmfx.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

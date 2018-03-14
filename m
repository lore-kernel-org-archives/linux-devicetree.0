From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 0/2] Introduce STM32MP1 Reset driver
Date: Wed, 14 Mar 2018 10:12:02 +0100
Message-ID: <1521018722.4490.1.camel@pengutronix.de>
References: <1520958859-27911-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520958859-27911-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gabriel.fernandez@st.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gabriel.fernandez.st@gmail.com, Loic PALLARDY <loic.pallardy@st.com>, benjamin GAIGNARD <benjamin.gaignard@st.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Gabriel,

On Tue, 2018-03-13 at 17:34 +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch-set enables the reset of STM32MP1.
> It uses the reset simple driver by introducing the clear register offset
> parameter.
> STM32MP1 reset IP has a register to assert by writing '1' and another
> register to de-assert by writing '1'.
> The offset between this two registers is '0x4'.

I worry a bit about feature creep in the simple-reset driver.
Your patch on its own is simple enough, and I'm not opposed to add a
SET/CLR feature on principle, but there are a few issues:

The RESET_SIMPLE Kconfig description currently says:
  "This enables a simple reset controller driver for reset lines that
   that can be asserted and deasserted by toggling bits in a contiguous,
   exclusive register space."
That would have to be extended to mention SET/CLR register pairs as an
alternative.

What about status (reset_simple_status)? Can current reset line status
be read back from the SET register, as is currently tried? If not, is
there a way to read current reset line status back at all?

The data->lock spinlock is only needed to protect the read-modify-write
cycle on a toggle register, for separate SET/CLR register access the
locking is not necessary.

At this point, it may or may not be easier to add a custom reset driver.
Either way you go, this is missing binding documentation for the
st,stm32mp1-rcc compatible in Documentation/devicetree/bindings/reset.

> The patch 'dt-bindings: reset: add STM32MP1 resets' could be squashed
> with the patch:
> 'dt-bindings: Document STM32MP1 Reset Clock Controller (RCC) bindings'
> commit 3830681d354f
>
> Gabriel Fernandez (2):
>   dt-bindings: reset: add STM32MP1 resets
>   reset: simple: Enable stm32mp1 reset driver
> 
>  drivers/reset/reset-simple.c                |  27 +++++--
>  drivers/reset/reset-simple.h                |   1 +
>  include/dt-bindings/reset/stm32mp1-resets.h | 108 ++++++++++++++++++++++++++++
>  3 files changed, 130 insertions(+), 6 deletions(-)
>  create mode 100644 include/dt-bindings/reset/stm32mp1-resets.h

regards
Philipp

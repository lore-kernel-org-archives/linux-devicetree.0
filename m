From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RESEND PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
Date: Wed, 13 Feb 2019 09:40:33 +0100
Message-ID: <fc50a3a7f1efc8d2f6054a944848897ed8baf536.camel@baylibre.com>
References: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, narmstrong@baylibre.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: sboyd@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, 2019-02-10 at 23:26 +0100, Martin Blumenstingl wrote:
> It turns out that I'm not good at spelling "APB". Unfortunately an ABP
> (instead of APB) typo snug into two clocks in v5.0.
> 
> Currently there are no users of that clock yet, so fix it now
> before it's too late (meaning before it's used by <something>).
> 
> I decided to go the "normal" route where we can have separate
> branches for the dt-bindings and the drivers in the clk-meson
> repo. This means:
> - new (typo-free) clock #define
> - change the clock controller to use the new #define
> - (next development cycle) drop the old #define
> 
> resend - changes since v2 at [1]:
> - include the device-tree maintainers / mailing list
> 
> Changes since v1 at [0]:
> - split into a dt-bindings and clock controller driver patch
> 
> 
> [0] https://patchwork.kernel.org/cover/10742001/
> [1] https://patchwork.kernel.org/cover/10772199/
> 
> 
> Martin Blumenstingl (2):
>   dt-bindings: clock: meson8b: add APB clock definition
>   clk: meson: meson8b: fix the naming of the APB clocks
> 
>  drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
>  drivers/clk/meson/meson8b.h              |  2 +-
>  include/dt-bindings/clock/meson8b-clkc.h |  1 +
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

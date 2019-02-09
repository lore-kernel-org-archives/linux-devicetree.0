From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
Date: Sat, 9 Feb 2019 01:24:03 +0100
Message-ID: <CAFBinCCrYrxnb6Dk-0kGwbk0ttwe+je+wKZqxe6GUASnNdAckQ@mail.gmail.com>
References: <20190119205121.9621-1-martin.blumenstingl@googlemail.com>
 <095d0dca-f8d5-df7c-dbd0-7c2c50fcab82@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <095d0dca-f8d5-df7c-dbd0-7c2c50fcab82@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Mon, Jan 21, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 19/01/2019 21:51, Martin Blumenstingl wrote:
> > It turns out that I'm not good at spelling "APB". Unfortunately an ABP
> > (instead of APB) typo snug into two clocks in v5.0.
> >
> > Currently there are no users of that clock yet, so fix it now
> > before it's too late (meaning before it's used by <something>).
> >
> > I decided to go the "normal" route where we can have separate
> > branches for the dt-bindings and the drivers in the clk-meson
> > repo. This means:
> > - new (typo-free) clock #define
> > - change the clock controller to use the new #define
> > - (next development cycle) drop the old #define
> >
> >
> > Changes since v1 at [0]:
> > - split into a dt-bindings and clock controller driver patch
> >
> >
> > [0] https://patchwork.kernel.org/cover/10742001/
> >
> >
> > Martin Blumenstingl (2):
> >   dt-bindings: clock: meson8b: add APB clock definition
> >   clk: meson: meson8b: fix the naming of the APB clocks
> >
> >  drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
> >  drivers/clk/meson/meson8b.h              |  2 +-
> >  include/dt-bindings/clock/meson8b-clkc.h |  1 +
> >  3 files changed, 15 insertions(+), 14 deletions(-)
> >
>
> Once rob acks it, I'll apply both to next/drivers since it's not used (yet ?)
> and not a critical fix.
I have just noticed that I forgot to CC Rob and devicetree@vger.kernel.org.
do you want me to re-send this series?

as you already noticed this is not critical, so taking this through
next/drivers is fine for me.


Regards
Martin

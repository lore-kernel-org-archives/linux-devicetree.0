From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 4/7] dt-bindings: clock: reset: Add AXG AO Clock and
 Reset Bindings
Date: Mon, 16 Apr 2018 12:09:10 +0200
Message-ID: <1523873350.5918.6.camel@pengutronix.de>
References: <20180409143749.71197-1-yixun.lan@amlogic.com>
 <20180409143749.71197-5-yixun.lan@amlogic.com>
 <1523872752.2601.26.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1523872752.2601.26.camel@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Qiufang Dai <qiufang.dai@amlogic.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Mon, 2018-04-16 at 11:59 +0200, Jerome Brunet wrote:
> On Mon, 2018-04-09 at 22:37 +0800, Yixun Lan wrote:
> > Add dt-bindings headers for the Meson-AXG's AO clock and
> > reset controller.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> > ---
> >  include/dt-bindings/clock/axg-aoclkc.h | 26 ++++++++++++++++++++++++++
> >  include/dt-bindings/reset/axg-aoclkc.h | 20 ++++++++++++++++++++
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
> >  create mode 100644 include/dt-bindings/reset/axg-aoclkc.h
> 
> Hi Philipp,
> 
> Is OK if we take this through clock tree ?
> The related reset controller is actually part of a clock controller driver.

Absolutely, this should go in together with the driver.
I see no risk of merge conflicts here.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

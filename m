From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] clk: stm32: END_PRIMARY_CLK should be declare after
 CLK_SYSCLK
Date: Mon, 29 Jan 2018 12:52:37 -0600
Message-ID: <20180129185237.kbtvr2uhbxjfpfyj@rob-hp-laptop>
References: <1516286980-8603-1-git-send-email-gabriel.fernandez@st.com>
 <1516286980-8603-2-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1516286980-8603-2-git-send-email-gabriel.fernandez@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, daniel.thompson@linaro.org, Alexandre Torgue <alexandre.torgue@st.com>, Nicolas Pitre <nico@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, philippe.cornu@st.com, linux-kernel@vger.kernel.org, gabriel.fernandez.st@gmail.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 18, 2018 at 03:49:39PM +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Update of END_PRIMARY_CLK was missed, it should be after CLK_SYSCLK
> hsi and sysclk are overwritten by gpioa and gpiob.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  include/dt-bindings/clock/stm32fx-clock.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

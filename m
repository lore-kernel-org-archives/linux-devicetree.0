From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: stm32f4: Fix STM32F4_X_CLOCK()
 macro
Date: Fri, 20 Jan 2017 16:34:58 -0800
Message-ID: <20170121003458.GW20800@codeaurora.org>
References: <1483952833-14704-1-git-send-email-gabriel.fernandez@st.com>
 <1483952833-14704-2-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1483952833-14704-2-git-send-email-gabriel.fernandez@st.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, daniel.thompson@linaro.org, radoslaw.pietrzyk@gmail.com, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, andrea.merello@gmail.com, Michael Turquette <mturquette@baylibre.com>, olivier.bideau@st.com, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, ludovic.barre@st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, amelie.delaunay@st.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/09, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Macro to select a clock was not correct.
> 
> Offset of enable register starts at 0x30, then calculation to select a bit is:
> (@enable_reg - 0x30) / 4 * 32 + bit_to_select
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Tested-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

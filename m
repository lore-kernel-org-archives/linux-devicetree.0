From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v7 2/3] clk: gate: expose clk_gate_ops::is_enabled
Date: Thu, 20 Jul 2017 00:02:46 +0300
Message-ID: <eba13ecf-1034-dbfa-0398-4a907cf13b29@mleia.com>
References: <1500474344-9832-1-git-send-email-gabriel.fernandez@st.com>
 <1500474344-9832-3-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1500474344-9832-3-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, Lee Jones <lee.jones@linaro.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com, gabriel.fernandez.st@gmail.com, Arvind Yadav <arvind.yadav.cs@gmail.com>
List-Id: devicetree@vger.kernel.org

On 07/19/2017 05:25 PM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch exposes clk_gate_ops::is_enabled as functions
> that can be directly called and assigned in places like this so
> we don't need wrapper functions that do nothing besides forward
> the call.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Sugested by Stephen Boyd <sboyd@codeaurora.org>

Fixing the spelling etc. I believe the last tag line should be

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>

--
With best wishes,
Vladimir


From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 6/6] clk: stm32mp1: remove ck_apb_dbg clock
Date: Fri, 06 Apr 2018 13:44:43 -0700
Message-ID: <152304748362.94378.13779011954440917162@swboyd.mtv.corp.google.com>
References: <1522996773-24129-1-git-send-email-gabriel.fernandez@st.com>
 <1522996773-24129-7-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522996773-24129-7-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, benjamin GAIGNARD <benjamin.gaignard@st.com>, Loic PALLARDY <loic.pallardy@st.com>, olivier.bideau@st.com, linux-kernel@vger.kernel.org, gabriel.fernandez.st@gmail.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting gabriel.fernandez@st.com (2018-04-05 23:39:33)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> It's recommended to use only clk_sys_dbg clock instead to activate
> debug IP.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

Applied to clk-next

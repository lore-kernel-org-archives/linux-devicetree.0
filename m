From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND 1/2] clk: stm32: END_PRIMARY_CLK should be declare after
 CLK_SYSCLK
Date: Mon, 19 Mar 2018 13:45:38 -0700
Message-ID: <152149233843.242365.271342087460300826@swboyd.mtv.corp.google.com>
References: <1520578651-28849-1-git-send-email-gabriel.fernandez@st.com>
 <1520578651-28849-2-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520578651-28849-2-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, benjamin GAIGNARD <benjamin.gaignard@st.com>, Loic PALLARDY <loic.pallardy@st.com>, olivier.bideau@st.com, linux-kernel@vger.kernel.org, gabriel.fernandez.st@gmail.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting gabriel.fernandez@st.com (2018-03-08 22:57:30)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Update of END_PRIMARY_CLK was missed, it should be after CLK_SYSCLK
> hsi and sysclk are overwritten by gpioa and gpiob.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Tested-by: Philippe Cornu <philippe.cornu@st.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

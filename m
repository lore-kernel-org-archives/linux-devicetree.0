From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 04/14] drivers: clk: st: Add fs660c32 synthesizer
 algorithm
Date: Fri, 16 Sep 2016 16:03:00 -0700
Message-ID: <20160916230300.GP7243@codeaurora.org>
References: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
 <1472473626-15398-5-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472473626-15398-5-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@s
List-Id: devicetree@vger.kernel.org

On 08/29, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Use an algorithm instead of a table to compute clocks for fs660c32
> synthesizer.
> During a video playback we need to adjust audio & video frequencies.
> A table can't cover all HDMI resolutions and audio adjustment.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Acked-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

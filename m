From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 3/3] clk: berlin: bg2q: remove non-exist "smemc" gate
 clock
Date: Wed, 07 Jan 2015 15:11:58 +0100
Message-ID: <54AD3EAE.6090009@gmail.com>
References: <1420016272-6789-1-git-send-email-jszhang@marvell.com> <1420016272-6789-4-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420016272-6789-4-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>, mturquette@linaro.org, sboyd@codeaurora.org, alexandre.belloni@free-electrons.com, antoine.tenart@free-electrons.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 31.12.2014 09:57, Jisheng Zhang wrote:
> The "smemc" clock is removed on BG2Q SoCs. In fact, bit19 of clkenable
> register is for nfc. Current code use bit19 for non-exist "smemc"
> incorrectly, this prevents eMMC from working due to the sdhci's
> "core" clk is still gated.
>
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
> Cc: stable@vger.kernel.org # 3.16+
> ---
>   drivers/clk/berlin/bg2q.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/clk/berlin/bg2q.c b/drivers/clk/berlin/bg2q.c
> index 21784e4..440ef81 100644
> --- a/drivers/clk/berlin/bg2q.c
> +++ b/drivers/clk/berlin/bg2q.c
> @@ -285,7 +285,6 @@ static const struct berlin2_gate_data bg2q_gates[] __initconst = {
>   	{ "pbridge",	"perif",	15, CLK_IGNORE_UNUSED },
>   	{ "sdio",	"perif",	16, CLK_IGNORE_UNUSED },
>   	{ "nfc",	"perif",	18 },
> -	{ "smemc",	"perif",	19 },

Jisheng,

if bit 19 is for nfc, how does that work out with bit 18 which is
still assigned to nfc? Can you re-evaluate clkenable registers for
BG2Q and fix it up accordingly? I'd suggest to still disable as many
clocks as possible rather than removing the corresponding clk_gates.

Sebastian

>   	{ "pcie",	"perif",	22 },
>   };
>
>

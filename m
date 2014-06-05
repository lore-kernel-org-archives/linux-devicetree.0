From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH RESEND 12/12] drivers: clk: st: Use
 round to closest divider flag
Date: Thu, 5 Jun 2014 12:57:58 +0100
Message-ID: <20140605115758.GB2294@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
 <1401892320-18211-13-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401892320-18211-13-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, kernel@stlinux.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 04 Jun 2014, Gabriel FERNANDEZ wrote:

> This patch uses CLK_DIVIDER_ROUND_CLOSEST flag to specify
> the divider has to round to closest div.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---
>  drivers/clk/st/clkgen-mux.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Peter Griffin <peter.griffin@linaro.org>

Regards,

Peter

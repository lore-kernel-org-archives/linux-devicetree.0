From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH RESEND 06/12] drivers: clk: st: Add
 polarity bit indication
Date: Thu, 5 Jun 2014 08:45:16 +0100
Message-ID: <20140605074516.GA3865@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
 <1401892320-18211-7-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401892320-18211-7-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, kernel@stlinux.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Gabi,

On Wed, 04 Jun 2014, Gabriel FERNANDEZ wrote:

> This patch introduces polarity indication for pll power up bit
> and for standby bit in order to have same code between Orly 2
> and CAN.

I think it would be better to refer to the SoC's by there numeric
name stih416 and stih407, as people unfamiliar with ST SoC names
reading the commit message are unlikely to know what Orly2 or CAN 
mean.

Once fixed you can add my:
Acked-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter.

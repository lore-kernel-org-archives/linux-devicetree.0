From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH RESEND 10/12] drivers: clk: st: STiH407:
 Support for clockgenA9
Date: Thu, 5 Jun 2014 10:01:40 +0100
Message-ID: <20140605090140.GB9977@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
 <1401892320-18211-11-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401892320-18211-11-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, kernel@stlinux.com, linux-doc@vger.kernel.org, Olivier Bideau <olivier.bideau@st.com>, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 04 Jun 2014, Gabriel FERNANDEZ wrote:

> The patch added support for DT registration of ClockGenA9
> It includes c32 type PLL.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
> ---
>  drivers/clk/st/clkgen-pll.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Peter Griffin <peter.griffin@linaro.org>

Regards,

Peter

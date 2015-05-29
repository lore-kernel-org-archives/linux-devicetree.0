From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: Fix mapping of pin 63 (gpo -> gpio)
Date: Fri, 29 May 2015 11:10:02 +0200
Message-ID: <20150529111002.7368ca50@free-electrons.com>
References: <1428784160-19431-1-git-send-email-andrew@ncrmnt.org>
	<1428784160-19431-2-git-send-email-andrew@ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1428784160-19431-2-git-send-email-andrew@ncrmnt.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Andrianov <andrew@ncrmnt.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear Andrew Andrianov,

On Sat, 11 Apr 2015 23:29:19 +0300, Andrew Andrianov wrote:
> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-370.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-370.c b/drivers/pinctrl/mvebu/pinctrl-armada-370.c
> index c4f51d0..78c332d 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-370.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-370.c
> @@ -364,7 +364,7 @@ static struct mvebu_mpp_mode mv88f6710_mpp_modes[] = {
>  	   MPP_FUNCTION(0x5, "audio", "mclk"),
>  	   MPP_FUNCTION(0x6, "uart0", "cts")),
>  	MPP_MODE(63,
> -	   MPP_FUNCTION(0x0, "gpo", NULL),
> +	   MPP_FUNCTION(0x0, "gpio", NULL),
>  	   MPP_FUNCTION(0x1, "spi0", "sck"),
>  	   MPP_FUNCTION(0x2, "tclk", NULL)),
>  	MPP_MODE(64,

I know the patch has already been applied, but this is weird: I just
checked the datasheet again, and it really says this pin is a "gpo".
I'll try to get some more information.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

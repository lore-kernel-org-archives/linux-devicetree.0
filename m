From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH][v3] ARM: imx: pinctrl-imx: imx7d: add support for iomuxc
 lpsr
Date: Wed, 15 Jul 2015 15:23:07 +0800
Message-ID: <20150715072307.GM4119@tiger>
References: <1436295725-19011-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436295725-19011-1-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, linus.walleij@linaro.org, lznuaa@gmail.com, devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Anson.Huang@freescale.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 07, 2015 at 02:02:05PM -0500, Adrian Alonso wrote:
> * Extend pinctrl-imx driver to support iomux lpsr conntroller,
> * iMX7D has two iomuxc controllers, iomuxc controller similar as
>   previous iMX SoC generation and iomuxc-lpsr which provides
>   low power state rentetion capabilities on gpios that are part of
>   iomuxc-lpsr (GPIO1_IO7..GPIO1_IO0).
> * Use IOMUXC_LPSR_SUPPORT and iput_val most significant bits to
>   properly configure iomuxc/iomuxc-lpsr settings.
> 
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>

It took me quite some time to understand what the patch does.  Before I
gave specific comments on your implementation, I would discuss if there
is a better solution, as I do not like the idea of encoding these
artificial pin id of LPSR pads in the input_val.

Ideally, the LPSR controller should be implemented as a second instance
of IOMUXC.  But the problem seems to be the select input register is
shared between these two instances.  Is my understanding correct?

How select input register is shared?  With different bits in a single
register which is only laid on normal IOMUXC controller?

I need more details to understand the problem.

Shawn

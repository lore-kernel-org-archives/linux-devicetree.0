From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 7/7] clk: ns2: add clock support for Broadcom Northstar 2 SoC
Date: Tue, 13 Oct 2015 23:18:53 +0200
Message-ID: <5280890.6npshDUNFZ@wuerfel>
References: <1444770485-11210-1-git-send-email-jonmason@broadcom.com> <1444770485-11210-8-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1444770485-11210-8-git-send-email-jonmason@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Tuesday 13 October 2015 17:08:05 Jon Mason wrote:
> @@ -3,6 +3,7 @@ obj-$(CONFIG_CLK_BCM_KONA)      += clk-kona-setup.o
>  obj-$(CONFIG_CLK_BCM_KONA)     += clk-bcm281xx.o
>  obj-$(CONFIG_CLK_BCM_KONA)     += clk-bcm21664.o
>  obj-$(CONFIG_COMMON_CLK_IPROC) += clk-iproc-armpll.o clk-iproc-pll.o clk-iproc-asiu.o
> +obj-$(CONFIG_COMMON_CLK_IPROC) += clk-ns2.o
>  obj-$(CONFIG_ARCH_BCM_CYGNUS)  += clk-cygnus.o
>  obj-$(CONFIG_ARCH_BCM_NSP)     += clk-nsp.o
>  obj-$(CONFIG_ARCH_BCM_5301X)   += clk-nsp.o

If I understand this right, both CYGNUS and NS2 are IPROC based, but it
looks like you now require building the clk-ns2 file for both?

On a related note, I'm seeing problems when CONFIG_CYGNUS is set but
CONFIG_COMMON_CLK_IPROC is disabled, as that currently leads to a link
failure.

	Arnd

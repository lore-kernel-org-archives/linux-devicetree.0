From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 29/44] ARM: da8xx: add new USB PHY clock init using
 common clock framework
Date: Thu, 18 Jan 2018 20:44:24 +0530
Message-ID: <83dfab9a-be30-6313-d756-50fa018e757e@ti.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-30-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515377863-20358-30-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 08 January 2018 07:47 AM, David Lechner wrote:
> +int __init da8xx_register_usb20_phy_clk(bool use_usb_refclkin)
> +{
> +	struct regmap *cfgchip;
> +	struct clk *usb0_psc_clk, *clk;
> +	struct clk_hw *parent;
> +
> +	cfgchip = syscon_regmap_lookup_by_compatible("ti,da830-cfgchip");

Am I right in understanding that this API is only called for non-DT
boot? If yes, do we really need the lookup by compatible?

Thanks,
Sekhar

From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 13/14] net: phy: adin: add ethtool get_stats support
Date: Mon, 12 Aug 2019 16:26:37 +0200
Message-ID: <20190812142637.GR14290@lunn.ch>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-14-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812112350.15242-14-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> +/* Named just like in the datasheet */
> +static struct adin_hw_stat adin_hw_stats[] = {
> +	{ "RxErrCnt",		0x0014,	},
> +	{ "MseA",		0x8402,	0,	true },
> +	{ "MseB",		0x8403,	0,	true },
> +	{ "MseC",		0x8404,	0,	true },
> +	{ "MseD",		0x8405,	0,	true },
> +	{ "FcFrmCnt",		0x940A, 0x940B }, /* FcFrmCntH + FcFrmCntL */
> +	{ "FcLenErrCnt",	0x940C },
> +	{ "FcAlgnErrCnt",	0x940D },
> +	{ "FcSymbErrCnt",	0x940E },
> +	{ "FcOszCnt",		0x940F },
> +	{ "FcUszCnt",		0x9410 },
> +	{ "FcOddCnt",		0x9411 },
> +	{ "FcOddPreCnt",	0x9412 },
> +	{ "FcDribbleBitsCnt",	0x9413 },
> +	{ "FcFalseCarrierCnt",	0x9414 },

I see some value in using the names from the datasheet. However, i
found it quite hard to now what these counters represent given there
current name. What is Mse? How does MseA differ from MseB? You have up
to ETH_GSTRING_LEN characters, so maybe longer names would be better?

   Andrew

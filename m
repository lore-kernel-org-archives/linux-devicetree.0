From: Mugunthan V N <mugunthanvnm@ti.com>
Subject: Re: [PATCH v3 5/7] net: cpsw: Add am33xx MACID readout
Date: Mon, 18 Aug 2014 23:54:26 +0530
Message-ID: <53F244DA.3070803@ti.com>
References: <1408202315-20006-1-git-send-email-mpa@pengutronix.de> <1408202315-20006-6-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1408202315-20006-6-git-send-email-mpa@pengutronix.de>
Sender: linux-omap-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>, "David S. Miller" <davem@davemloft.net>
Cc: =?windows-1252?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Wolfram Sang <wsa@the-dreams.de>, Steven Rostedt <rostedt@goodmis.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Saturday 16 August 2014 08:48 PM, Markus Pargmann wrote:
> +	mac_addr[5] = (macid_lo >> 8) & 0xff;
> +	mac_addr[4] = macid_lo & 0xff;
> +	mac_addr[3] = (macid_hi >> 24) & 0xff;
> +	mac_addr[2] = (macid_hi >> 16) & 0xff;
> +	mac_addr[1] = (macid_hi >> 8) & 0xff;
> +	mac_addr[0] = macid_hi & 0xff;
> +
This will fail incase of DRA74x and DRA72x platforms, please check for
u-boot src for parsing logic as TRM is not out yet. Below is the actual
code for DRA7 platforms for MAC address parsing

mac_addr[0] = (mac_hi & 0xFF0000) >> 16;
mac_addr[1] = (mac_hi & 0xFF00) >> 8;
mac_addr[2] = mac_hi & 0xFF;
mac_addr[3] = (mac_lo & 0xFF0000) >> 16;
mac_addr[4] = (mac_lo & 0xFF00) >> 8;
mac_addr[5] = mac_lo & 0xFF;

Regards
Mugunthan V N

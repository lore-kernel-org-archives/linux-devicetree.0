From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] ARM: dts: i.MX25: add the clocks for the EPIT blocks
Date: Thu, 1 Nov 2018 23:19:13 +0200
Message-ID: <a253c416-44c2-23c6-65db-6d89d7f430a8@mleia.com>
References: <1541093567-29205-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541093567-29205-1-git-send-email-martin@kaiser.cx>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

On 11/01/2018 07:32 PM, Martin Kaiser wrote:
> The i.MX25 contains two EPIT (Enhanced Periodic Interrupt Timer)
> function blocks. Add their ipg and per clocks to the device tree.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

the change is obviously correct.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

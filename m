From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6q-logicpd: Re-Enable SNVS power key
Date: Mon, 14 Oct 2019 17:06:28 +0800
Message-ID: <20191014090626.GJ12262@dragon>
References: <20191002002029.19189-1-aford173@gmail.com>
 <20191002002029.19189-2-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002002029.19189-2-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, adam.ford@logicpd.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2019 at 07:20:29PM -0500, Adam Ford wrote:
> A previous patch disabled the SNVS power key by default which
> breaks the ability for the imx6q-logicpd board to wake from sleep.
> This patch re-enables this feature for this board.
> 
> Fixes: 770856f0da5d ("ARM: dts: imx6qdl: Enable SNVS power key according to board design")
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks.

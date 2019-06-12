From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ull-colibri: enable UHS-I for USDHC1
Date: Wed, 12 Jun 2019 18:45:29 +0800
Message-ID: <20190612104526.GF11086@dragon>
References: <20190606090612.16685-1-igor.opaniuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190606090612.16685-1-igor.opaniuk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Igor Opaniuk <igor.opaniuk@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, marcel@ziswiler.com, marcel.ziswiler@toradex.com, stefan@agner.ch
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 12:06:12PM +0300, Igor Opaniuk wrote:
> From: Igor Opaniuk <igor.opaniuk@toradex.com>
> 
> Allows to use the SD interface at a higher speed mode if the card
> supports it. For this the signaling voltage is switched from 3.3V to
> 1.8V under the usdhc1's drivers control.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@toradex.com>

Applied, thanks.

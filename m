From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7s-warp: PMIC swbst boot-on/always-on
Date: Wed, 20 Mar 2019 16:09:42 +0800
Message-ID: <20190320080940.GD4980@dragon>
References: <1551565949-13843-1-git-send-email-pjtexier@koncepto.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551565949-13843-1-git-send-email-pjtexier@koncepto.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Jean Texier <pjtexier@koncepto.io>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 02, 2019 at 11:32:29PM +0100, Pierre-Jean Texier wrote:
> PMIC swbst regulator is used for the MikroBUS socket (pin +5V).
> 
> We have to set the regulator to "boot-on" and "always-on"
> to output a voltage of 5V on this socket.
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Applied, thanks.

From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] soc: imx: gpcv2: handle additional power-down bits
 in handshake register
Date: Fri, 11 Jan 2019 15:13:42 +0800
Message-ID: <20190111071341.GB32649@dragon>
References: <20181217153152.21135-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181217153152.21135-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 04:31:51PM +0100, Lucas Stach wrote:
> Some of the i.MX8MQ domains have an additional control bit in the PU
> handshake (HSK) register. Documentation about this bit is a bit sparse
> at the moment, but it seems that it controls a power-down request to
> the AMBA domain bridge (ADB-400) attached to those domains.
> 
> As the documentation doesn't desribe the usage of this bit yet, handle
> it in the same way as done in the ATF implementation.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied both, thanks.

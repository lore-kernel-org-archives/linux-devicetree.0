From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6sll: declare src module to be compatible
 to imx51's src
Date: Thu, 28 Jun 2018 11:25:11 +0800
Message-ID: <20180628032510.GH22683@dragon>
References: <1529483917-18057-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529483917-18057-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 20, 2018 at 04:38:37PM +0800, Anson Huang wrote:
> i.MX6SLL uses same SRC module as i.MX51, add "fsl,imx51-src"
> compatible string to enable SRC driver to support setting
> CPU resume address for cpu-idle and suspend/resume.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.

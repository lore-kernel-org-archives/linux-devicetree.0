From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 1/3] ARM: dts: imx6ul-isiot: Move common nodes in
 imx6ul-isiot.dtsi
Date: Tue, 11 Jul 2017 10:05:47 +0800
Message-ID: <20170711020545.GB3172@dragon>
References: <1497528219-20396-1-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1497528219-20396-1-git-send-email-jteki@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagannadh.teki@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 05:33:37PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Maintaining separate dtsi file with common nodes make unclear and
> confusing since -isiot.dtsi is available for adding common nodes.
> If the nodes are common between the dts files then mark status
> as "okay" otherwise mark it "disabled" so-that respective dts
> can mark status "okay"
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Applied all, thanks.

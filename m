From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/6] ARM: dts: imx6qdl: Enable SNVS power key according
 to board design
Date: Tue, 18 Jun 2019 15:15:24 +0800
Message-ID: <20190618071522.GG29881@dragon>
References: <20190613033527.40555-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613033527.40555-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:35:22AM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> The SNVS power key depends on board design, by default it should
> be disabled in SoC DT and ONLY be enabled on board DT if it is
> wired up.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied all, thanks.

From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ls1028a: fix watchdog device node
Date: Wed, 5 Jun 2019 15:17:36 +0800
Message-ID: <20190605071735.GI29853@dragon>
References: <20190528124506.9339-1-chuanhua.han@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190528124506.9339-1-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 08:45:06PM +0800, Chuanhua Han wrote:
> ls1028a platform uses sp805 watchdog, and use 1/16 platform clock as
> timer clock, this patch fix device tree node.
> 
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>

Applied, thanks.

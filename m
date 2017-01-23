From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: imx6ul: Add Engicam Is.IoT MX6UL eMMC
 initial support
Date: Mon, 23 Jan 2017 17:47:37 +0800
Message-ID: <20170123094735.GO5662@dragon>
References: <1484867375-22411-1-git-send-email-jagan@openedev.com>
 <1484867375-22411-2-git-send-email-jagan@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1484867375-22411-2-git-send-email-jagan@openedev.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagan@openedev.com>
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 12:09:34AM +0100, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Engicam Is.IoT MX6UL has separate module for eMMC, so add emmc dts
> file for imx6ul-isiot.dtsi, usdhc2 node represent eMMC.
> 
> dmesg:
> -----
> mmc1: SDHCI controller on 2194000.usdhc [2194000.usdhc] using ADMA
> mmc1: new DDR MMC card at address 0001
> mmcblk1: mmc1:0001 M62704 3.53 GiB
> 
> Cc: Matteo Lisi <matteo.lisi@engicam.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Cc: Signed-off-by: Shawn Guo <shawnguo@kernel.org>

You only want to Cc me, not sign it off for me.  I removed the it when
applying.

Shawn

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

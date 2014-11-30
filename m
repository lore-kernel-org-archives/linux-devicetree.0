From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Date: Sun, 30 Nov 2014 01:08:53 -0800
Message-ID: <20141130090853.GG3608@norris-Latitude-E6410>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Wang <wangzhou.bry@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, caizhiyong@huawei.com, haojian.zhuang@gmail.com, xuwei5@hisilicon.com, wangzhou1@hisilicon.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 04, 2014 at 08:46:59PM +0800, Zhou Wang wrote:
> This patchset adds the support for NAND controller of hisilicon hip04 Soc.
> The NAND controller IP was developed by hisilicon and needs a new driver to
> support it. This patchset is based on v3.18-rc1. I have tested that NAND flash
> controller works fine in Hip04 D01 board.

Have you tested on the MTD test modules (drivers/mtd/tests/*)? This is
important, as we seem to regularly get UBIFS bug reports from users
whose drivers have not even passed some of the simple tests.

Also, it might be worth testing out the UBI tests found in the mtd-utils
package.

Brian

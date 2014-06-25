From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/2] Documentation: Document Hisilicon hix5hd2 sata PHY
Date: Wed, 25 Jun 2014 14:16:49 +0200
Message-ID: <201406251416.49561.arnd@arndb.de>
References: <1403687648-29082-1-git-send-email-zhangfei.gao@linaro.org> <1403687648-29082-2-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403687648-29082-2-git-send-email-zhangfei.gao@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, mark.rutland@arm.com, haifeng.yan@linaro.org, jchxue@gmail.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jiancheng Xue <xuejiancheng@huawei.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 25 June 2014, Zhangfei Gao wrote:
> From: Jiancheng Xue <xuejiancheng@huawei.com>
> 
> Add necessary binding documentation SATA PHY on Hisilicon hix5hd2 soc.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>

We have had a couple of PHY drivers that were initially meant to be
single-purpose but then turned out to be for hardware that could
be put into multiple modes (SATA, gbit ethernet, PCIe, ...). Are
you sure that this particular device is SATA-only?

	Arnd

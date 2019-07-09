From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 00/10] net: hisilicon: Add support for HI13X1 to
 hip04_eth
Date: Tue, 09 Jul 2019 14:29:44 -0700 (PDT)
Message-ID: <20190709.142944.544358620632880764.davem@davemloft.net>
References: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xiaojiangfeng@huawei.com
Cc: robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
List-Id: devicetree@vger.kernel.org

From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Date: Tue, 9 Jul 2019 11:31:01 +0800

> The main purpose of this patch series is to extend the
> hip04_eth driver to support HI13X1_GMAC.
> 
> The offset and bitmap of some registers of HI13X1_GMAC
> are different from hip04_eth common soc. In addition,
> the definition of send descriptor and parsing descriptor
> are different from hip04_eth common soc. So the macro
> of the register offset is redefined to adapt the HI13X1_GMAC.
> 
> Clean up the sparse warning by the way.
> 
> Change since v1:
> * Add a cover letter.

Series applied, thanks.

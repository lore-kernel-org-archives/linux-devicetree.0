From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: hisilicon: Add an tx_desc to adapt HI13X1_GMAC
Date: Mon, 08 Jul 2019 11:18:33 -0700 (PDT)
Message-ID: <20190708.111833.1002341757593028886.davem@davemloft.net>
References: <1562307003-103516-1-git-send-email-xiaojiangfeng@huawei.com>
        <20190707.221805.2104668553072088371.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707.221805.2104668553072088371.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: xiaojiangfeng@huawei.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, dingtianhong@huawei.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, xiekunxun@huawei.com, jianping.liu@huawei.com, nixiaoming@huawei.com
List-Id: devicetree@vger.kernel.org

From: David Miller <davem@davemloft.net>
Date: Sun, 07 Jul 2019 22:18:05 -0700 (PDT)

> From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
> Date: Fri, 5 Jul 2019 14:10:03 +0800
> 
>> HI13X1 changed the offsets and bitmaps for tx_desc
>> registers in the same peripheral device on different
>> models of the hip04_eth.
>> 
>> Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
> 
> Applied.

Actually I didn't apply this because I can't see that HI13X1_GMAC
kconfig knob anywhere in the tree at all.

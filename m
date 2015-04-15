From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH net-next 1/6] net: hip04: Set more appropriate value for tx coalesce num
Date: Wed, 15 Apr 2015 16:11:23 +0200
Message-ID: <4574922.qP9qWKPK3R@wuerfel>
References: <1429101008-9464-1-git-send-email-dingtianhong@huawei.com> <1429101008-9464-2-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1429101008-9464-2-git-send-email-dingtianhong@huawei.com>
Sender: netdev-owner@vger.kernel.org
To: Ding Tianhong <dingtianhong@huawei.com>
Cc: davem@davemloft.net, grant.likely@linaro.org, sergei.shtylyov@cogentembedded.com, linux-arm-kernel@lists.infradead.org, eric.dumazet@gmail.com, zhangfei.gao@linaro.org, joe@perches.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On Wednesday 15 April 2015 20:30:03 Ding Tianhong wrote:
> According Arnd's suggestion, the user might set the tx coalesce value
> in large range for different workloads, so we should define them to
> appropriate value.
> 
> Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <eric.dumazet@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Joe Perches <joe@perches.com>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

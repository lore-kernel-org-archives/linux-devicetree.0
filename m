From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v4 0/2] add hix5hd2 mac driver
Date: Mon, 02 Jun 2014 23:39:37 -0700 (PDT)
Message-ID: <20140602.233937.182448049174382056.davem@davemloft.net>
References: <1401774577-16683-1-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1401774577-16683-1-git-send-email-zhangfei.gao@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: zhangfei.gao@linaro.org
Cc: arnd@arndb.de, f.fainelli@gmail.com, sergei.shtylyov@cogentembedded.com, mark.rutland@arm.com, David.Laight@ACULAB.COM, eric.dumazet@gmail.com, haifeng.yan@linaro.org, jchxue@gmail.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Tue,  3 Jun 2014 13:49:35 +0800

> v4:
> Update indent
> Use usleep_range instead of udelay
> 
> v3:
> Remove .ndo_get_stats as mentioned by Tobias
> Add __le32 conversion pointed by Mark
> 
> v2:
> Update binding accoring to Sergei comments
> Update descriptor as Arnd's suggestion

Series applied, thanks.

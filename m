From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net/at91_ether: fix error return code in
 at91ether_probe()
Date: Fri, 12 Apr 2013 18:28:31 -0400 (EDT)
Message-ID: <20130412.182831.1885617574794144993.davem@davemloft.net>
References: <CAPgLHd_Toj+g36MdPJ2p=Vb+9mHAyZfM3KP=V2vyXV9rA7Vx4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd_Toj+g36MdPJ2p=Vb+9mHAyZfM3KP=V2vyXV9rA7Vx4w@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: weiyj.lk@gmail.com
Cc: nicolas.ferre@atmel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <weiyj.lk@gmail.com>
Date: Fri, 12 Apr 2013 10:42:40 +0800

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix to return a negative error code from the error handling
> case instead of 0, as returned elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Applied.

From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v5 1/4] ethernet: arc: Add support for Rockchip SoC
 layer device tree bindings
Date: Fri, 05 Sep 2014 15:10:32 -0700 (PDT)
Message-ID: <20140905.151032.2294854942425937456.davem@davemloft.net>
References: <1409763165-16461-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1409763165-16461-1-git-send-email-romain.perier@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: romain.perier@gmail.com
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

From: Romain Perier <romain.perier@gmail.com>
Date: Wed,  3 Sep 2014 16:52:42 +0000

> This patch defines a platform glue layer for Rockchip SoCs which
> support arc-emac driver. It ensures that regulator for the rmii is on
> before trying to connect to the ethernet controller. It applies right
> speed and mode changes to the grf when ethernet settings change.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>

You'll need to resubmit this series with the Kconfig warnings fixed.

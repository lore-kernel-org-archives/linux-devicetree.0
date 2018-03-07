From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] dt-bindings: net: dsa: marvell: describe
 compatibility string
Date: Wed, 07 Mar 2018 12:19:05 -0500 (EST)
Message-ID: <20180307.121905.1363133433451256877.davem@davemloft.net>
References: <1520287522-308-1-git-send-email-brandon.streiff@ni.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520287522-308-1-git-send-email-brandon.streiff@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: brandon.streiff@ni.com
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Brandon Streiff <brandon.streiff@ni.com>
Date: Mon, 5 Mar 2018 16:05:22 -0600

> There are two compatibility strings for mv88e6xxx, but it isn't clear
> from the documentation why only those two exist when the mv88e6xxx driver
> supports more than the 6085 and 6190. Briefly describe how the compatible
> property is used, and provide guidance on which to use.
> 
> The model list comes from looking at port_base_addr values (0x0 vs 0x10)
> in drivers/net/dsa/mv88e6xxx/chip.c.
> 
> Signed-off-by: Brandon Streiff <brandon.streiff@ni.com>

Applied.

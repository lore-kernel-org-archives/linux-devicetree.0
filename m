From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of_net: Fix missing of_find_device_by_node ref count
 drop
Date: Mon, 13 May 2019 08:53:31 -0700 (PDT)
Message-ID: <20190513.085331.1462639042534804530.davem@davemloft.net>
References: <1557740500-2479-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557740500-2479-1-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: ynezz@true.cz
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Petr ¦tetiar <ynezz@true.cz>
Date: Mon, 13 May 2019 11:41:39 +0200

> of_find_device_by_node takes a reference to the embedded struct device
> which needs to be dropped after use.
> 
> Fixes: d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> Signed-off-by: Petr ¦tetiar <ynezz@true.cz>

Applied, thank you.

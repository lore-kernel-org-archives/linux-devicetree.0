From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] of_net: Fix missing of_find_device_by_node ref count drop
Date: Mon, 13 May 2019 14:55:20 +0200
Message-ID: <20190513125520.GD28969@lunn.ch>
References: <1557740500-2479-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557740500-2479-1-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 11:41:39AM +0200, Petr Štetiar wrote:
> of_find_device_by_node takes a reference to the embedded struct device
> which needs to be dropped after use.
> 
> Fixes: d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> Signed-off-by: Petr Štetiar <ynezz@true.cz>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

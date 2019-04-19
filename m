From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of_net: Fix residues after of_get_nvmem_mac_address
 removal
Date: Fri, 19 Apr 2019 11:58:44 -0700 (PDT)
Message-ID: <20190419.115844.903040716308076686.davem@davemloft.net>
References: <1555531752-22813-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1555531752-22813-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: ynezz@true.cz
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, frowand.list@gmail.com, bgolaszewski@baylibre.com
List-Id: devicetree@vger.kernel.org

From: Petr ¦tetiar <ynezz@true.cz>
Date: Wed, 17 Apr 2019 22:09:12 +0200

> I've discovered following discrepancy in the bindings/net/ethernet.txt
> documentation, where it states following:
> 
>  - nvmem-cells: phandle, reference to an nvmem node for the MAC address;
>  - nvmem-cell-names: string, should be "mac-address" if nvmem is to be..
> 
> which is actually misleading and confusing. There are only two ethernet
> drivers in the tree, cadence/macb and davinci which supports this
> properties.
> 
> This nvmem-cell* properties were introduced in commit 9217e566bdee
> ("of_net: Implement of_get_nvmem_mac_address helper"), but
> commit afa64a72b862 ("of: net: kill of_get_nvmem_mac_address()")
> forget to properly clean up this parts.
> 
> So this patch fixes the documentation by moving the nvmem-cell*
> properties at the appropriate places.  While at it, I've removed unused
> include as well.
> 
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Fixes: afa64a72b862 ("of: net: kill of_get_nvmem_mac_address()")
> Signed-off-by: Petr ¦tetiar <ynezz@true.cz>

Applied, thanks.

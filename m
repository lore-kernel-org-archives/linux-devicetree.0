From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v4 0/2] dt-bindings: net: meson-dwmac: convert
 to yaml
Date: Thu, 22 Aug 2019 15:42:12 -0700 (PDT)
Message-ID: <20190822.154212.249670304042273740.davem@davemloft.net>
References: <20190820075742.14857-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820075742.14857-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com
Cc: robh+dt@kernel.org, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 20 Aug 2019 09:57:40 +0200

> This patchsets converts the Amlogic Meson DWMAC glue bindings over to
> YAML schemas using the already converted dwmac bindings.
> 
> The first patch is needed because the Amlogic glue needs a supplementary
> reg cell to access the DWMAC glue registers.
> 
> Changes since v3:
> - Specified net-next target tree
> 
> Changes since v2:
> - Added review tags
> - Updated allwinner,sun7i-a20-gmac.yaml reg maxItems

Series applied, thanks.

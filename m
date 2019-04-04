From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 3/4] net: phy: meson-gxl: add g12a support
Date: Thu, 4 Apr 2019 09:33:03 -0700
Message-ID: <f49292d8-5c57-32ef-5db4-ced0ba0d91e1@gmail.com>
References: <20190404131147.31156-1-jbrunet@baylibre.com>
 <20190404131147.31156-4-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404131147.31156-4-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/4/19 6:11 AM, Jerome Brunet wrote:
> The g12a SoC family uses the type of internal PHY that was used on the
> gxl family. The quirks of gxl family, like the LPA register corruption,
> appear to have been resolved on this new SoC generation.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

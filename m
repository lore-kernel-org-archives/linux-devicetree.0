From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] dt-bindings: net: dwmac: fix 'mac-mode' type
Date: Tue, 17 Sep 2019 14:41:32 +0200
Message-ID: <20190917124132.GG20778@lunn.ch>
References: <20190917103052.13456-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917103052.13456-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, f.fainelli@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 01:30:52PM +0300, Alexandru Ardelean wrote:
> The 'mac-mode' property is similar to 'phy-mode' and 'phy-connection-type',
> which are enums of mode strings.
> 
> The 'dwmac' driver supports almost all modes declared in the 'phy-mode'
> enum (except for 1 or 2). But in general, there may be a case where
> 'mac-mode' becomes more generic and is moved as part of phylib or netdev.
> 
> In any case, the 'mac-mode' field should be made an enum, and it also makes
> sense to just reference the 'phy-connection-type' from
> 'ethernet-controller.yaml'. That will also make it more future-proof for new
> modes.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Hi Alexandru

Adding a Fixes: tag would be good. Just reply in this thread, and
patchwork will do magic to append it to the patch.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH] dt-bindings: net: dwmac: fix 'mac-mode' type
Date: Fri, 20 Sep 2019 18:11:41 -0700
Message-ID: <20190920181141.52cfee67@cakuba.netronome.com>
References: <20190917103052.13456-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190917103052.13456-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, andrew@lunn.ch, f.fainelli@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2019 13:30:52 +0300, Alexandru Ardelean wrote:
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

Applied, thank you!

FWIW I had to add the Fixes tag by hand, either ozlabs patchwork or my
git-pw doesn't have the automagic handling there, yet.

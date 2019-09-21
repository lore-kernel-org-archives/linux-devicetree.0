From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH] dt-bindings: net: remove un-implemented property
Date: Fri, 20 Sep 2019 18:58:59 -0700
Message-ID: <20190920185859.6ebf05f1@cakuba.netronome.com>
References: <20190918111447.3084-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190918111447.3084-1-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Sep 2019 14:14:47 +0300, Alexandru Ardelean wrote:
> The `adi,disable-energy-detect` property was implemented in an initial
> version of the `adin` driver series, but after a review it was discarded in
> favor of implementing the ETHTOOL_PHY_EDPD phy-tunable option.
> 
> With the ETHTOOL_PHY_EDPD control, it's possible to disable/enable
> Energy-Detect-Power-Down for the `adin` PHY, so this device-tree is not
> needed.
> 
> Fixes: 767078132ff9 ("dt-bindings: net: add bindings for ADIN PHY driver")
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Applied, thank you!

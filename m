From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: remove un-implemented property
Date: Wed, 18 Sep 2019 07:07:57 -0500
Message-ID: <CAL_JsqLFUnafJkuc1XDMKd-j2SPR2=SpcDXbEOC7tW=hT9pxjA@mail.gmail.com>
References: <20190918111447.3084-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918111447.3084-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 3:15 AM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
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
> ---
>  Documentation/devicetree/bindings/net/adi,adin.yaml | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

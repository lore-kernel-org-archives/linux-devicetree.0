From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 01/15] dt-bindings: net: broadcom-bluetooth: Fix
 external clock names
Date: Tue, 18 Dec 2018 08:58:53 -0600
Message-ID: <20181218145853.GA15352@bogus>
References: <20181217040449.31437-1-wens@csie.org>
 <20181217040449.31437-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217040449.31437-2-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Loic Poulain <loic.poulain@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Dec 2018 12:04:35 +0800, Chen-Yu Tsai wrote:
> The Broadcom Bluetooth controllers can take up to two external clocks:
> an external frequency reference, substituting the main crystal, and a
> LPO clock at 32.768 kHz substituting the internal LPO clock.
> 
> In particular, the external LPO clock must be used when the controller
> does not have NVRAM connected, and the main reference frequency is not
> the default 20 MHz. This is described in detail in the datasheet.
> 
> The original "extclk" clock name is ambiguous as to which of these it
> refers to, and some designs might even require both.
> 
> This patch deprecates the existing name, and adds "txco" and "lpo".
> 
> Tested-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/net/broadcom-bluetooth.txt         | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

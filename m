From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 2/7] nfc: pn532: Add uart phy docs and rename it
Date: Wed, 9 Oct 2019 14:36:25 -0500
Message-ID: <20191009193625.GA19348@bogus>
References: <20191008140544.17112-1-poeschel@lemonage.de>
 <20191008140544.17112-3-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191008140544.17112-3-poeschel@lemonage.de>
Sender: netdev-owner@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Lars Poeschel <poeschel@lemonage.de>, "open list:NFC SUBSYSTEM" <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

On Tue,  8 Oct 2019 16:05:39 +0200, Lars Poeschel wrote:
> This adds documentation about the uart phy to the pn532 binding doc. As
> the filename "pn533-i2c.txt" is not appropriate any more, rename it to
> the more general "pn532.txt".
> This also documents the deprecation of the compatible strings ending
> with "...-i2c".
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Simon Horman <horms@verge.net.au>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> ---
> Changes in v9:
> - Rebased the patch series on v5.4-rc2
> - Produce patch with -M4 to git format-patch to detect the rename
> - Change DT node name from pn532@24 to nfc@24 in example
> 
> Changes in v8:
> - Update existing binding doc instead of adding a new one:
>   - Add uart phy example
>   - Add general "pn532" compatible string
>   - Deprecate "...-i2c" compatible strings
>   - Rename file to a more general filename
> - Intentionally drop Rob's Reviewed-By as I guess this rather big change
>   requires a new review
> 
> Changes in v7:
> - Accidentally lost Rob's Reviewed-By
> 
> Changes in v6:
> - Rebased the patch series on v5.3-rc5
> - Picked up Rob's Reviewed-By
> 
> Changes in v4:
> - Add documentation about reg property in case of i2c
> 
> Changes in v3:
> - seperate binding doc instead of entry in trivial-devices.txt
> 
>  .../net/nfc/{pn533-i2c.txt => pn532.txt}      | 25 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/net/nfc/{pn533-i2c.txt => pn532.txt} (42%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

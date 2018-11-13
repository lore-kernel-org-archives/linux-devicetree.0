From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Document cadence Sierra PHY
 bindings
Date: Mon, 12 Nov 2018 21:11:55 -0600
Message-ID: <20181113031155.GA12431@bogus>
References: <1542040921-10187-1-git-send-email-adouglas@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542040921-10187-1-git-send-email-adouglas@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Douglas <adouglas@cadence.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2018 at 04:42:01PM +0000, Alan Douglas wrote:
> Add DT binding documentation for Sierra PHY.  The PHY supports
> a number of different protocols, including PCIe and USB.
> 
> The PHY lanes may be configured as single or multi-lane links.
> Each link is treated as a separate sub-node.  For example, if
> there are 4 lanes in total the first 2 might be configured as
> a multi-lane PCIe link while the other two are single lane
> USB links, and in this case there would be 3 sub-nodes.
> 
> There are two resets for the PHY block (one for APB register
> access, one for the PHY link) and separate resets for each
> link.  For multi-lane links, the reset corresponds to the
> reset line on the master lane, the resets on other lanes
> have no effect.
> 
> Signed-off-by: Alan Douglas <adouglas@cadence.com>
> ---
>  .../devicetree/bindings/phy/phy-cadence-sierra.txt | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-sierra.txt

Please add acks/reviewed-bys when posting new versions.

Rob

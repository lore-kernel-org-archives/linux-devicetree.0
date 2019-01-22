From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/8] dt-bindings: phy-qcom-qmp: Add UFS PHY reset
Date: Mon, 21 Jan 2019 18:21:37 -0600
Message-ID: <20190122002137.GA14435@bogus>
References: <20190111230129.127037-1-evgreen@chromium.org>
 <20190111230129.127037-2-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111230129.127037-2-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Jan 2019 15:01:22 -0800, Evan Green wrote:
> Add a required reset to the SDM845 UFS phy to express the PHY reset
> bit inside the UFS controller register space. Before this change, this
> reset was not expressed in the DT, and the driver utilized two different
> callbacks (phy_init and phy_poweron) to implement a two-phase
> initialization procedure that involved deasserting this reset between
> init and poweron. This abused the two callbacks and diluted their
> purpose.
> 
> That scheme does not work as regulators cannot be turned off in
> phy_poweroff because they were turned on in init, rather than poweron.
> The net result is that regulators are left on in suspend that shouldn't
> be.
> 
> This new scheme gives the UFS reset to the PHY, so that it can fully
> initialize itself in a single callback. We can then turn regulators on
> during poweron and off during poweroff.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> I realize I'm not supposed to add a required property after the fact,
> but given that the UFS DT nodes that would use this binding are not
> yet upstream (and this would be the first), I was hoping to squeak by.
> 
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

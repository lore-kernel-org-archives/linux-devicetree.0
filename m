From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: phy-qcom-qmp: Fix register
 underspecification
Date: Tue, 23 Oct 2018 10:35:17 -0500
Message-ID: <20181023153517.GA24710@bogus>
References: <20181022205102.74825-1-evgreen@chromium.org>
 <20181022205102.74825-2-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181022205102.74825-2-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org, Can Guo <cang@codeaurora.org>, linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 22, 2018 at 01:50:58PM -0700, Evan Green wrote:
> Add register regions for the second lane of dual-lane nodes.
> This additional specification is needed so that the driver can stop
> reaching beyond the tx and rx register allocations to get at the
> second lane registers in a dual-lane PHY.
> 
> While in there, document #clock-cells as optional for PHYs that don't
> provide a pipe clock. Also, document the pcs_misc register region, which
> was being quietly supplied and used.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ---
> 
> Changes in v3: None
> Changes in v2:
> - Added dt bindings change, corresponding driver fixup, and USB PHY fixup

Please see my reply on v2.

> 
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 73 +++++++++++++++++++---
>  1 file changed, 65 insertions(+), 8 deletions(-)

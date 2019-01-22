From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 2/8] dt-bindings: phy: qcom-ufs: Add resets property
Date: Mon, 21 Jan 2019 18:26:25 -0600
Message-ID: <20190122002625.GA22073@bogus>
References: <20190111230129.127037-1-evgreen@chromium.org>
 <20190111230129.127037-3-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111230129.127037-3-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Jan 2019 15:01:23 -0800, Evan Green wrote:
> Add a resets property to the PHY that represents the PHY reset
> register in the UFS controller itself. This better describes the
> complete specification of the PHY, and allows the PHY to perform
> its initialization in a single function, rather than relying on
> back-channel sequencing of initialization through the PHY framework.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/ufs/ufs-qcom.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

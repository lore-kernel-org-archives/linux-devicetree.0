From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/5] net: Add support for Qualcomm ethqos
Date: Tue, 22 Jan 2019 19:38:20 -0800 (PST)
Message-ID: <20190122.193820.1381659831144896441.davem@davemloft.net>
References: <20190121091318.20079-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190121091318.20079-1-vkoul@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: vkoul@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, niklas.cassel@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 21 Jan 2019 14:43:13 +0530

> Some Qualcomm SoCs sport a ethqos controller which use DW ip, so add
> the glue driver which uses stmmac driver along with DT bindings for
> this device.
> 
> This controller supports rgmii mode and doesn't work with existing
> phy drivers as they do not remove the phy delay delay in this mode,
> so fix the two phy drivers tested with this.
> 
> Changes in v3:
>  - Add description in DT and rename the file and compatible as suggested by
>    Rob
>  - Update changelog for QCA8K driver
>  - Update AT803x phy disable delay for all RGMxx modes
> 
> Changes in v2:
>  - Fix the example in dt-binding
>  - Remove DT property for disable the delay and disable delay for RGMII mode
>    in AT803x and QCA8K PHY drivers

Series applied, thanks.

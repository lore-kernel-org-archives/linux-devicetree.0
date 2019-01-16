From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 2/8] dt-bindings: phy: qcom-ufs: Add resets property
Date: Wed, 16 Jan 2019 13:29:24 -0800
Message-ID: <154767416474.169631.9323736638860679135@swboyd.mtv.corp.google.com>
References: <20190111230129.127037-1-evgreen@chromium.org> <20190111230129.127037-3-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111230129.127037-3-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Evan Green (2019-01-11 15:01:23)
> diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt b/Documen=
tation/devicetree/bindings/ufs/ufs-qcom.txt
> index 21d9a93db2e97..985f5e99ab332 100644
> --- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> @@ -29,6 +29,7 @@ Optional properties:
>  - vdda-pll-max-microamp : specifies max. load that can be drawn from pll=
 supply
>  - vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power supply
>  - vddp-ref-clk-max-microamp : specifies max. load that can be drawn from=
 this supply
> +- resets : specifies the PHY reset in the UFS controller

Nitpick: Can you also add it to the example?

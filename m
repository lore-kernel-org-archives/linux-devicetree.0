From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm/dsi: Add ref clock for 10nm PHY
Date: Tue, 06 Nov 2018 15:09:40 -0800
Message-ID: <154154578082.88331.1035410665298962611@swboyd.mtv.corp.google.com>
References: <20181102214534.184593-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102214534.184593-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Matthias Kaehlcke (2018-11-02 14:45:33)
> Allow the 10nm PHY driver to get the ref clock from the DT.
> =

> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Docu=
mentation/devicetree/bindings/display/msm/dsi.txt
> index dfc743219bd88..d0d2046ceff69 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -105,6 +105,10 @@ Required properties:
>  - power-domains: Should be <&mmcc MDSS_GDSC>.
>  - clocks: Phandles to device clocks. See [1] for details on clock bindin=
gs.
>  - clock-names: the following clocks are required:
> +  For 10nm PHY:
> +  * "iface"
> +  * "ref"
> +  For other PHYs:
>    * "iface"

Any reason we can't go back and do this for other phys too? They're all
the same with regards to this reference clk input.

>    For 28nm HPM/LP, 28nm 8960 PHYs:
>  - vddio-supply: phandle to vdd-io regulator device node

From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v1 2/8] dt-bindings: phy: qcom-ufs: Add resets property
Date: Tue, 22 Jan 2019 10:34:12 -0800
Message-ID: <CAE=gft6cPWjnA=A50Z5OC2b+heSmW_Z=vu-8ia+R=G7M5sSf5Q@mail.gmail.com>
References: <20190111230129.127037-1-evgreen@chromium.org> <20190111230129.127037-3-evgreen@chromium.org>
 <154767416474.169631.9323736638860679135@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154767416474.169631.9323736638860679135@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 1:29 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Evan Green (2019-01-11 15:01:23)
> > diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> > index 21d9a93db2e97..985f5e99ab332 100644
> > --- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> > +++ b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> > @@ -29,6 +29,7 @@ Optional properties:
> >  - vdda-pll-max-microamp : specifies max. load that can be drawn from pll supply
> >  - vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power supply
> >  - vddp-ref-clk-max-microamp : specifies max. load that can be drawn from this supply
> > +- resets : specifies the PHY reset in the UFS controller
>
> Nitpick: Can you also add it to the example?
>

Sure, will do.

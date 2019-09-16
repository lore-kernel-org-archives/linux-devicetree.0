From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 4/8] dt-bindings: clock: Add devicetree binding for
 BM1880 SoC
Date: Mon, 16 Sep 2019 13:02:09 -0500
Message-ID: <CAL_JsqKDp4kY=PxDNnr2NARZ0HSPrtvLCuTh_9mvaWY8-5Sqbg@mail.gmail.com>
References: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org> <20190916161447.32715-5-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916161447.32715-5-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2019 at 11:15 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Add YAML devicetree binding for Bitmain BM1880 SoC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/clock/bitmain,bm1880-clk.yaml    | 76 +++++++++++++++++
>  include/dt-bindings/clock/bm1880-clock.h      | 82 +++++++++++++++++++
>  2 files changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
>  create mode 100644 include/dt-bindings/clock/bm1880-clock.h

Reviewed-by: Rob Herring <robh@kernel.org>

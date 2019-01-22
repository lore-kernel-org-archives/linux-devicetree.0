From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: fsl: Fix bindings for LS1012A
 and LS1021A based boards
Date: Tue, 22 Jan 2019 09:40:08 -0600
Message-ID: <CAL_JsqJR6s-EPJdvvyY=v=0RRUzee2NBXyssgeY1-YYK-C4q3g@mail.gmail.com>
References: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org> <20190122042147.5424-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122042147.5424-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 10:22 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Fix devicetree bindings for Freescale LS1012A and LS1021A SoC based boards.
>
> Fixes: a1a38e1f4d1d ("dt-bindings: arm: Convert FSL board/soc bindings to json-schema")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

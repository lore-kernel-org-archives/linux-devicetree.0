From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: arm: stm32: Convert STM32 SoC
 bindings to DT schema
Date: Wed, 12 Jun 2019 10:02:01 -0600
Message-ID: <CAL_JsqLRTK=7Ch7V-WA07_zxWMNGXmRH7=1TRR9m-zY7h_-YYQ@mail.gmail.com>
References: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org> <20190612075451.8643-3-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612075451.8643-3-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, loic pallardy <loic.pallardy@st.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 1:55 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> This commit converts STM32 SoC bindings to DT schema using jsonschema.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/arm/stm32/stm32.txt   | 10 -------
>  .../devicetree/bindings/arm/stm32/stm32.yaml  | 29 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 10 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

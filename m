From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFC v3 2/3] dt-bindings: sdm845-pinctrl: add wakeup interrupt parent
 for GPIO
Date: Wed, 21 Nov 2018 13:36:21 -0800
Message-ID: <154283618199.88331.10217252750356423959@swboyd.mtv.corp.google.com>
References: <20181121000648.29262-1-ilina@codeaurora.org>
 <20181121000648.29262-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121000648.29262-3-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: evgreen@chromium.org, marc.zyngier@arm.com
Cc: linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2018-11-20 16:06:47)
> SDM845 SoC has an always-on interrupt controller (PDC) with select GPIO
> routed to the PDC as interrupts that can be used to wake the system up
> from deep low power modes and suspend.
> =

> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 31 ++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> index 665aadb5ea28..bedfa0b57fa6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> @@ -29,6 +29,17 @@ SDM845 platform.
>         Definition: must be 2. Specifying the pin number and flags, as de=
fined
>                     in <dt-bindings/interrupt-controller/irq.h>
>  =

> +- wakeup-parent:
> +       Usage: optional
> +       Value type: <phandle>
> +       Definition: A phandle to the wakeup interrupt controller for the =
SoC.
> +
> +- wakeup-irq:

This shouldn't be needed. TLMM driver can probe for the possibility of
wakeup capable irqs from irq allocation step. The only place we should
need to know what TLMM pins map to what PDC lines is in the PDC driver.

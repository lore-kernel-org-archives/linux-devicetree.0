From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: thermal: Convert stm32 thermal bindings to json-schema
Date: Fri, 11 Oct 2019 13:35:59 -0500
Message-ID: <CAL_JsqKWrJjaoHWBrEJuA0qQ2tOzNuzGO6OCtH_Ccmfw89K8QQ@mail.gmail.com>
References: <20191002152125.16227-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002152125.16227-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:THERMAL" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 2, 2019 at 10:21 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 thermal binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/thermal/st,stm32-thermal.yaml         | 74 ++++++++++++++++++++++
>  .../devicetree/bindings/thermal/stm32-thermal.txt  | 61 ------------------
>  2 files changed, 74 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/thermal/stm32-thermal.txt

Same comments on other conversions apply here.

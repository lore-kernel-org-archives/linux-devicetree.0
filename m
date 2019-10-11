From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: Convert stm32 timer bindings to json-schema
Date: Fri, 11 Oct 2019 13:35:38 -0500
Message-ID: <CAL_JsqKcvPNAL69WRgFbbRmLLyVpeCOarcnMY=wJR-hgVD06GA@mail.gmail.com>
References: <20191002152253.16393-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002152253.16393-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 2, 2019 at 10:23 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 timer binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/timer/st,stm32-timer.txt   | 22 -----------
>  .../devicetree/bindings/timer/st,stm32-timer.yaml  | 46 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.yaml

Same comments on other conversions apply here.

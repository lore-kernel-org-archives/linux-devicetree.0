From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: thermal: Convert stm32 thermal bindings
 to json-schema
Date: Mon, 14 Oct 2019 12:19:00 -0500
Message-ID: <20191014171900.GA8680@bogus>
References: <20191014092200.24179-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014092200.24179-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Oct 2019 11:22:00 +0200, Benjamin Gaignard wrote:
> Convert the STM32 thermal binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> - fix indentation
> - add additionalProperties: false
> - add #thermal-sensor-cells property 
> 
>  .../bindings/thermal/st,stm32-thermal.yaml         | 79 ++++++++++++++++++++++
>  .../devicetree/bindings/thermal/stm32-thermal.txt  | 61 -----------------
>  2 files changed, 79 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/thermal/stm32-thermal.txt
> 

Applied, thanks.

Rob

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: timer: Convert stm32 timer bindings to
 json-schema
Date: Mon, 14 Oct 2019 12:19:27 -0500
Message-ID: <20191014171927.GA9665@bogus>
References: <20191014092316.24337-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014092316.24337-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, alexandre.torgue@st.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Oct 2019 11:23:16 +0200, Benjamin Gaignard wrote:
> Convert the STM32 timer binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> - fix identation
> - add additionalProperties: false
> 
>  .../devicetree/bindings/timer/st,stm32-timer.txt   | 22 ----------
>  .../devicetree/bindings/timer/st,stm32-timer.yaml  | 47 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.yaml
> 

Applied, thanks.

Rob

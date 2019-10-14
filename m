From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: media: Convert stm32 cec bindings to
 json-schema
Date: Mon, 14 Oct 2019 12:17:26 -0500
Message-ID: <20191014171726.GA5625@bogus>
References: <20191014092021.24020-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014092021.24020-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, yannick.fertre@st.com, philippe.cornu@st.com, hugues.fruchet@st.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Oct 2019 11:20:20 +0200, Benjamin Gaignard wrote:
> Convert the STM32 cec binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> 
> changes in v2:
> - use BSD-2-Clause license
> - add additionalProperties: false
> - remove pinctrl-names and pinctrl-[0-9]
> 
>  .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
>  .../devicetree/bindings/media/st,stm32-cec.yaml    | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> 

Applied, thanks.

Rob

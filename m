From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: media: Convert stm32 dcmi bindings to
 json-schema
Date: Mon, 14 Oct 2019 12:18:22 -0500
Message-ID: <20191014171822.GA7421@bogus>
References: <20191014092021.24020-1-benjamin.gaignard@st.com>
 <20191014092021.24020-2-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014092021.24020-2-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, yannick.fertre@st.com, philippe.cornu@st.com, hugues.fruchet@st.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Oct 2019 11:20:21 +0200, Benjamin Gaignard wrote:
> Convert the STM32 dcmi binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> -use (GPL-2.0-only OR BSD-2-Clause) license
> 
> changes in v2:
> - use BSD-2-Clause license
> - remove useless dma descriptions
> - fix clock property
> - add additionalProperties: false
> - fix reset indentation
> 
>  .../devicetree/bindings/media/st,stm32-dcmi.txt    | 45 -----------
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 86 ++++++++++++++++++++++
>  2 files changed, 86 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> 

Applied, thanks.

Rob

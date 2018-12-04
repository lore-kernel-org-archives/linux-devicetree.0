From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: stm32: Document
 hwlock properties
Date: Tue, 4 Dec 2018 14:47:33 -0600
Message-ID: <20181204204733.GA14508@bogus>
References: <20181113144805.1054-1-benjamin.gaignard@st.com>
 <20181113144805.1054-2-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181113144805.1054-2-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, alexandre.torgue@st.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 13, 2018 at 03:48:03PM +0100, Benjamin Gaignard wrote:
> Add hwlocks as optional property
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Should be linaro.org S-o-b?

> ---
>  .../devicetree/bindings/interrupt-controller/st,stm32-exti.txt        | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
> index 6a36bf66d932..cd01b2292ec6 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
> @@ -14,6 +14,10 @@ Required properties:
>    (only needed for exti controller with multiple exti under
>    same parent interrupt: st,stm32-exti and st,stm32h7-exti)
>  
> +Optional properties:
> +
> +- hwlocks: reference to a phandle of a hardware spinlock provider node.
> +
>  Example:
>  
>  exti: interrupt-controller@40013c00 {
> -- 
> 2.15.0
> 

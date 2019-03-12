From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: nvmem: Add STM32 factory-programmed
 romem
Date: Tue, 12 Mar 2019 11:12:55 -0500
Message-ID: <20190312161255.GA27965@bogus>
References: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
 <1551349196-8956-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551349196-8956-2-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 28 Feb 2019 11:19:51 +0100, Fabrice Gasnier wrote:
> Add documentation for STMicroelectronics STM32 Factory-programmed
> read only memory area.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
> Changes in v2:
> - update "st,stm32f4-otp" compatible as discussed with Rob
> ---
>  .../devicetree/bindings/nvmem/st,stm32-romem.txt   | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

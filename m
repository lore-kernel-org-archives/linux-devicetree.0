From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/6] dt-bindings: mfd: Add STM32F7 SDMMC2 rcc entry
Date: Mon, 5 Mar 2018 20:38:06 -0600
Message-ID: <20180306023806.rhmpp7lwftgb74un@rob-hp-laptop>
References: <1519901623-23216-1-git-send-email-patrice.chotard@st.com>
 <1519901623-23216-6-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1519901623-23216-6-git-send-email-patrice.chotard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: patrice.chotard@st.com
Cc: mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com, lee.jones@linaro.org, mcoquelin.stm32@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 01, 2018 at 11:53:42AM +0100, patrice.chotard@st.com wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
> 
> STM32F769 SoC provides 2 SDMMC instances, add missing
> RCC SDMMC2 entry for it.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  include/dt-bindings/mfd/stm32f7-rcc.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>                                 

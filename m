From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: stm32: syscon: add clock support
Date: Wed, 20 Mar 2019 13:05:22 +0000
Message-ID: <20190320130522.GO4731@dell>
References: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com>
 <1544604495-4082-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544604495-4082-2-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, arnd@arndb.de, mark.rutland@arm.com, gabriel.fernandez@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 12 Dec 2018, Fabrice Gasnier wrote:

> STM32 system configuration controller registers needs to be clocked.
> Document clock support on stm32-syscon.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
> Changes in v2:
> - move clocks to specific bindings using syscon as per Rob's comment
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

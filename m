From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/6] Add nvmem support on STM32
Date: Wed, 20 Mar 2019 14:25:28 +0000
Message-ID: <06ec547f-8c7c-0326-200f-22fcdca42b72@linaro.org>
References: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 28/02/2019 10:19, Fabrice Gasnier wrote:
> Non volatile memory area is available on STM32. It contains various
> factory programmed information such as unique device ID, analog calibration...
> This patchset adds:
> - NVMEM support to access stm32 data cells
> - helper to read 16 bits cells.
> 
> ---
> Changes in v2:
> - update "st,stm32f4-otp" compatible as discussed with Rob
> - add stm32f429 dts
> - add core helper to read 16 bits cells
> 
> Fabrice Gasnier (6):
>    dt-bindings: nvmem: Add STM32 factory-programmed romem
>    nvmem: Add driver for STM32 factory-programmed read only mem
>    nvmem: stm32: add support for STM32MP15 BSEC to control OTP data
>    nvmem: core: add nvmem_cell_read_u16

Applied all the nvmem patches except DTS patches to nvmem next

Thanks,
srini

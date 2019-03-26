From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/6] Add nvmem support on STM32
Date: Tue, 26 Mar 2019 13:27:58 +0100
Message-ID: <694a9e17-c864-bc11-6fdc-8f9f67e30e7c@st.com>
References: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>, srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabrice

On 2/28/19 11:19 AM, Fabrice Gasnier wrote:
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

...

>    ARM: dts: stm32: Add romem and temperature calibration on stm32mp157c
>    ARM: dts: stm32: Add romem and temperature calibration on stm32f429

DT patches applied on stm32-next.

Regards
Alex

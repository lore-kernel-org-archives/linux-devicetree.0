From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/4] Enable stm32mp1 camera support
Date: Tue, 21 May 2019 12:03:55 +0200
Message-ID: <6ba8698f-0c05-5293-4811-2f632bf1b047@st.com>
References: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hugues Fruchet <hugues.fruchet@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Dear Hugues,

On 2/28/19 3:25 PM, Hugues Fruchet wrote:
> This patchset serie enables camera of stm32mp157c evaluation board.
> To do so, both stm32mp157c DCMI camera interface driver and OV5640 camera
> module driver are enabled in devicetree.
> 
> DCMI camera interface driver is enabled by default in multi_v7 configuration
> but OV5640 driver remains to be selected at kernel configuration time.
> 
> This patchset depends on STMicroelectronics Multi-Function eXpander
> (STMFX) support [1].
> 
> [1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1944108.html
> 
> Hugues Fruchet (4):
>    ARM: dts: stm32: add 2v8 fixed regulator for stm32mp157c-ed1 board
>    ARM: dts: stm32: add DCMI camera interface support on stm32mp157c
>    ARM: dts: stm32: add DCMI pins to stm32mp157c
>    ARM: dts: stm32: enable OV5640 camera on stm32mp157c-ev1 board
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 41 ++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts     |  8 +++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     | 56 +++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 12 +++++++
>   4 files changed, 117 insertions(+)
> 

Patch 2 to 4 applied on stm32-next. Patch 1 is no longer needed as 
regulators are now provided by PMIC.

thanks
Alex

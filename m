From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/3] CAN fix for stm32mp157c
Date: Mon, 3 Dec 2018 09:58:07 +0100
Message-ID: <ccc28b23-ce6d-41a9-74ea-2f7c85f69c84@st.com>
References: <1542271942-28130-1-git-send-email-bich.hemon@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542271942-28130-1-git-send-email-bich.hemon@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bich HEMON <bich.hemon@st.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Hi Bich,

On 11/15/18 9:52 AM, Bich HEMON wrote:
> This patchset changes the CAN RAM mapping and adds CAN sleep pins.
> 
> Bich Hemon (3):
>    ARM: dts: stm32: change CAN RAM mapping on stm32mp157c
>    ARM: dts: stm32: add can1 sleep pins muxing
>    ARM: dts: stm32: add can1 sleep pins muxing on stm32mp157c-ev1 board
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 7 +++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     | 3 ++-
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 4 ++--
>   3 files changed, 11 insertions(+), 3 deletions(-)
> 
> -- 
> 1.9.1

Series applied on stm32-next.

Regards
Alex

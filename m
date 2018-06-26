From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/2] Add USB OTG HS support on stm32mp157c
Date: Tue, 26 Jun 2018 11:27:59 +0200
Message-ID: <be346ccb-908d-0af2-7499-4a45b780692e@st.com>
References: <1526572052-17155-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526572052-17155-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Amélie

On 05/17/2018 05:47 PM, Amelie Delaunay wrote:
> This patchset adds support for USB OTG HS on stm32mp157c SoC.
> It also enables USB OTG HS on stm32mp157c-ev1 board in Peripheral mode.
> 
> Amelie Delaunay (2):
>    ARM: dts: stm32: add USB OTG HS support for stm32mp157c SoC
>    ARM: dts: stm32: enable USB OTG HS on stm32mp157c-ev1
> 
>   arch/arm/boot/dts/stm32mp157c-ev1.dts |  7 +++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi    | 15 +++++++++++++++
>   2 files changed, 22 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex

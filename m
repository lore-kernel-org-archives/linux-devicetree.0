From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 0/5] Add supply property for DSI controller
Date: Wed, 10 Apr 2019 15:48:43 +0200
Message-ID: <315b59d5-893a-607a-01e4-cf83fe1cfd86@st.com>
References: <1554279389-27377-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554279389-27377-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Yannick

On 4/3/19 10:16 AM, Yannick Fertré wrote:
> The DSI controller needs a new property that powers its physical layer.
> Binding has been updated to documented this property.
> Device tree of stm32mp157c soc.
> Move reg18 & reg11 to stm32mp157c device tree file.
> Remove property phy-dsi-supply property to stm32mp157c-dk2.dts file.
> 
> Yannick Fertré (5):

...

>    ARM: dts: stm32: add phy-dsi-supply property on stm32mp157c
>    ARM: dts: stm32: move fixe regulators reg11 & reg18
>    ARM: dts: stm32: remove phy-dsi-supply property on stm32mp157c-dk2
>      board
> 

For ARM part:

Another series is currently under review: "Add support for STM32MP1 
power regulators" (https://lkml.org/lkml/2019/4/8/614).

As soon I'll merge it I'll take your patches without patch
"ARM: dts: stm32: move fixe regulators reg11 & reg18" as it will be no 
longer relevant.

regards
Alexandre


>   .../devicetree/bindings/display/st,stm32-ltdc.txt    |  3 +++
>   arch/arm/boot/dts/stm32mp157c-dk2.dts                |  9 ---------
>   arch/arm/boot/dts/stm32mp157c-ed1.dts                | 16 ----------------
>   arch/arm/boot/dts/stm32mp157c.dtsi                   | 17 +++++++++++++++++
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c                | 20 ++++++++++++++++++++
>   5 files changed, 40 insertions(+), 25 deletions(-)
> 

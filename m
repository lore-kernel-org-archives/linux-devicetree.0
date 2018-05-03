From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/3] ARM: dts: stm32: Add display support on
 stm32f469-disco
Date: Thu, 3 May 2018 16:58:00 +0200
Message-ID: <0b6b2bac-a9b5-2e08-5da6-e367a083b03d@st.com>
References: <20180215082014.30383-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180215082014.30383-1-philippe.cornu@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Cornu <philippe.cornu@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Vincent Abriou <vincent.abriou@st.com>
List-Id: devicetree@vger.kernel.org

Hi Philippe

On 02/15/2018 09:20 AM, Philippe Cornu wrote:
> This serie adds the mipi dsi support to stm32f469 and enables it
> on the stm32f469-disco board.
> 
> Philippe CORNU (1):
>    ARM: dts: stm32: Add display support on stm32f469-disco
> 
> Philippe Cornu (2):
>    ARM: dts: stm32: Add dt-bindings gpio.h include on stm32f469-disco
>    ARM: dts: stm32: Add new stm32f469 dtsi file with mipi dsi
> 
>   arch/arm/boot/dts/stm32f469-disco.dts | 54 +++++++++++++++++++++++++++++++++--
>   arch/arm/boot/dts/stm32f469.dtsi      | 19 ++++++++++++
>   2 files changed, 71 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm/boot/dts/stm32f469.dtsi
> 

Thanks for new dtsi file. Series applied on stm32-next.

Regards
Alex

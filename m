From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 0/3] Enable CEC on stm32mp157c-ev1 board
Date: Thu, 3 May 2018 14:16:42 +0200
Message-ID: <038aa5e4-b637-d021-c8d8-09d247e109c6@st.com>
References: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: yannick fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Gerald Baeza <gerald.baeza@st.com>, Patrice Chotard <patrice.chotard@st.com>, Kamel Kholti <kamel.kholti@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

hi,

On 04/24/2018 09:54 AM, yannick fertre wrote:
> This patch-set enables CEC (Consumer Electronics Control) on stm32mp157c
> eval board.
> 
> yannick fertre (3):
>    ARM: dts: stm32: add cec support on stm32mp157c
>    ARM: dts: stm32: add cec pins to stm32mp157c
>    ARM: dts: stm32: add cec support on stm32mp157c-ev1
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 9 +++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     | 6 ++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 9 +++++++++
>   3 files changed, 24 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex

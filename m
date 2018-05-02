From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 0/2] Add ltdc & dsi support on stm32mp157c
Date: Wed, 2 May 2018 18:23:05 +0200
Message-ID: <f4f45fc9-df55-c094-8b63-35efb31a4069@st.com>
References: <1524556488-5404-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524556488-5404-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: yannick fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Gerald Baeza <gerald.baeza@st.com>, Patrice Chotard <patrice.chotard@st.com>, Kamel Kholti <kamel.kholti@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

hi

On 04/24/2018 09:54 AM, yannick fertre wrote:
> This patch-set adds display controller & DSI controller support to
> stm32mp157c SOC.
> 
> Version 1:
> - Initial commit
> 
> yannick fertre (2):
>    ARM: dts: stm32: add ltdc support on stm32mp157c
>    ARM: dts: stm32: add dsi support on stm32mp157c
> 
>   arch/arm/boot/dts/stm32mp157c.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
Series applied on stm32-next.

Regards
Alex

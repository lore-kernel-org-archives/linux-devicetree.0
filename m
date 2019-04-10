From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 0/2] add cec pins muxing
Date: Wed, 10 Apr 2019 16:08:58 +0200
Message-ID: <88623d7b-1258-2c2b-d3ad-ab0069ca2a9d@st.com>
References: <1553863315-6652-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553863315-6652-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>
List-Id: devicetree@vger.kernel.org

Hi Yannick

On 3/29/19 1:41 PM, Yannick Fertré wrote:
> Add cec pins muxing
> 
> Yannick Fertré (2):
>    ARM: dts: stm32: add cec pins muxing on stm32mp157
>    ARM: dts: stm32: add sleep pinctrl for cec on stm32mp157c
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 

Series applied on stm32-next. Note that I squashed the both patches
as they deal only with pins muxing group definition.

Regards
Alex

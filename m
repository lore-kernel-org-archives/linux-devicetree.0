From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add I2C sleep pins muxing on stm32mp157
Date: Wed, 10 Apr 2019 15:56:41 +0200
Message-ID: <a7b040d1-30fc-5f72-9b91-813f2446184a@st.com>
References: <1553856500-31009-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553856500-31009-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

Hi Yannick

On 3/29/19 11:48 AM, Yannick Fertré wrote:
> Add I2C sleep pins muxing for low power mode.
> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> index 9104896..b04899f 100644
> --- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> @@ -213,6 +213,13 @@
>   				};
> 

Applied on stm32-next.

Thanks.
Alex

From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/5] Add STM32F7 I2C Support on STM32MP157C
Date: Wed, 2 May 2018 18:10:30 +0200
Message-ID: <31786b0e-28cb-3bde-6d5e-03466dbbda8c@st.com>
References: <1524476911-19056-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524476911-19056-1-git-send-email-pierre-yves.mordret@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Yangbo Lu <yangbo.lu@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 04/23/2018 11:48 AM, Pierre-Yves MORDRET wrote:
> 
> This patch adds STM32MP157C I2C support on STM32MP157C with configs and device
> tree.
> In the same way I2C4 is enabled for STM32MP157C ED1 Daughter bord.
> I2C2/5 is enabled on STM32MP157C EV1 Daughter board on Evaluation board.
> ---
>    Version history:
>       v1:
>          * Initial
>       v2:
>          * Disambiguate subjects
> ---
> 
> Pierre-Yves MORDRET (5):
>    ARM: multi_v7_defconfig: Add STM32F7 I2C support
>    ARM: dts: stm32: Add STM32F7 I2C support for STM32MP157C SoC
>    ARM: dts: stm32: Add I2Cs pin control on STM32MP157C
>    ARM: dts: stm32: Add I2C4 support for STM32MP157C-ED1
>    ARM: dts: stm32: Add I2C2/5 support for STM32MP157C-EV1
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 40 ++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts     |  8 ++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     | 17 +++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 77 +++++++++++++++++++++++++++++++
>   arch/arm/configs/multi_v7_defconfig       |  1 +
>   5 files changed, 143 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex

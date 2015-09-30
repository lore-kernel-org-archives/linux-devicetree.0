From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH v2 00/11] Hi Maxime / Patrice / Srini,
Date: Wed, 30 Sep 2015 10:37:19 +0200
Message-ID: <560B9F3F.1080701@st.com>
References: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patrice.chotard@st.com, srinivas.kandagatla@gmail.com
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 09/28/2015 02:37 PM, Peter Griffin wrote:
> This series makes a series of updates to the stih407 pinctrl groups
> and makes the upstream kernel more closely aligned in terms of pin
> configuration to the vendor kernel.
>
> A number of new periphs are added such as spi fsm, nand, cec0, and
> for others such as SPI the various alternate function pin muxings have
> been added. Finally for SPI the controller nodes have been updated
> to have the default pin assignment in the controller node.
>
> Changes since v1:
>   - Rebase on v4.3-rc3
>   - Remove some SoBs (Lee)
>   - Collect up Acks
>
> kind regards,
>
> Peter.
>
> Peter Griffin (11):
>    ARM: STi: DT: STiH407: Add a cec0 pin definition
>    ARM: STi: DT: STiH407: Add i2c3 alternate pin configs
>    ARM: DT: STiH407: Add SPI 3 wire and 4 wire pinctrl configs
>    ARM: DT: STiH407: Add serial3 pinctrl configuration
>    ARM: DT: STiH407: Add SPI FSM (NOR Flash) Controller pin config
>    ARM: DT: STiH407: Add NAND flash controller pin configuration
>    ARM: DT: STiH407: Add systrace pin configuration
>    ARM: DT: STiH407: Add SD pinctrl config for mmc0 controller
>    ARM: DT: STiH407: Add pinconfig for IRB UHF and IRB TX
>    ARM: DT: STiH407: Add RMII pinctrl support
>    ARM: STi: STiH407: Add spi default pinctrl groups.
>
>   arch/arm/boot/dts/stih407-family.dtsi  |  14 ++
>   arch/arm/boot/dts/stih407-pinctrl.dtsi | 378 ++++++++++++++++++++++++++++++++-
>   2 files changed, 387 insertions(+), 5 deletions(-)
>

Series applied to sti-dt-for-v4.4.
Thanks!
Maxime

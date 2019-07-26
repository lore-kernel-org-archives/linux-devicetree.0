From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/4] regulator: add support for the STM32 ADC booster
Date: Fri, 26 Jul 2019 18:22:25 +0200
Message-ID: <d8bc0f0d-adc6-abd6-f248-94c72b360b00@st.com>
References: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
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
To: Fabrice Gasnier <fabrice.gasnier@st.com>, broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabrice

On 7/1/19 10:14 AM, Fabrice Gasnier wrote:
> Add support for the 3.3V booster regulator embedded in stm32h7 and stm32mp1
> devices, that can be used to supply ADC analog input switches.
> It's useful to reach full ADC performance when their supply is below 2.7V
> (vdda by default).
> 
> Changes in v2:
> - rebase on top of for-next branch
> 
> Fabrice Gasnier (4):
>    dt-bindings: regulator: add support for the stm32-booster
>    regulator: add support for the stm32-booster
>    ARM: multi_v7_defconfig: enable STM32 booster regulator
>    ARM: dts: stm32: add booster for ADC analog switches on stm32mp157c
> 
>   .../bindings/regulator/st,stm32-booster.txt        |  18 +++
>   arch/arm/boot/dts/stm32mp157c.dtsi                 |   6 +
>   arch/arm/configs/multi_v7_defconfig                |   1 +
>   drivers/regulator/Kconfig                          |  11 ++
>   drivers/regulator/Makefile                         |   1 +
>   drivers/regulator/stm32-booster.c                  | 132 +++++++++++++++++++++
>   6 files changed, 169 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
>   create mode 100644 drivers/regulator/stm32-booster.c
> 

DT patch + config applied in stm32-next.

regards
alex

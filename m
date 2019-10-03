From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/3] Add support for ADC on stm32mp157a-dk1
Date: Thu, 3 Oct 2019 12:08:50 +0200
Message-ID: <4ae1d526-e681-a8e5-925b-ec7a3e28868d@st.com>
References: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
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
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Fabrice

On 9/13/19 4:34 PM, Fabrice Gasnier wrote:
> This series adds support for ADC on stm32mp157a-dk1 board:
> - enable vrefbuf regulator used as reference voltage
> - define ADC pins for AIN connector and USB Type-C CC pins
> - configure ADC1 and ADC2 to use these
> 
> Fabrice Gasnier (3):
>    ARM: dts: stm32: Enable VREFBUF on stm32mp157a-dk1
>    ARM: dts: stm32: add ADC pins used on stm32mp157a-dk1
>    ARM: dts: stm32: enable ADC support on stm32mp157a-dk1
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 16 +++++++++++++++
>   arch/arm/boot/dts/stm32mp157a-dk1.dts     | 34 +++++++++++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex

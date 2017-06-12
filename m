From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/3] Add stm32h743i-disco board
Date: Mon, 12 Jun 2017 11:45:19 +0200
Message-ID: <00f0b99b-5915-69a8-a278-336b605ff78f@st.com>
References: <1496819783-5113-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1496819783-5113-1-git-send-email-patrice.chotard@st.com>
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
To: patrice.chotard@st.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Patrice,

On 06/07/2017 09:16 AM, patrice.chotard@st.com wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
> 
> This series adds basic support for the stm32h743i discovery board
> based on stm32h7 MCU.
> 
> v2:	_ update commit messages header with format "ARM: dts: stm32: ...."
> 
> Patrice Chotard (3):
>    ARM: dts: stm32: Add usart2_pins on stm32h743.
>    ARM: dts: stm32: Add usart2 support on stm32h743.
>    ARM: dts: stm32: Add stm32h743i-disco board
> 
>   arch/arm/boot/dts/Makefile               |  3 +-
>   arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 13 ++++++
>   arch/arm/boot/dts/stm32h743.dtsi         |  8 ++++
>   arch/arm/boot/dts/stm32h743i-disco.dts   | 73 ++++++++++++++++++++++++++++++++
>   4 files changed, 96 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/stm32h743i-disco.dts
> 

Series applied on stm32-dt-for-v4.13

Regards
Alex

From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/3] Add RTC support on STM32F746
Date: Mon, 3 Apr 2017 16:51:14 +0200
Message-ID: <9deef7aa-e060-61bb-1680-c9b728f85a81@st.com>
References: <1484833519-9298-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484833519-9298-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi

On 01/19/2017 02:45 PM, Amelie Delaunay wrote:
> This patchset enables STM32 RTC on STM32F746 MCU.
>
> Amelie Delaunay (3):
>   ARM: dts: stm32: set HSE_RTC clock frequency to 1 MHz on stm32f746
>   ARM: dts: stm32: Add RTC support for STM32F746 MCU
>   ARM: dts: stm32: enable RTC on stm32746g-eval
>
>  arch/arm/boot/dts/stm32746g-eval.dts |  4 ++++
>  arch/arm/boot/dts/stm32f746.dtsi     | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
>

Series applied on stm32-dt-for-v4.12

regards
Alex

From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 0/4] Add DMAv2 and DMAMUX Support on STM32MP157C
Date: Mon, 23 Apr 2018 10:51:49 +0200
Message-ID: <ad5373d4-13b4-319f-5dce-6b8c735a9851@st.com>
References: <1524215681-14555-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524215681-14555-1-git-send-email-pierre-yves.mordret@st.com>
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
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pierre-Yves,

On 04/20/2018 11:14 AM, Pierre-Yves MORDRET wrote:
> This patch adds DMAv2 and DMAMUX support on STM32MP157C with configs and device tree.
> ---
>    Version history:
>       v1:
>          * Initial
> ---
> 
> Pierre-Yves MORDRET (4):
>    ARM: configs: stm32: Add DMAv2 support on STM32MP157C machine
>    ARM: configs: stm32: Add DMAMUX support on STM32MP157C

For patches located in mach-stm32, for the next time I prefer that you 
format commit header as following:

ARM: stm32: Add DMAv2 support on STM32MP157C.....

I don't see other issue, so don't resend for that, I will change it.

Regards
Alex


>    ARM: dts: stm32: Add DMAv2 support on STM32MP157C
>    ARM: dts: stm32: Add DMAMUX support on STM32MP157C
> 
>   arch/arm/boot/dts/stm32mp157c.dtsi | 44 ++++++++++++++++++++++++++++++++++++++
>   arch/arm/mach-stm32/Kconfig        |  2 ++
>   2 files changed, 46 insertions(+)
> 

From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/3] ARM: dts: stm32: IPCC mailbox support on STM32MP157c
Date: Tue, 26 Mar 2019 12:18:28 +0100
Message-ID: <1ab227d3-5024-021d-f11c-78e14a997804@st.com>
References: <1551431919-23410-1-git-send-email-fabien.dessenne@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551431919-23410-1-git-send-email-fabien.dessenne@st.com>
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
To: Fabien Dessenne <fabien.dessenne@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Fabien

On 3/1/19 10:18 AM, Fabien Dessenne wrote:
> Support IPCC mailbox on STM32MP157c-ed1 and STM32MP157a-dk1 boards.
> 
> Fabien Dessenne (3):
>    ARM: dts: stm32: add IPCC mailbox support on STM32MP157c
>    ARM: dts: stm32: enable IPCC mailbox support on STM32MP157c-ed1
>    ARM: dts: stm32: enable IPCC mailbox support on STM32MP157a-dk1
> 
>   arch/arm/boot/dts/stm32mp157a-dk1.dts |  4 ++++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts |  4 ++++
>   arch/arm/boot/dts/stm32mp157c.dtsi    | 15 +++++++++++++++
>   3 files changed, 23 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex

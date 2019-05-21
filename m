From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [RESEND v2 0/3] Add Vivante GPU support on STM32MP157c
Date: Tue, 21 May 2019 11:09:35 +0200
Message-ID: <c565693a-a7fe-4361-0e1f-6bf09e2d8b84@st.com>
References: <1558082528-12889-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1558082528-12889-1-git-send-email-pierre-yves.mordret@st.com>
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
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lucas Stach <l.stach@pengutronix.de>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pierre-Yves,

On 5/17/19 10:42 AM, Pierre-Yves MORDRET wrote:
> Add and enable Vivante GPU on stm32mp157c for ED1, DK1 and DK2 boards.
> ---
>    Version history:
>      v2:
>         * move GPU reserved memeory out of bottom DDR to let free this area for
>           U-Boot
>      v1:
>         * Initial
> ---
> Pierre-Yves MORDRET (3):
>    ARM: dts: stm32: Add Vivante GPU support on STM32MP157c
>    ARM: dts: stm32: enable Vivante GPU support on stm32mp157c-ed1 board
>    ARM: dts: stm32: enable Vivante GPU support on stm32mp157a-dk1 board
> 
>   arch/arm/boot/dts/stm32mp157a-dk1.dts | 16 ++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts | 16 ++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi    | 10 ++++++++++
>   3 files changed, 42 insertions(+)
> 

Series applied on stm32-next.

Thanks
Alex

From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/2] Add STM32MP157 discovery boards support
Date: Fri, 15 Feb 2019 11:16:47 +0100
Message-ID: <243cc4f0-6910-82ea-9c0a-929faee168a5@st.com>
References: <1549357625-7229-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1549357625-7229-1-git-send-email-alexandre.torgue@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 2/5/19 10:07 AM, Alexandre Torgue wrote:
> This patch series add support of two new discovery boards based on
> STM32MP157 MPU: stm32mp157a-dk1 and stm32mp157c-dk2.
> 
> stm32mp157a-dk1 board embeds a STM32MP157a SOC with AC package (TFBGA361,
> 148 ios) and 512MB of DDR3. Several connections are available on this boards:
> 4*USB2.0, 1*USB2.0 typeC, SDcard, RJ45, HDMI, Arduino connector, ...
> 
> stm32mp157c-dk2 board complements stm32mp157a-dk1 board with a display panel
> (otm8009a) and a Murata Wifi/BT combo. It embeds a STM32MP157c SOC with AC
> package.
> 
> Those patches enable basic support for a kernel boot.
> 
> regards
> Alex
> 
> Alexandre Torgue (2):
>    ARM: dts: stm32: add initial support of stm32mp157a-dk1 board
>    ARM: dts: stm32: add initial support of stm32mp157c-dk2 board
> 
>   arch/arm/boot/dts/Makefile            |  2 +
>   arch/arm/boot/dts/stm32mp157a-dk1.dts | 77 +++++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-dk2.dts | 75 ++++++++++++++++++++++++++++++++++
>   3 files changed, 154 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32mp157a-dk1.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-dk2.dts
> 

Series applied on stm32-next.

Regards
Alex

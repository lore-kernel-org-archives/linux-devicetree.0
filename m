From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v3 0/4] Add support of STM32 hwspinlock
Date: Mon, 3 Dec 2018 09:46:03 +0100
Message-ID: <5c137862-e8fa-abb4-d931-f5c63db50649@st.com>
References: <20181112152342.6561-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181112152342.6561-1-benjamin.gaignard@st.com>
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
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Benjamin,

On 11/12/18 4:23 PM, Benjamin Gaignard wrote:
> This serie adds the support of the hardware semaphore block for stm32mp1 SoC.
> 
> version 3:
> - fix clock name in properties description.
> - use postcore_initcall() instead of module_platform_driver()
> 
> version 2:
> - fix comments done by Bjorn about clock naming, license terms in header,
>    alphabetic ordering in Makefile and Kconfig and remove function
> - Do not push test module in this version while waiting for feedbacks about it
> 
> 
> Benjamin Gaignard (4):
>    dt-bindings: hwlock: Document STM32 hwspinlock bindings
>    hwspinlock: add STM32 hwspinlock device
>    ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
>    ARM: dts: stm32: enable hwspinlock on stm32mp157c-ed1
> 
>   .../bindings/hwlock/st,stm32-hwspinlock.txt        |  23 +++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts              |   4 +
>   arch/arm/boot/dts/stm32mp157c.dtsi                 |   9 ++
>   drivers/hwspinlock/Kconfig                         |   9 ++
>   drivers/hwspinlock/Makefile                        |   1 +
>   drivers/hwspinlock/stm32_hwspinlock.c              | 156 +++++++++++++++++++++
>   6 files changed, 202 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
>   create mode 100644 drivers/hwspinlock/stm32_hwspinlock.c
> 

There is a (strong) dependency between pinctrl and hsem.
As our pin controller is enabled by default, it's better to enable also
your hwspinlock device by default. It will avoid pin controller probe 
defer and a no stable behavior. So, I gonna remove DT patches from 
stm32-next. Those Dt patches will not be included in my 4.20 pull-request.

regards
Alex

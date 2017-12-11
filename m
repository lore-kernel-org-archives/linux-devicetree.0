From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH 1/6] ARM: stm32: prepare stm32 family to welcome armv7
 architecture
Date: Mon, 11 Dec 2017 15:22:00 +0100
Message-ID: <9ef92e81-fdd2-fa71-1e87-f797a191d215@st.com>
References: <1512742277-28205-1-git-send-email-ludovic.Barre@st.com>
 <1512742277-28205-2-git-send-email-ludovic.Barre@st.com>
 <CACRpkdaKZk5N9F=_nYSzKWyXgW4xQ9Ltft7-UNM+a-nOpqq2xg@mail.gmail.com>
 <CAK8P3a2rrpFuwET8r1H0YWVABbCZr5c2ySrKCgA4mfoZPfWp6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a2rrpFuwET8r1H0YWVABbCZr5c2ySrKCgA4mfoZPfWp6Q@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 12/11/2017 02:40 PM, Arnd Bergmann wrote:
> On Mon, Dec 11, 2017 at 11:25 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> On Fri, Dec 8, 2017 at 3:11 PM, Ludovic Barre <ludovic.Barre@st.com> wrote:
>>
>>> From: Ludovic Barre <ludovic.barre@st.com>
>>>
>>> This patch prepares the STM32 machine for the integration of Cortex-A
>>> based microprocessor (MPU), on top of the existing Cortex-M
>>> microcontroller family (MCU). Since both MCUs and MPUs are sharing
>>> common hardware blocks we can keep using ARCH_STM32 flag for most of
>>> them. If a hardware block is specific to one family we can use either
>>> ARCH_STM32_MCU or ARCH_STM32_MPU flag.
>>>
>>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> 
> To what degree do we need to treat them as separate families
> at all then? I wonder if the MCU/MPU distinction is always that
> clear along the Cortex-M/Cortex-A separation, especially if
> we ever get to a chip that has both types of cores. What
> exactly would we miss if we do away with the ARCH_STM32_MCU
> symbol here?
This patch series extends the existing STM32 microcontrollers (MCUs)
family to microprocessors (MPUs). Now, ARCH_STM32 groups STM32 chips 
with Cortex-M or Cortex-A cores. But each core has different 
infrastructure mpu vs mmu; nvic vs gic; systick vs arch_timer ...
So, ARCH_STM32_MCU/ARCH_STM32_MPU allow to define these specific blocks.

br
Ludo
> 
>> So yesterdays application processors are todays MCU processors.
>>
>> I said this on a lecture for control systems a while back and
>> stated it as a reason I think RTOSes are not really seeing a bright
>> future compared to Linux.
>>
>> It happened quicker than I thought though, interesting.
> 
> I think there is still lots of room for smaller RTOS in the long run,
> but it's likely that the 'MPU + external DRAM' design point will
> shift further to Linux, as there isn't really a benefit in squeezing
> in anything smaller when the minimum is 32MB or 128MB of
> RAM, depending on the interface.
> 
> For on-chip eDRAM or SRAM based MPUs, that doesn't hold
> true, the memory size is what drives the cost here.
> 
>          Arnd
> 

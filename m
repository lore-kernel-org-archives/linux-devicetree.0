From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH v2 0/6] STM32F4 Add RTC & QSPI clocks
Date: Wed, 19 Oct 2016 10:34:38 +0200
Message-ID: <d878b846-556d-180b-8ebf-2d06646efb58@st.com>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
 <20161018235108.GP8871@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161018235108.GP8871@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, daniel.thompson@linaro.org, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, Michael Turquette <mturquette@baylibre.com>, olivier.bideau@st.com, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, ludovic.barre@st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, amelie.delaunay@st.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,


On 10/19/2016 01:51 AM, Stephen Boyd wrote:
> On 10/14, gabriel.fernandez@st.com wrote:
>> Gabriel Fernandez (6):
>>    clk: stm32f4: Add LSI & LSE clocks
>>    ARM: dts: stm32f429: add LSI and LSE clocks
>>    arm: stmf32: Enable SYSCON
>>    clk: stm32f4: Add RTC clock
>>    clk: stm32f469: Add QSPI clock
>>    ARM: dts: stm32f429: Add QSPI clock
> Can the clk patches be picked without causing problems for
> existing dt changes? Do you want an ack from clk maintainers
> instead of us picking the clk patches up? The series has
> intermingled clk and dts changes so I'm confused.
>

Thanks for reviewing.

Normally DT patches will be taken by STM32 maintainer, but yes there is 
a dependency between patch 1 & 2, so if you push the patch 1 into 
clk-next tree you have to take also patch 2.

You have to be synchronized with Alexandre Torgue.

Best Regards

Gabriel

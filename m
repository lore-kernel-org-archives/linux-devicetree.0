From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v4 1/9] clk: stm32f4: Update DT bindings documentation
Date: Mon, 9 Jan 2017 17:28:56 +0100
Message-ID: <ccd14adb-9d10-ae9e-de6d-565418421968@st.com>
References: <1481638820-29324-1-git-send-email-gabriel.fernandez@st.com>
 <1481638820-29324-2-git-send-email-gabriel.fernandez@st.com>
 <20161222001051.GP8288@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161222001051.GP8288@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, "radoslaw.pietrzyk@gmail.com" <radoslaw.pietrzyk@gmail.com>, "kernel@stlinux.com" <kernel@stlinux.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, "andrea.merello@gmail.com" <andrea.merello@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Olivier BIDEAU <olivier.bideau@st.com>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Ludovic BARRE <ludovic.barre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Amelie DELAUNAY <amelie.delaunay@st.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 12/22/2016 01:10 AM, Stephen Boyd wrote:
> On 12/13, gabriel.fernandez@st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> Creation of dt include file for specific stm32f4 clocks.
>> These specific clocks are not derived from system clock (SYSCLOCK)
>> We should use index 1 to use these clocks in DT.
>> e.g. <&rcc 1 CLK_LSI>
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>
> Applied to clk-stm32f4 and merged into clk-next.
>

I'm preparing pull request branch for STM32 DT part. This patch is also 
requested to build correctly DT patches. Do you know how could we 
synchronize our pull request ?

Thanks
Alex

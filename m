From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH v2] clk: stm32h7: Add stm32h743 clock driver
Date: Tue, 4 Apr 2017 08:33:10 +0200
Message-ID: <4cc836cb-33fe-1a6d-2bbb-f8ad4d0e4ce7@st.com>
References: <1490778502-23651-1-git-send-email-gabriel.fernandez@st.com>
 <20170403143958.gi7vyhianzetnxz2@rob-hp-laptop>
 <CAL_JsqJYu+4puvB-WhaLVtjHASVOdY0acM2OxxMpZOvG9MAziQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJYu+4puvB-WhaLVtjHASVOdY0acM2OxxMpZOvG9MAziQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, =?UTF-8?Q?Rados=c5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, Andrea Merello <andrea.merello@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Olivier Bideau <olivier.bideau@st.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ludovic Barre <ludovic.barre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Amelie Delaunay <amelie.delaunay@st.com>, Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 04/03/2017 06:04 PM, Rob Herring wrote:
> On Mon, Apr 3, 2017 at 9:39 AM, Rob Herring <robh@kernel.org> wrote:
>> On Wed, Mar 29, 2017 at 11:08:22AM +0200, gabriel.fernandez@st.com wrote:
>>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>>
>>> This patch enables clocks for STM32H743 boards.
>>>
>>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>>>
>>> Just for the MFD changes:
>>> Acked-by: Lee Jones <lee.jones@linaro.org>
>>>
>>> +Required properties for pll node:
>>> +- compatible: Should be:
>>> +  "stm32h7-pll"
>> stm,stm32h7-pll
> Err, I meant st,stm32h7-pll.
Oops, sorry i will fix it.

Thank's

Gabriel
>> With that,
>>
>> Acked-by: Rob Herring <robh@kernel.org>

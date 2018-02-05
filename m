From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: Re: [PATCH 02/14] dt-bindings: clock: add STM32MP1 clocks
Date: Mon, 5 Feb 2018 07:02:24 +0000
Message-ID: <ec89b70e-1500-df15-639c-59165fb2014b@st.com>
References: <1517580222-23301-1-git-send-email-gabriel.fernandez@st.com>
 <1517580222-23301-3-git-send-email-gabriel.fernandez@st.com>
 <20180205042348.2f7ssmzkajeky5l7@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180205042348.2f7ssmzkajeky5l7@rob-hp-laptop>
Content-Language: en-US
Content-ID: <2FE57713DFCCF143B32B19D42387C69F@st.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Olivier BIDEAU <olivier.bideau@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gabriel.fernandez.st@gmail.com" <gabriel.fernandez.st@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 02/05/2018 07:09 AM, Rob Herring wrote:
> On Fri, Feb 02, 2018 at 03:03:30PM +0100, gabriel.fernandez@st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> This patch adds the clock binding entry for STM32MP1
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>> ---
>>   include/dt-bindings/clock/stm32mp1-clks.h | 248 ++++++++++++++++++++++++++++++
>>   1 file changed, 248 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/stm32mp1-clks.h
> You can squash this into the previous patch.
Ok Thanks!

BR
Gabriel

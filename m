From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: Document STM32MP1 Reset Clock
 Controller (RCC) bindings
Date: Mon, 12 Mar 2018 09:06:11 +0000
Message-ID: <7d552f25-a7b8-c99a-8f28-eb9beb455724@st.com>
References: <1520528045-18330-1-git-send-email-gabriel.fernandez@st.com>
 <1520528045-18330-2-git-send-email-gabriel.fernandez@st.com>
 <20180309235356.qd2wx6teeuxkwwjz@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180309235356.qd2wx6teeuxkwwjz@rob-hp-laptop>
Content-Language: en-US
Content-ID: <8D139A43B588564B91C9154FD6C33D94@st.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Loic PALLARDY <loic.pallardy@st.com>, Olivier BIDEAU <olivier.bideau@st.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gabriel.fernandez.st@gmail.com" <gabriel.fernandez.st@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Thanks Rob !

Best Regards

Gabriel


On 03/10/2018 12:53 AM, Rob Herring wrote:
> On Thu, Mar 08, 2018 at 05:53:54PM +0100, gabriel.fernandez@st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> The RCC block is responsible of the management of the clock and reset
>> generation for the complete circuit.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>> ---
>>   .../devicetree/bindings/clock/st,stm32mp1-rcc.txt  | 60 ++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.txt
> Reviewed-by: Rob Herring <robh@kernel.org>

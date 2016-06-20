From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [RESEND PATCH v2 02/13] drivers: clk: st: Simplify clock binding
 of STiH4xx platforms
Date: Mon, 20 Jun 2016 09:29:18 +0200
Message-ID: <CAG374jD+qChVC+6QJEHSXSzXGVVtAxvZ3V6zNpQDUyuJ2yCjMw@mail.gmail.com>
References: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
 <1466068833-5055-3-git-send-email-gabriel.fernandez@linaro.org> <20160619150458.GA26824@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160619150458.GA26824@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>linux-clk <l>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 19 June 2016 at 17:04, Rob Herring <robh@kernel.org> wrote:
> On Thu, Jun 16, 2016 at 11:20:22AM +0200, Gabriel Fernandez wrote:
>> This patch reworks the clock binding to avoid too much detail in DT.
>> Now we have only compatible string per type of clock
>> (remark from Rob https://lkml.org/lkml/2016/5/25/492)
>>
>
> I have no idea what the clock trees and clock controller in these chips
> look like, so it's hard to say if the changes here are good. It still
> looks like things are somewhat fine grained clocks in DT. I'll leave
> it up to the platform maintainers to decide...
>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>> ---
>>  .../devicetree/bindings/clock/st/st,clkgen-mux.txt |  2 +-
>>  .../devicetree/bindings/clock/st/st,clkgen-pll.txt | 11 ++--
>>  .../devicetree/bindings/clock/st/st,clkgen.txt     |  2 +-
>>  .../devicetree/bindings/clock/st/st,quadfs.txt     |  6 +--
>>  drivers/clk/st/clkgen-fsyn.c                       | 41 ++++++--------
>>  drivers/clk/st/clkgen-mux.c                        | 28 ++++------
>>  drivers/clk/st/clkgen-pll.c                        | 62 ++++++++++------------
>>  7 files changed, 65 insertions(+), 87 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
>> index 4d277d6..9a46cb1d7 100644
>> --- a/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
>> +++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
>> @@ -10,7 +10,7 @@ This binding uses the common clock binding[1].
>>  Required properties:
>>
>>  - compatible : shall be:
>> -     "st,stih407-clkgen-a9-mux",     "st,clkgen-mux"
>> +     "st,stih407-clkgen-a9-mux"
>>
>>  - #clock-cells : from common clock binding; shall be set to 0.
>>
>> diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
>> index c9fd674..be0b043 100644
>> --- a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
>> +++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
>> @@ -9,11 +9,10 @@ Base address is located to the parent node. See clock binding[2]
>>  Required properties:
>>
>>  - compatible : shall be:
>> -     "st,stih407-plls-c32-a0",       "st,clkgen-plls-c32"
>> -     "st,stih407-plls-c32-a9",       "st,clkgen-plls-c32"
>> -     "sst,plls-c32-cx_0",            "st,clkgen-plls-c32"
>> -     "sst,plls-c32-cx_1",            "st,clkgen-plls-c32"
>> -     "st,stih418-plls-c28-a9",       "st,clkgen-plls-c32"
>
>> +     "st,clkgen-pll0"
>> +     "st,clkgen-pll0"
>
> Repeated. Supposed to be 0 and 1? This seems a bit generic, too.
Yes you are right, it's 0 and 1.
I wait remarks from Mike or Stephen before send a V3.

Thanks Rob

BR
Gabriel

>
>> +     "st,stih407-clkgen-plla9"
>> +     "st,stih418-clkgen-plla9"

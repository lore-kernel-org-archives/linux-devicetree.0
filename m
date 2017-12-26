From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCHv2 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Tue, 26 Dec 2017 17:01:04 -0600
Message-ID: <CAL_Jsq+LF1EEg+jHWN_B=Y=_RDwJWwooyj38EjEaaPxL8-2vGA@mail.gmail.com>
References: <1513098873-20977-1-git-send-email-jassisinghbrar@gmail.com>
 <1513098921-21042-1-git-send-email-jassisinghbrar@gmail.com>
 <20171212172919.ezd54qqcyk6fh5kq@lakrids.cambridge.arm.com> <CABb+yY20nLJw5m4tq6Zrrqh7SGCWsFKsjzuK6oDFgvD6qS4nrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CABb+yY20nLJw5m4tq6Zrrqh7SGCWsFKsjzuK6oDFgvD6qS4nrg@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 20, 2017 at 2:02 AM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> Hi Mark,
>
> On Tue, Dec 12, 2017 at 10:59 PM, Mark Rutland <mark.rutland@arm.com> wrote:
>> Hi,
>>
>> On Tue, Dec 12, 2017 at 10:45:21PM +0530, jassisinghbrar@gmail.com wrote:
>>> From: Jassi Brar <jassisinghbrar@gmail.com>
>>>
>>> This patch adds documentation for Device-Tree bindings for the
>>> Socionext NetSec Controller driver.
>>>
>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
>>> ---
>>>  .../devicetree/bindings/net/socionext-netsec.txt   | 43 ++++++++++++++++++++++
>>>  1 file changed, 43 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
>>> new file mode 100644
>>> index 0000000..4695969
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
>>> @@ -0,0 +1,45 @@
>>> +* Socionext NetSec Ethernet Controller IP
>>> +
>>> +Required properties:
>>> +- compatible: Should be "socionext,synquacer-netsec"
>>> +- reg: Address and length of the control register area, followed by the
>>> +       address and length of the EEPROM holding the MAC address and
>>> +       microengine firmware
>>> +- interrupts: Should contain ethernet controller interrupt
>>> +- clocks: phandle to the PHY reference clock, and any other clocks to be
>>> +          switched by runtime_pm

runtime_pm is a Linux thing and driver detail.

>>> +- clock-names: Required only if more than a single clock is listed in 'clocks'.
>>> +               The PHY reference clock must be named 'phy_refclk'
>>
>> Please define the full set of clocks (and their names) explicitly. This
>> should be well-known.
>>
> The issue is some implementations have just the 'rate-reference' clock
> going in, while others may also have 1or2 optional 'enable' clocks
> (which may go to other devices as well).
> The driver only needs to know which clock to read the freq from, so it
> expects that clock to be named 'phy_refclk', while the 'enable' clocks
> can be named anything.

It still needs to be documented.

If there's differing number of clocks, then I expect a compatible
string for each possible clock setup. Of course, differing number of
clocks for the same block is often an error when multiple clock inputs
are driven by the same source clock.

Rob

From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCHv5 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Fri, 5 Jan 2018 22:11:30 +0530
Message-ID: <CABb+yY1RPQFtmc7amcN++xhVhVOqBizK1NXehuVKpughq2Tvfg@mail.gmail.com>
References: <1514783559-4226-1-git-send-email-jassisinghbrar@gmail.com>
 <1514783660-4290-1-git-send-email-jassisinghbrar@gmail.com> <CAKv+Gu9Pk_WEOrWZdVK5ty9GaDm4ApvGeksu_6W5DcF0-SOUuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAKv+Gu9Pk_WEOrWZdVK5ty9GaDm4ApvGeksu_6W5DcF0-SOUuA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Ard,

On Thu, Jan 4, 2018 at 3:07 AM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> Hi Jassi,
>
> On 1 January 2018 at 05:14,  <jassisinghbrar@gmail.com> wrote:
>> From: Jassi Brar <jassisinghbrar@gmail.com>
>>
>> This patch adds documentation for Device-Tree bindings for the
>> Socionext NetSec Controller driver.
>>
>> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>> ---
>>  .../devicetree/bindings/net/socionext-netsec.txt   | 53 ++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
>> new file mode 100644
>> index 0000000..b70e35b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
>> @@ -0,0 +1,53 @@
>> +* Socionext NetSec Ethernet Controller IP
>> +
>> +Required properties:
>> +- compatible: Should be "socionext,synquacer-netsec"
>> +- reg: Address and length of the control register area, followed by the
>> +       address and length of the EEPROM holding the MAC address and
>> +       microengine firmware
>> +- interrupts: Should contain ethernet controller interrupt
>> +- clocks: phandle to the PHY reference clock
>> +- clock-names: Should be "phy_ref_clk"
>
> If clock-names is mandatory now even when only a single clock is
> specified,
>
I know. Usually I follow maintainer's opinion unless I see myself
losing sleep doing that.

> you should add it to the example as well.
>
Done. Thanks

> However, please
> be aware that hardware has shipped now with DT images that specify a
> only a single clock and no clock-names property: those will require a
> firmware upgrade before they can use this version of the driver.
>
Ok, for now I have dared ignore clock-names in driver.... until we
have to support again instance that take in more than one clock.

Thanks.

From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: Add binding for RAVE SP EEPROM driver
Date: Tue, 10 Apr 2018 17:12:40 -0700
Message-ID: <CAHQ1cqFegg3K6rQ6m0KC1Ns_bL+CMv1gSUne8bKDuirA-dw1ow@mail.gmail.com>
References: <20180321134710.29757-1-andrew.smirnov@gmail.com>
 <20180321134710.29757-2-andrew.smirnov@gmail.com> <20180326222424.7vr2gmwwezqhiy6m@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180326222424.7vr2gmwwezqhiy6m@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Aleksander Morgado <aleksander@aleksander.es>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 26, 2018 at 3:24 PM, Rob Herring <robh@kernel.org> wrote:
> On Wed, Mar 21, 2018 at 06:47:09AM -0700, Andrey Smirnov wrote:
>> Add Device Tree bindings for RAVE SP EEPROM driver - an MFD cell of
>> parent RAVE SP driver (documented in
>> Documentation/devicetree/bindings/mfd/zii,rave-sp.txt).
>
> I'd prefer to get all the child nodes at once rather than as you
> upstream the drivers. IOW, please completely describe the device. Then I
> may have opinions on whether you need these child nodes or not.
>

OK, I currently don't have any other child drivers that can be
submitted (no code or bindings exist) that haven't already been
submitted/accepted. However I'll make sure to bundle all of the
remaining bindings in a single set and send it for review once I
finish them.

>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Chris Healy <cphealy@gmail.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Aleksander Morgado <aleksander@aleksander.es>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 23 ++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
>> new file mode 100644
>> index 000000000000..556abfa70524
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
>> @@ -0,0 +1,23 @@
>> +Zodiac Inflight Innovations RAVE EEPROM Bindings
>> +
>> +RAVE SP EEPROM device is a "MFD cell" device exposing physical EEPROM
>> +attached to RAVE Supervisory Processor. It is expected that its Device
>> +Tree node is specified as a child of the node corresponding to the
>> +parent RAVE SP device (as documented in
>> +Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
>> +
>> +Required properties:
>> +
>> +- compatible: Should be "zii,rave-sp-eeprom"
>> +
>> +Example:
>> +
>> +     rave-sp {
>> +             compatible = "zii,rave-sp-rdu1";
>> +             current-speed = <38400>;
>> +
>> +             dds-eeprom {
>> +                     compatible = "zii,rave-sp-eeprom";
>> +                     reg = <0xA3 0x2000>;
>
> Child nodes? #nvmem-cells? I assume you have some data in this you need.
> If not, you don't really need a child node here.
>

Yes, good point. Sorry about that, I should've included a better
example. Will fix in v2.

Thanks,
Andrey Smirnov

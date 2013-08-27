From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V4] gpio: New driver for LSI ZEVIO SoCs
Date: Tue, 27 Aug 2013 14:11:14 -0600
Message-ID: <521D07E2.80209@wwwdotorg.org>
References: <1377460180-6192-1-git-send-email-fabian@ritter-vogt.de> <20130827144043.GN19893@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130827144043.GN19893@e106331-lin.cambridge.arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Fabian Vogt <fabian@ritter-vogt.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On 08/27/2013 08:40 AM, Mark Rutland wrote:
> On Sun, Aug 25, 2013 at 08:49:40PM +0100, Fabian Vogt wrote:
>> This driver supports the GPIO controller found in LSI ZEVIO SoCs.
>> It has been successfully tested on a TI nspire CX calculator.
>> ---
>>  .../devicetree/bindings/gpio/gpio-zevio.txt        |  18 ++
>>  drivers/gpio/Kconfig                               |   6 +
>>  drivers/gpio/Makefile                              |   1 +
>>  drivers/gpio/gpio-zevio.c                          | 214 +++++++++++++++++++++
>>  4 files changed, 239 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
>>  create mode 100644 drivers/gpio/gpio-zevio.c
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
>> new file mode 100644
>> index 0000000..892f953
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
>> @@ -0,0 +1,18 @@
>> +Zevio GPIO controller
>> +
>> +Required properties:
>> +- compatible = "lsi,zevio-gpio"
>> +- reg = <BASEADDR SIZE>
>> +- #gpio-cells = <2>
>> +- gpio-controller;
> 
> I take it there's nothing else known about at present that we might want
> to describe in future (e.g. input clocks)?
> 
> This is more for the other dt maintainers, but I've seen a lot of
> variation in how we describe properties, and it would be nice to unify
> that. Does anyone fancy writing a document pushing for some standard
> terminology and formatting, or should I?

I was hoping that the DT schema system would tighten this up, since
there would be specific syntax in the schema to describe all these options.

I was thinking of writing a DT binding review checklist, but so far
haven't made time to do so. It'd probably be reasonable to include any
specific wording requirements for property descriptions in that document.

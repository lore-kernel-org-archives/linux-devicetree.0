From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/5] drivers/amba: create devices from device tree
Date: Thu, 23 Jun 2011 14:55:06 -0600
Message-ID: <BANLkTi=x0rPAg--t+_eP-JJ2uPEYgwPPLw@mail.gmail.com>
References: <20110621181127.18176.1384.stgit@ponder> <20110621184503.18176.88260.stgit@ponder>
 <4E00F9ED.1020500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E00F9ED.1020500@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21, 2011 at 2:07 PM, Rob Herring <robherring2@gmail.com> wr=
ote:
> Grant,
>
> On 06/21/2011 01:45 PM, Grant Likely wrote:
>> Add a function to create amba_devices (i.e. primecell peripherals)
>> from device tree nodes. The device tree scanning is done by the
>> of_platform_populate() function which can call of_amba_device_create
>> based on a match table entry.
>>
>> Nodes with a "arm,primecell-periphid" property can override the h/w
>> peripheral id value.
>>
>> Based on the original work by Jeremy Kerr.
>>
>> Signed-off-by: Jeremy Kerr <jeremy.kerr@canonical.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>> [grant.likely: add Jeremy's original s-o-b line, changes from review
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0comments, and moved all code to drive=
rs/of/platform.c]
>> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>> ---
>> =A0.../devicetree/bindings/arm/primecell.txt =A0 =A0 =A0 =A0 =A0| =A0=
 21 ++++++
>> =A0drivers/of/platform.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 71 ++++++++++++++++++++
>> =A02 files changed, 92 insertions(+), 0 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/arm/primecel=
l.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/primecell.txt b/D=
ocumentation/devicetree/bindings/arm/primecell.txt
>> new file mode 100644
>> index 0000000..1d5d7a8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/primecell.txt
>> @@ -0,0 +1,21 @@
>> +* ARM Primecell Peripherals
>> +
>> +ARM, Ltd. Primecell peripherals have a standard id register that ca=
n be used to
>> +identify the peripheral type, vendor, and revision. This value can =
be used for
>> +driver matching.
>> +
>> +Required properties:
>> +
>> +- compatible : should be a specific value for peripheral and "arm,p=
rimecell"
>
> Can I review what I wrote... Perhaps we should put strings in for all
> existing drivers in the kernel. This should be a complete list:
>
> arm,pl010
> arm,pl011
> st,pl011
> arm,pl022
> st,pl022
> st,pl023
> arm,pl030
> arm,pl031
> st,pl031
> arm,pl061
> arm,pl050
> arm,pl080
> arm,pl081
> st,pl080
> arm,pl110
> arm,pl180
> arm,pl330
> arm,sp804
> arm,sp805


Yes, this whole list should be added.

g.

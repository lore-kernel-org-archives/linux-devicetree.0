From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
Date: Wed, 13 Feb 2019 16:22:14 +0100
Message-ID: <86sgwrsogp.fsf@baylibre.com>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com> <1547744074-28308-3-git-send-email-lollivier@baylibre.com> <20190125090755.GB3691@localhost> <867eeo7pjm.fsf@baylibre.com> <20190211083349.GU4686@localhost> <86mun2v27r.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <86mun2v27r.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org


On Mon 11 Feb 2019 at 14:17, Loys Ollivier <lollivier@baylibre.com> wrote:

> On Mon 11 Feb 2019 at 08:33, Johan Hovold <johan@kernel.org> wrote:
>
>> On Mon, Jan 28, 2019 at 04:46:53PM +0100, Loys Ollivier wrote:
>>> 
>>> On Fri 25 Jan 2019 at 09:07, Johan Hovold wrote:
>>> 
>>> > On Thu, Jan 17, 2019 at 05:54:32PM +0100, Loys Ollivier wrote:
    >>> >> +Required properties (I2C):
>>> >> +- reg		: I2C slave address
>>> >> +
>>> >> +Required properties (SPI):
>>> >> +- reg		: SPI chip select address
>>> >
>>> > While the mt3339 appears to support these interfaces, the globaltop one
>>> > does not.
>>> >
>>> > Have you looked around for a small sample of mt3339-based receivers, to
>>> > see whether anyone actually provides these?
>>> 
>>> Again I'm confused by the fact that it is the Mediatek bindings.
>>> Hence why I have added it and why it was not present in the v1 that was
>>> only for Globaltop.
>>
>> This is no different from the sirfstar driver for receivers based on
>> those chipsets but manufactured by various other vendors.
>>
> Indeed.
>
>>> I find it odd mentionning the chipset but not all its interfaces.
>>> I will remove these sections and only list supported interfaces (i.e.
>>> UART). Other interfaces can be added afterward if one finds a board that
>>> provides them.
>>
>> Right, but please do look around for other receivers using this chipset
>> so that we can make the binding generic enough to cover those as well
>> (e.g. by choosing representative resource names).
>>
> OK will have a look.

The only mt3339-based receivers I have found are:
- [0] Globaltop
- [1] Locosys / Pololu
They both only provide the UART interface and do not list the I2C/SPI
interfaces.

[0] https://cdn-shop.adafruit.com/datasheets/GlobalTop-FGPMMOPA6H-Datasheet-V0A.pdf
[1] https://www.pololu.com/file/0J641/LS20030~3_datasheet_v1.3.pdf

Loys
>
>> Johan


-- 
-L

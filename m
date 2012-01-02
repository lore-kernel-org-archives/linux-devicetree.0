From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv3 1/3] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Mon, 2 Jan 2012 14:48:40 +0100
Message-ID: <CACRpkdYxjVG2XVb5iXPmVe5uTcpemBkOA-=AcuyNx-9cWPpaiA@mail.gmail.com>
References: <1325508798-25439-1-git-send-email-jamie@jamieiles.com>
	<1325508798-25439-2-git-send-email-jamie@jamieiles.com>
	<20120102132500.GB18443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120102132500.GB18443@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com
List-Id: devicetree@vger.kernel.org

On Mon, Jan 2, 2012 at 2:25 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:

> On Mon, Jan 02, 2012 at 12:53:16PM +0000, Jamie Iles wrote:
>> The Synopsys DesignWare block is used in some ARM devices (picoxcell=
)
>> and can be configured to provide multiple banks of GPIO pins.
>>
>> v3: =A0 - depend on rather than select IRQ_DOMAIN
>> =A0 =A0 =A0 - split IRQ support into a separate patch
>> v2: =A0 - use Rob Herring's irqdomain in generic irq chip patches
>> =A0 =A0 =A0 - use reg property to indicate bank index
>> =A0 =A0 =A0 - support irqs on both edges based on LinusW's u300 driv=
er
>
> Put stuff like this after the ---, it shouldn't end up in git history=
=2E

The other day I was being told the exact opposite by Grant
Likely, so which one is it?

This was however for a totally new driver.

I think Grants request made sense since the gitlog should
contain the changelog and the more the better, but what do I
know.

Yours,
Linus Walleij

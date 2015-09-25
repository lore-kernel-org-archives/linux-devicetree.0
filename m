From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] gpio:pca953x: add mechanism to simulate open drain outputs
Date: Fri, 25 Sep 2015 07:54:36 +0200
Message-ID: <477D98CD-B014-41AE-9A78-22D632205D14@goldelico.com>
References: <cover.1443031678.git.hns@goldelico.com> <1B9C7F91-0025-4C1D-95AD-FD5A4B0B4176@goldelico.com> <CACRpkdYYGn71Z_pgtBpk5nwknDZ1VyRam9Fj=JDkNyt4KCWFmQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYYGn71Z_pgtBpk5nwknDZ1VyRam9Fj=JDkNyt4KCWFmQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, eric miao <eric.miao@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marek Belisko <marek@goldelico.com>, Grazvydas Ignotas <notaz@openpandora.org>
List-Id: devicetree@vger.kernel.org


Am 25.09.2015 um 00:11 schrieb Linus Walleij <linus.walleij@linaro.org>:

> On Wed, Sep 23, 2015 at 11:13 AM, H. Nikolaus Schaller
> <hns@goldelico.com> wrote:
> 
>> 1. add a DT property to specify the list of GPIO pins that are to become
>>   "open drain"
>> 2. if a pin is configured as "open drain", set value by either outputting a
>>   "0" (low level) or switching to input (high impedance)
>> 
>> Tested on OMAP5 uEVM with TCA6424 and some LEDs connected to 5V.
>> 
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> 
> I understand the approach, but this is the wrong way to do it.
> Instead of indicating that a pin on the pin controller should be
> open drain, the *consumer* specifying its gpios = <....> should
> do this.
> 
> I just sent a patch adding the bindings because Tony Lindgren
> and Grygorii Strashko approached me similar problems so let's
> begin with the bindings.
> 
> Implementing it in the kernel requires some elaboration and it's
> going to be more complicated than this local approach, but it
> will be more generic and reusable so that is what we need to do.

Ok, I understand.

Should not be too difficult to modify the driver.

BR,
Nikolaus Schaller



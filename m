From: Sherman Yin <syin@broadcom.com>
Subject: Re: [PATCH v4 3/4] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Mon, 20 Jan 2014 11:14:57 -0800
Message-ID: <52DD75B1.3090701@broadcom.com>
References: <1386787041-6035-1-git-send-email-syin@broadcom.com>	<1387592016-13740-1-git-send-email-syin@broadcom.com>	<1387592016-13740-4-git-send-email-syin@broadcom.com>	<CACRpkdaPZrR=kEknr3YKDWLd_E+o22Yn19ei7iT6cdbYdbeZ2w@mail.gmail.com>	<52D98B99.5050604@broadcom.com>	<20140118025600.GS31049@beef> <CACRpkdYAANtY=9QtDnYNZLSrF09nTWUH4nK5oJ7mzznS+_=bHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYAANtY=9QtDnYNZLSrF09nTWUH4nK5oJ7mzznS+_=bHA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matt Porter <mporter@linaro.org>
Cc: "arm@kernel.org" <arm@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 14-01-20 12:16 AM, Linus Walleij wrote:
> On Sat, Jan 18, 2014 at 3:56 AM, Matt Porter <mporter@linaro.org> wrote:
>
>> I wonder if Linus would accept a rename at this point (too late for 3.14
>> presumably, but for 3.15) of s/capri/bcm281xx throughout, bcm11351 for
>> the compatible string, as we have for the machine compatible, and also
>> BCM281XX for the Kconfig option.
>
> Yes, if there is some consensus that this is what we want to do.
>
> I can certainly merge that during the 3.14-rc phase for that matter.

Hi Linus,

I'll confirm the new name with Matt before sending out another patch. 
Which would work better for you - a) a set of patches replacing my 
previous ones, b) a set of patches on top of my previous ones, c) a 
single patch on top of my previous ones? d) something else?

Thanks,
Sherman


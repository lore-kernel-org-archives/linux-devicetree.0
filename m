From: Christian Daudt <bcm@fixthebug.org>
Subject: Re: [PATCH v3 3/6] pinctrl: Make PINCTRL selectable by defconfig/menuconfig
Date: Thu, 12 Dec 2013 13:35:29 -0800
Message-ID: <CAEPRUYpsp_FVobY_DeEQU2+rCD7q7T=p7k++XvG-22x-OWHY8Q@mail.gmail.com>
References: <1381174108-25168-1-git-send-email-syin@broadcom.com>
	<1386787041-6035-1-git-send-email-syin@broadcom.com>
	<1386787041-6035-4-git-send-email-syin@broadcom.com>
	<CACRpkdauqYNiby-ta3c_he2ovG__0e6ubmzZ8Bx1cP_OzK4=LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdauqYNiby-ta3c_he2ovG__0e6ubmzZ8Bx1cP_OzK4=LQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sherman Yin <syin@broadcom.com>, Rob Herring <rob.herring@calxeda.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 12, 2013 at 12:39 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Dec 11, 2013 at 7:37 PM, Sherman Yin <syin@broadcom.com> wrote:
>
>> Adds a string to the PINCTRL config option so that 1) CONFIG_PINCTRL=y would
>> not be erased by make config, and 2) PINCTRL option would show up in menuconfig.
>>
>> Signed-off-by: Sherman Yin <syin@broadcom.com>
>> ---
>> v3: added to patchset
>
> NAK. The pin control subsystem has been designed so that
> you should select the pin controller through select statements
> from the SoC using it.
>
> This was requested at one time by Linus (Torvalds).
>
> You need to convince me that this is really needed.
>
> Yours,
> Linus Walleij
Hi Linus,
 I had requested this from Sherman. The reason is so that pinctrl can
be selectable through defconfig, instead of through SoC select
statements. And the reason for that is so that, in the future, some of
these can be switched into loadable modules (which can't be done from
Kconfig). This will become necessary with the move to multiplatform -
we won't be able to have everything static anymore.

 Thanks,
   csd

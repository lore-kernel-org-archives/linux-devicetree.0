From: Sherman Yin <syin@broadcom.com>
Subject: Re: [PATCH v3 3/6] pinctrl: Make PINCTRL selectable by defconfig/menuconfig
Date: Fri, 20 Dec 2013 18:15:25 -0800
Message-ID: <52B4F9BD.1010100@broadcom.com>
References: <1381174108-25168-1-git-send-email-syin@broadcom.com> <20131217001842.GB3840@sonymobile.com> <CACRpkdY-MM7OoMq_L90YRADy=oaDoV1wAOccVz90LqfRfEh=3Q@mail.gmail.com> <201312202158.34805.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201312202158.34805.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Christian Daudt <bcm@fixthebug.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Heiko St?bner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13-12-20 12:58 PM, Arnd Bergmann wrote:
> On Friday 20 December 2013, Linus Walleij wrote:
>> On Tue, Dec 17, 2013 at 1:18 AM, Bjorn Andersson
>> <bjorn.andersson@sonymobile.com> wrote:
>>
>>> No matter how we build the individual pinctrl drivers we will always
>>> need the pinctrl framework in a multi-soc zImage; so I can't see that
>>> we gain anything from being able to compile PINCTRL as a module.
>>
>> I discussed this matter with Christian on IRC and I believe we could
>> basically do "select PINCTRL" on ARCH_MULTIPLATFORM as the
>> vast majority of multiplatforms appear to be using this anyway, this
>> would make the submenu for pin control pop up in menuconfig
>> for this, and make it possible to move different subdrivers to modules
>> if desired.
>>
>> MULTIPLATFORM does not seem to be about saving footprint bytes
>> on a very fine-granular level anyway, more about doing the module
>> loading/unloading approach to footprint.
>
> Let's review the list of platforms that don't select PINCTRL. There
> are some platforms that are indeed sensitive about memory footprint,
> and I promised people that converting to multiplatform won't cause
> a significant increase in kernel binary size as long as no other
> platforms are enabled.
>
> 	Arnd
>

Ok, for this driver, I'll just select PINCTRL under the ARCH_BCM_MOBILE. 
  We can move this to ARCH_MULTIPLATFORM once we're sure this is okay 
for other platforms.

Regards,
Sherman

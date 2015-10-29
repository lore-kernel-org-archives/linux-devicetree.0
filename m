From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 07/11] pinctrl: use ngpios propety from DT
Date: Thu, 29 Oct 2015 15:47:19 +0100
Message-ID: <56323177.6010605@openwrt.org>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
 <1445233398-27129-8-git-send-email-pramodku@broadcom.com>
 <CACRpkdY1GDs6ypqCiY3iiv3DkfnHchnY+bWPoCqU=_sgn9f5vQ@mail.gmail.com>
 <0C803592FC378B4E83922050AB46442A2AD742F0@SJEXCHMB10.corp.ad.broadcom.com>
 <CACRpkdb3FT0K+atNOTXL_e8Fs7Nm0VDLe0RPiiBKK=8o=MHqKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb3FT0K+atNOTXL_e8Fs7Nm0VDLe0RPiiBKK=8o=MHqKQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Pramod Kumar <pramodku@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 29.10.2015 15:36, Linus Walleij wrote:
> On Wed, Oct 28, 2015 at 12:52 PM, Pramod Kumar <pramodku@broadcom.com> wrote:
> 
>> I discussed with ASIC team regarding this iProc GPIO block. They use a library to create the GPIOs block where "total number of GPIO pins( let say N) in GPIO block" is used as an parameter.
>> Library uses a construct for *a* GPIO pin. This gets instantiated N times to create a complete GPIO block with N pins.
>>
>> All iProc based SoCs uses this library. So I'm not sure whether attaching "total number of GPIOs pins" to compatible-string make sense in this case.
>> I personally feel that passing this number from the DT makes more sense here. Any iProc based future as well as current SoCs would be able to use this driver without any change.
>>
>> Please advise us in this case.
> 
> Hm! You make a good case.
> 
> But this contradicts the traditional use of ngpios.
> 
> But on the other hand:
> git grep ngpio Documentation/devicetree/bindings/gpio/
> 
> Gives at hand that the use of ngpio[s] is a complete mess.
> 
> :(
> 
> I will think about patching the standard bindings to fix this mess
> and include your case. Give me some time.

Using ngpios to restrict the amount of actually available GPIOs from
the possible amount of GPIOs seems a rather limited use, as rerouted
gpios are seldom at the end of the GPIO space.

So maybe it makes more sense to use ngpio as the number of
possible gpios and then have an additional "reserved-gpios"
bitmask / list of unavailable gpios?

Ideally those would be just consumed by a pinctrl instance, but I
guess that these are sometimes controlled through pinstrapping,
so there might be no driver to attach to them.

Regards
Jonas

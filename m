From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v6 7/8] ARM: dts: enable GPIO for Broadcom Cygnus
Date: Tue, 10 Mar 2015 09:38:51 -0700
Message-ID: <CAGVrzcZN0zUUb_zyrvijm3XBHAO+NqvrMpdptbn0oVyaShWqdw@mail.gmail.com>
References: <1425933902-20652-1-git-send-email-rjui@broadcom.com>
 <1425933902-20652-8-git-send-email-rjui@broadcom.com> <CACRpkdbx9h5t5QRLusnXqx31zD9W89dyvGDH4y6osK_6PeoChA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbx9h5t5QRLusnXqx31zD9W89dyvGDH4y6osK_6PeoChA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom>
List-Id: devicetree@vger.kernel.org

2015-03-10 3:21 GMT-07:00 Linus Walleij <linus.walleij@linaro.org>:
> On Mon, Mar 9, 2015 at 9:45 PM, Ray Jui <rjui@broadcom.com> wrote:
>
>> This enables all 3 GPIO controllers including the ASIU GPIO, the
>> chipcommonG GPIO, and the ALWAYS-ON GPIO, for Broadcom Cygnus SoC
>>
>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>> Tested-by: Dmitry Torokhov <dtor@chromium.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Pls take this through ARM SoC.

Applied to devicetree/next.
--
Florian

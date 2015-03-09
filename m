From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v5 5/8] pinctrl: Cygnus: define Broadcom Cygnus GPIO/PINCONF
 binding
Date: Mon, 9 Mar 2015 09:41:22 -0700
Message-ID: <54FDCD32.4080701@broadcom.com>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>	<1425515756-321-6-git-send-email-rjui@broadcom.com> <CACRpkdYy75-fH29W-pr5ExuQc6dfO1Xe5UtFr49GAdnVHyXuCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYy75-fH29W-pr5ExuQc6dfO1Xe5UtFr49GAdnVHyXuCg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>devic
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 3/9/2015 9:30 AM, Linus Walleij wrote:
> On Thu, Mar 5, 2015 at 1:35 AM, Ray Jui <rjui@broadcom.com> wrote:
> 
>> Document the GPIO/PINCONF device tree binding for Broadcom Cygnus SoC
>>
>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> (...)
> 
>> +- ngpios:
>> +    Total number of GPIOs the controller provides
> 
> Remind me again. Why don't we know this from the compatible string?

Is hard coding the number of GPIO pins in the driver based on compatible
string the preferred approach? If so, I can make the change. Note the
current driver only has one compatible string "brcm,cygnus-gpio." To do
this, I need to introduce 3 compatible strings "brcm,cygnus-asiu-gpio",
"brcm,cygnus-ccm-gpio", "brcm,cygnus-aon-gpio", and assign hard coded
ngpios to each of them during probe.

> 
> (I paused applying the patches here waiting for the answer.)
> 
> Yours,
> Linus Walleij
> 

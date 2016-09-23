From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/7] pinctrl: bcm2835: add pull defines to dt bindings
Date: Fri, 23 Sep 2016 10:53:34 +0200
Message-ID: <CACRpkdZ9NmFGtGcT_KfoLLUqoLic7i9_ao7cw8JgSnq2o0VvnQ@mail.gmail.com>
References: <1474274603-24215-1-git-send-email-kraxel@redhat.com>
 <1474274603-24215-2-git-send-email-kraxel@redhat.com> <87zin49p9m.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <87zin49p9m.fsf@eliezer.anholt.net>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: Gerd Hoffmann <kraxel@redhat.com>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Warren <swarren@wwwdotorg.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2016 at 12:07 PM, Eric Anholt <eric@anholt.net> wrote:
> Gerd Hoffmann <kraxel@redhat.com> writes:
>
>> Also delete (unused) private enum from driver.
>> The pull defines can be used instead if needed.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>
> Acked-by: Eric Anholt <eric@anholt.net>
>
> gpio maintainers, could I pull this through my dt tree?  Or does this
> need to be split in two?

You can take it. The bcm2835 driver is not seeing any conflicting
changes in this merge window.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] [media] rc: pwm-ir-tx: add new driver
Date: Mon, 10 Jul 2017 10:12:25 -0500
Message-ID: <CAL_JsqJxiGh2A1ApLA364vo5CJGkW+r7mrXPcZBGZ1KuXi4HHw@mail.gmail.com>
References: <cover.1498992850.git.sean@mess.org> <88fa0219db3388fad7bcc7b20cf30dd41e763aee.1498992850.git.sean@mess.org>
 <20170707135928.6cs6vx7z6lj3birp@rob-hp-laptop> <20170707161524.GA11857@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170707161524.GA11857@amd>
Sender: linux-media-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sean Young <sean@mess.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Timo Kokkonen <timo.t.kokkonen@iki.fi>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 7, 2017 at 11:15 AM, Pavel Machek <pavel@ucw.cz> wrote:
> On Fri 2017-07-07 08:59:28, Rob Herring wrote:
>> On Sun, Jul 02, 2017 at 12:06:13PM +0100, Sean Young wrote:
>> > This is new driver which uses pwm, so it is more power-efficient
>> > than the bit banging gpio-ir-tx driver.
>> >
>> > Signed-off-by: Sean Young <sean@mess.org>
>> > ---
>> >  .../devicetree/bindings/leds/irled/pwm-ir-tx.txt   |  13 ++
>>
>> Please make this a separate patch.
>
> Come on... The driver is trivial, and you even quoted the binding
> below. Saying "Acked-by:" would not have been that much additional
> work...

True, and I don't always ask for it especially when there is no other
comment. However, the gpio-ir-tx patch needs other changes anyway.

Rob

From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: Re: [PATCH 1/2] gpiolib: add gpio_export_with_name
Date: Thu, 30 May 2013 22:38:37 +0200
Message-ID: <51A7B8CD.4080702@epfl.ch>
References: <20121121101259.GQ4398@game.jcrosoft.org>
 <1353492849-29397-1-git-send-email-plagnioj@jcrosoft.com>
 <20121126135911.2F1D33E187C@localhost> <51A719A5.50906@epfl.ch>
 <CACRpkdb9F+wJ0hkNqPTP34r3JAEp2s07Q8U24fD6oCdj7MqCFA@mail.gmail.com>
Reply-To: florian.vaussard-p8DiymsW2f8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdb9F+wJ0hkNqPTP34r3JAEp2s07Q8U24fD6oCdj7MqCFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Linus,

On 05/30/2013 10:03 PM, Linus Walleij wrote:
> On Thu, May 30, 2013 at 11:19 AM, Florian Vaussard
> <florian.vaussard-p8DiymsW2f8@public.gmane.org> wrote:
>
>> Even if work is progressing towards
>> having gpio-controlled reset pins [1], some boards still need GPIOs to
>> be exported to userspace for other functionalities.
>
> Which are these?
>

Sorry, I should have been more precise.

> When I have inquired I have heard all kind of horrible things:
>
> - Userspace replicating drivers/leds/leds-gpio.c to
>    turn on/off and even PWM (!) LEDs from userspace, when we have
>    a standard sysfs interface for LEDs.
>
> - Userspace replicating drivers/input/keyboard/gpio_keys[_polled].c
>    to "just read this one button" instead of going through the
>    Linux input subsystem like everyone else.
>
> - Userspace replicating drivers/regulator/gpio-regulator.c
>    to "turn on just this one voltage source".
>
> All invalid reasons for using the sysfs ABI and trying to do the
> kernels work. All creating horrs for users and developers who now
> have to stash everything were trying to stach into the device tree
> (the above is all perfectly expressed with DT nodes) into their
> userspace app and then requiring their users to match a certain
> app to a certain board.
>

100% agree with you.

> The only examples I've really come to accept considers using
> things like relays and switches on factory lines where the meaning
> (semantics) of the GPIOs can only be properly understood from the
> GUI in the userspace APP running that factory line. Or robotics.
> In both cases presumably RT processes.
>

Indeed, I work in a robotics lab :-) One of our board (mach-imx/
mx31moboard*.c) controls for example the multiplexing of two cameras
sharing the same acquisition bus (I know, a bit hackish).
I developed a similar board with an OMAP3. Such control do not
fit well in the above-mentioned cases, but we do not need RT processes.

Best regards,

Florian

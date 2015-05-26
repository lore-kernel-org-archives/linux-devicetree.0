From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v8 14/16] ARM: dts: Introduce STM32F429 MCU
Date: Tue, 26 May 2015 11:25:46 +0200
Message-ID: <CALszF6Dvbu8sKGvtOYKMPKWo+Z6+8927mfmLR=CDBJPPR300wg@mail.gmail.com>
References: <1431158038-3813-1-git-send-email-mcoquelin.stm32@gmail.com>
 <2282066.NWoIT9ZyLc@wuerfel>
 <CALszF6CaO_yuNiSDuDV+4d2NRe_+32j=zcSE1HPhB1UH59cW9w@mail.gmail.com>
 <13641152.Yt4ZI3oT6L@wuerfel>
 <CALszF6CK5ezrO6D=4zr6zEPC7VanzbQjnZJwKOZekEZ5L4D-Dg@mail.gmail.com>
 <20150521185122.GD8557@lukather>
 <CALszF6BuvTf86k6S5UEYZs-DJSTehy=+Csb3c6jxMU90MN05zw@mail.gmail.com>
 <20150523082820.GK8557@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150523082820.GK8557@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>, Nikolay Borisov <Nikolay.Borisov@arm.com>, Peter Meerwald <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Russell King <linux@arm.linux.org.uk>, Kamil Lulko <rev13@wp.pl>, Jiri Slaby <jslaby@suse.cz>, Daniel Lezcano <daniel.lezcano@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rusty Russell <rusty@rustcorp.com.au>, Rob
List-Id: devicetree@vger.kernel.org

Hi Maxime,

2015-05-23 10:28 GMT+02:00 Maxime Ripard <maxime.ripard@free-electrons.com>:
> On Thu, May 21, 2015 at 10:10:35PM +0200, Maxime Coquelin wrote:
>> We have the same problem on stm32, as just discussed with Andreas [0].
>> I decided to patch the bootloader to deassert timers reset, after
>> discussions with Rob Herring and Arnd.
>
> That seems like the best solution, but we don't have control over the
> bootloader in most cases. We have an alternative implementation (ie
> mainline u-boot) that is required for a few things already, but I'd
> really like to still be able to at least boot the kernel on a "legacy"
> bootloader (that is the one flashed on the device).

For sure it will have to remain compliant with the legacy bootloader.
It is easier for STM32 since it is a newly platform.

Regards,
Maxime C.

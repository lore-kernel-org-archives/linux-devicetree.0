From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 0/4] gpio: driver for the RPi3 GPIO expander
Date: Wed, 7 Feb 2018 10:33:24 +0100
Message-ID: <a3e4ba9a-60bf-5038-7385-8cb3d2667ed2@i2se.com>
References: <cover.1516105893.git.baruch@tkos.co.il>
 <CACRpkdZAtVfAU-k9EUihH6peY2d1Ntn3jboVMBn9adReNLupow@mail.gmail.com>
 <20180206162759.awghecpv4ihaatz7@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180206162759.awghecpv4ihaatz7@tarshish>
Content-Language: de-DE
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Baruch Siach <baruch@tkos.co.il>, Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-gpio@vger.kernel.org, Eric Anholt <eric@anholt.net>, Michael Zoran <mzoran@crowfest.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Baruch,

Am 06.02.2018 um 17:27 schrieb Baruch Siach:
> Hi Linus,
>
> On Tue, Feb 06, 2018 at 02:42:48PM +0100, Linus Walleij wrote:
>> On Tue, Jan 16, 2018 at 1:45 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>>
>>> The Raspberry Pi 3 has a GPIO expander that controls, among others, the
>>> activity LED, and the camera connector GPIOs. The GPIO expander on an I2C bus
>>> that is not directly controlled from the ARM core. The VC4 firmware controls
>>> the I2C bus, and allows the ARM core to set/get GPIO settings over its mailbox
>>> interface.
>>>
>>> This series adds support for the RPi3 expander.
>>>
>>> The driver is ported from the downstream kernel at
>>> https://github.com/raspberrypi/linux/, branch rpi-4.9.y.
>>>
>>> Changes in v3:
>>>
>>>   * Kconfig tweaks
>>>   * Check rpi_exp_gpio_get_polarity() return value
>>>   * Redundant header removal
>>>   * Redundant platform_set_drvdata() call removal
>>>   * Small coding style changes
>> All is looking pretty good. I see Rob had some last minute comments,
>> but please rebase and repost post v4.16-rc1 so we can get this merged,
>> we need to get this upstream.
> I was about to send v4 when I saw your email. I based v4 on current LinusT's 
> tree as of e237f98a9c. I guess that affected files will not change before 
> v4.16-rc1, but I can wait a few more days for -rc1.
>
> baruch
>
please also address the owner issue in the driver, which was reported by
kbuild test robot.

Thanks

Stefan

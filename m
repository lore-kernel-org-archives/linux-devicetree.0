From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: support for Moschip MCS814x SoCs
Date: Tue, 17 Jul 2012 00:12:01 +0200
Message-ID: <CACRpkdbxesmgFswBKzAFHUBt-Np7wX0SXXVKrmGzubUN3OVN2w@mail.gmail.com>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <1342363754-30808-2-git-send-email-florian@openwrt.org>
 <201207161554.04812.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207161554.04812.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 16, 2012 at 5:54 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

>> +static const struct cpu_mode cpu_modes[] = {
>> +     {
>> +             .name           = "I2S",
>> +             .gpio_start     = 4,
>> +             .gpio_end       = 8,
>> +     },
>> +     {
>> +             .name           = "UART",
>> +             .gpio_start     = 4,
>> +             .gpio_end       = 9,
>> +     },
>> +     {
>> +             .name           = "External MII",
>> +             .gpio_start     = 0,
>> +             .gpio_end       = 16,
>> +     },
>> +     {
>> +             .name           = "Normal",
>> +             .gpio_start     = -1,
>> +             .gpio_end       = -1,
>> +     },
>> +};
>> +
>> +void __init mcs814x_init_machine(void)
>> +{
>> +     u32 bs2, cpu_mode;
>> +     int gpio;
>> +
>> +     bs2 = __raw_readl(mcs814x_sysdbg_base + SYSDBG_BS2);
>> +     cpu_mode = (bs2 >> CPU_MODE_SHIFT) & CPU_MODE_MASK;
>> +
>> +     pr_info("CPU mode: %s\n", cpu_modes[cpu_mode].name);
>> +
>> +     /* request the gpios since the pins are muxed for functionnality */
>> +     for (gpio = cpu_modes[cpu_mode].gpio_start;
>> +             gpio == cpu_modes[cpu_mode].gpio_end; gpio++) {
>> +             if (gpio != -1)
>> +                     gpio_request(gpio, cpu_modes[cpu_mode].name);
>> +     }
>> +}
>
> This looks like a very simple instance of a pinmux driver. I wonder
> if it's worth doing an actual pinctrl driver that knows about these
> modes and about the gpio handling of the platform. Maybe Linus Walleij
> can comment on that.

It is worth, because usually it is not simple at all but these are,
as I highly suspect, the first few entries to get the platform up and
running. Then it's going to need to add another one, and then
another one, and then break it into a separate file, and then it's a
custom pin controller implementation all over again

Nothing is forbidding a simple pin controller implementation
in drivers/pinctrl, just a few tens of lines is perfectly OK
with me.

Documentation/pinctrl.txt is the friend at all times.
arch/arm/mach-u300/core.c shows how a simple set-up
at boot time can be achieved using so-called pinctrl
hogs.

Yours,
Linus Walleij

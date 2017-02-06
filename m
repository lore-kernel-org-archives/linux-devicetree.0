From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RESEND 1/3] arm64: add THUNDER2 processor family
Date: Mon, 6 Feb 2017 16:38:24 +0100
Message-ID: <CAK8P3a1BTV4ZH9eQHwhyZ4AVVSwxsM_MD+iuByfdXDbE3M_szg@mail.gmail.com>
References: <1486233461-2679-1-git-send-email-jnair@caviumnetworks.com>
 <1486233461-2679-2-git-send-email-jnair@caviumnetworks.com>
 <20170206100608.GA8540@arm.com> <CAK8P3a1_dQZd3RRyavMKqBFcHsXTQ2oAUO5vaLhyTiH99XhqrQ@mail.gmail.com>
 <20170206152140.GA2001@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206152140.GA2001@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2017 at 4:21 PM, Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Feb 06, 2017 at 02:44:13PM +0100, Arnd Bergmann wrote:
>> On Mon, Feb 6, 2017 at 11:06 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
>
> The Vulcan architecture has been discontinued by Broadcom, so the platform
> and device tree files should go away soon. Renames are going to be messy, it
> will be better to keep Vulcan around until the transition is complete, and
> then delete it.

What are the disadvantages of a rename in your opinion? Are you mainly
worried about merge conflicts or something else?

>> Hmm, an alternative would be to add the new .dtsi file and start out with an
>> #include of the existing file, with overrides for anything that needs changing.
>> Similarly, the Kconfig symbol could just 'select ARCH_VULCAN' for now.
>
> Even in this case, we will need to copy the files from boot/dts/broadcom to
> boot/dts/cavium along the way. The current patchset is (in my opinion) the
> least messy way to accomplish the transition. But it is the maintainer's call,
> so if you think it has to be done differently, I can update the patchset and
> post again.

I don't see the need to copy if we can do an #include and later move the
file into the new place. I also see only three references to ARCH_VULCAN
at all aside from the dts file.

arch/arm64/configs/defconfig:CONFIG_ARCH_VULCAN=y
drivers/gpio/Kconfig:   depends on OF_GPIO && (CPU_XLP || ARCH_VULCAN
|| COMPILE_TEST)
drivers/i2c/busses/Kconfig:     depends on CPU_XLP || ARCH_VULCAN ||
COMPILE_TEST
drivers/spi/Kconfig:    depends on CPU_XLP || ARCH_VULCAN || COMPILE_TEST

We can probably manage to have a single patch to rename them all at
the same time, or we do the add+remove over two merge windows.

I also noticed now that you dropped the vulcan "compatible" strings in
the .dtsi files, I think we should keep those as a fallback, and to avoid
having interdependencies with the driver updates, e.g. the top-level
compatible string should be

compatible = "cavium,thunder-9900", "brcm,vulcan-soc";

for the SoC, plus of course the board specific identifier in front of that.
Same for the CPU, the i2c, gpio, and pmu.

    Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

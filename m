From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4 0/9] ARM: Initial support for Marvell Berlin SoCs
Date: Tue, 10 Dec 2013 11:38:29 -0800
Message-ID: <CAOesGMhMAC56AK5YwA2ROzQ5b6HuWXzF31HDCyx7fYzka6WvHQ@mail.gmail.com>
References: <1383661723-17956-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<52A674F1.7000104@gmail.com>
	<20131210191653.GA10105@quad.lixom.net>
	<201312102033.00953.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201312102033.00953.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 10, 2013 at 11:33 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 10 December 2013, Olof Johansson wrote:
>> > I started with mach-mvebu in the first RFC, but Berlin SoCs are from a
>> > different business unit at Marvell and are more PXA compatible than
>> > Orion/Kirkwood/Armada 370/XP. Most notably, they lack the "mbus" and
>> > IP is either from PXA/MMP or Synopsys DW. Thomas Petazzoni and also
>> > Jisheng Zhang from Marvell suggested to not put it into mvebu but
>> > have a different mach folder instead.
>>
>> Hmm, ok. Well, maybe later on we can look at aggregating them more again. It'd
>> be nice to get fewer top-level platform directories per vendor.
>
> I possibly a lot of directories just become empty in the long run and
> we remove them once all all code has been subsystemized and drivered.

For mobile SoCs it's somewhat unlikely that it will ever be completely
empty, but maybe. Either way, once the contents is small enough it's a
lot easier to move around and aggregate into one platform.

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

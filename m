From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
Date: Sat, 5 Dec 2015 12:35:42 +0100
Message-ID: <CAOiHx==8TFK9t4h2C0Q+j==nuRP3EbyVa+nuYuSEj_LCDa820Q@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Arlott <simon@fire.lp0.eu>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>, David Hendricks <dhendrix@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi,
>
> There have been several discussions [1] about adding a device tree binding for
> associating flash devices with the partition parser(s) that are used on the
> flash. There are a few reasons:
>
>  (1) drivers shouldn't have to be encoding platform knowledge by listing what
>      parsers might be used on a given system (this is the currently all that's
>      supported)
>  (2) we can't just scan for all supported parsers (like the block system does), since
>      there is a wide diversity of "formats" (no standardization), and it is not
>      always safe or efficient to attempt to do so, particularly since many of
>      them allow their data structures to be placed anywhere on the flash, and
>      so require scanning the entire flash device to find them.
>
> So instead, let's support a new binding so that a device tree can specify what
> partition formats might be used. This seems like a reasonable choice (even
> though it's not strictly a hardware description) because the flash layout /
> partitioning is often very closely tied with the bootloader/firmware, at
> production time.

On a first glance this looks good to me, and looks easily extensible
for application of non-complete partition parsers.

E.g. for the "brcm,bcm6345-imagetag" we would want to actually do something like

partitions {
    ....

    partition@0 {
        reg = <0x0 0x10000>;
        label = "cfe";
        read-only;
    };

    partition@10000 {
        reg = <0x10000 0x3d0000>;
        label = "firmware";
        compatible = "brcm,bcm6345-imagetag";
    };

    partition@3e0000 {
        reg = <0x3e0000 0x10000>;
        label = "art";
        read-only;
    };

   partition@3f0000 {
        reg = <0x3f0000 0x10000>;
        label = "nvram";
        read-only;
    };
};

as the image tag can only specify the offsets and sizes of the rootfs
and kernel parts, but not of any other parts.

>
> Also, as an example first-use of this mechanism, I support Google's FMAP flash
> structure, used on Chrome OS devices.
>
> Note that this is an RFC, mainly for the reason noted in patch 6 ("RFC: mtd:
> partitions: enable of_match_table matching"): the of_match_table support won't
> yet autoload a partition parser that is built as a module. I'm not quite sure
> if there's a lot of value in supporting MTD parsers as modules (block partition
> support can't be), but that is supported for "by-name" parser lookups in MTD
> already, so I don't feel like dropping that feature yet. Tips or thoughts are
> particularly welcome on this aspect!

I would assume a lot of the cases these would be a chicken-egg
problem, you need the parser to be able to find and mount the rootfs,
but you you need mount the rootfs to load the parser.

> Also note that there's an existing undocumented binding for a
> "linux,part-probe" property, but it is only usable on the physmap_of.c driver
> at the moment, and it is IMO not a good binding. I posted my thoughts on that
> previously here [2], and since no one else cared to make a better one...I did
> it myself.
>
> I'd love it if we could kill the unreviewed binding off in favor of something
> more like this...

I agree fully that this is a bad binding, as it exposes internal names
that aren't supposed to be fixed.


Jonas

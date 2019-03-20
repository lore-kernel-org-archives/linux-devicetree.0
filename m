From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
Date: Wed, 20 Mar 2019 21:48:16 +0100
Message-ID: <CAFBinCBfkr-yyR4Vbd1HVmXVCOKuK-Kw1HKz4SMt9G3eA49HQQ@mail.gmail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
 <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com> <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
 <20190307140959.10092d45@xps13> <ccb95e75-e62f-c510-cabd-853481f77fc8@amlogic.com>
 <CAFBinCBd=dOZjv4KEDY9ODOONDO=WtaBqAMRi_a+gH3_iZEAHQ@mail.gmail.com>
 <CAFBinCA7LLK6K3ZqauJy2N-z5-kTfuTztmoSQ=Bk4A5Xagxddw@mail.gmail.com> <8134890a-457d-7803-01a4-1832f925f65f@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8134890a-457d-7803-01a4-1832f925f65f@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liang Yang <liang.yang@amlogic.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Liang,

On Wed, Mar 20, 2019 at 4:32 AM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Hi Martin,
>
> Thanks for your time.
> On 2019/3/20 4:27, Martin Blumenstingl wrote:
> > Hello Liang,
> >
> > On Sat, Mar 16, 2019 at 11:55 AM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > [...]
> >>> Martin, Now i am not sure whether NFC driver leads to kernel panic when
> >>> calling kmem_cache_alloc_trace.
> >> thank you for confirming that it works for you on GXL
> >>
> >> I'm not sure that this is a NFC driver problem.
> >> after enabling CONFIG_SLAB_FREELIST_HARDENED in my kernel config the
> >> crash moves. it's now crashing in slub.c's kfree() at
> >> BUG_ON(!PageCompound(page));
> > I added some debug prints in meson_nfc_read_buf() to get some details
> > about the info buffer before the crash,
> > format is: meson_nfc_read_buf <virtual address> <physical address>
> >
> > during my first test three different addresses are used:
> > - meson_nfc_read_buf e9e6c640 0x29e6c640 (works fine)
> > - meson_nfc_read_buf e9e6c680 0x29e6c680 (works fine)
> > - meson_nfc_read_buf ee39a34b 0x2e39a34b (crashes during kfree)
> >
> > so I tried playing around with the allocation size (see the attached
> > patch) and changed it to:
> >    kzalloc(PER_INFO_BYTE + 64, GFP_KERNEL)
> > this results in the following addresses being used:
> > - meson_nfc_read_buf e9ea4280 0x29ea4280 (works fine)
> > - meson_nfc_read_buf e9ea4300 0x29ea4300 (works fine)
> > (there is no crash anymore)
> >
> > Liang, are there any special requirements on the "info address" like
> > the alignment?
> It must be 4 bytes alignment. i have met it previously when debugging
> NFC driver on AXG platform, but it is not specified on spec. Now i am
> confused that how to get the no aligned address "xe39a34b" when using
> kmalloc; i think it should return the aligned address. doesn't it?
thank you for confirming the 4-byte alignment requirement!
I have no explanation for the unaligned address returned by kzalloc().
I'll ask on the linux-mm mailing list if they have a hint why this
happens.

> > also do you know why the PER_INFO_BYTE buffer is allocated dynamically
> > in meson_nfc_read_buf() instead of allocating it at initialization?
> > I'm not saying that it should be changed! I'm curious because there's
> > per-meson_nfc_nand_chip info and data buffers which are allocated at
> > initialization time.
> > NAND scan or initialization is divided into three stages:
> nand_scan_ident->nand_attach->nand_scan_tail. info and data buffer which
> depend on the result of nand_scan_ident are allocated on nand_attach; so
> nand_scan_ident can not use the info buffer on meson_nfc_nand_chip.
thank you for the explanation!

> Allocating a fixed size info buffer before nand_scan_ident and attach it
> on the struct meson_nfc; Or considering not use dma for reading data
> less than 8 bytes. Both can reduce kmalloc and kfree calling. Thanks.
both suggestions sound reasonable.
however, I will search for the root cause of the unaligned address
first before changing the Meson NFC driver.

[...]
> > [    2.227374] ------------[ cut here ]------------
> > [    2.231968] WARNING: CPU: 1 PID: 1 at
> > drivers/mtd/nand/raw/nand_base.c:5503 nand_scan_with_ids+0x1718/0x171c
> > [    2.241760] No oob scheme defined for oobsize 1280
> > ...
> > (the "No oob scheme defined for oobsize 1280" message is expected)
> >
> miss mtd_set_ooblayout(mtd, &meson_ooblayout_ops) on function
> meson_nand_attach_chip.
thank you for the suggestion. I didn't have time to test this on my
board yet but I'll let you know about my results during the weekend.
Does the missing mtd_set_ooblayout() call also affect GXL or AXG boards?


Regards
Martin

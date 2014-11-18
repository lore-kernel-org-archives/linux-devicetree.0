From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Tue, 18 Nov 2014 11:19:51 +0100
Message-ID: <12543154.MaArN0zy9N@wuerfel>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com> <3357597.nYlNZ6O0nJ@wuerfel> <CAJiQ=7B6Xwz2iqqH4vEG8WzPOzHj7NHsuGWqq49uy-E34RHp4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJiQ=7B6Xwz2iqqH4vEG8WzPOzHj7NHsuGWqq49uy-E34RHp4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 17 November 2014 13:21:45 Kevin Cernekee wrote:
> On Mon, Nov 17, 2014 at 12:40 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> >> One possible complication: for BCM63xx/BCM7xxx (MIPS) there is no
> >> decompressor in the kernel.  The firmware loads an ELF image into
> >> memory and jumps directly to kernel_entry.
> >>
> >
> > Right, that complicates it a bit, but is there a reason why a decompressor
> > would be hard to do, or would be considered a bad thing?
> > There is already generic decompressor code in arch/mips/boot/compressed/
> > that I would assume you could use without firmware changes. Are you
> > worried about boot time overhead?
> 
> Currently the bootloader is responsible for decompressing the image.
> On STB the bootloader typically loads a gzipped ELF file; on DSL/CM
> the bootloader unpacks a custom image format containing an
> LZMA-compressed kernel in some form.  So we would be
> double-compressing the same kernel in this scheme.
> 
> STB/DSL should be able to boot the arch/mips/boot/compressed "vmlinuz"
> ELF file; I tested STB.  CM might be questionable, but doesn't need
> decompressor mods because the bootloader is DT-aware.
> 
> Also, the decompressor may need to be modified so that it recognizes /
> passes / doesn't overwrite DTB blobs coming from the bootloader.  And
> to make sure it doesn't stomp on any of the code or data that our
> bootloaders use for their callback mechanisms.
> 
> So, one possibility is to submit a V3 patch which allows 0 or 1 DTB
> files to be compiled in statically (similar to
> CONFIG_ARM_APPENDED_DTB) and requires a DT-aware bootloader or
> decompressor for anything else.  Any opinions?

That sounds like a good approach, in particular with the patch that
Jonas linked to. With that, most or all of your arch/mips/bmips/setup.c
should become completely generic, and I would think the rest can
be handled through a function that is called after looking up the
root "compatible" property in DT.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

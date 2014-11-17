From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Tue, 18 Nov 2014 00:06:48 +0100
Message-ID: <CAOiHx=kutuOw4kTukm3FvSS-Fwah_yF2byDQFdpM9YQCn6x93g@mail.gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
 <2911624.UJRs5QOPN5@wuerfel> <CAJiQ=7BH8K=Q+JcWTKSfn6xAteOF4B6jahMu_qVd-FyZWD3pjA@mail.gmail.com>
 <3357597.nYlNZ6O0nJ@wuerfel> <CAJiQ=7B6Xwz2iqqH4vEG8WzPOzHj7NHsuGWqq49uy-E34RHp4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJiQ=7B6Xwz2iqqH4vEG8WzPOzHj7NHsuGWqq49uy-E34RHp4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 10:21 PM, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Currently the bootloader is responsible for decompressing the image.
> On STB the bootloader typically loads a gzipped ELF file; on DSL/CM
> the bootloader unpacks a custom image format containing an
> LZMA-compressed kernel in some form.  So we would be
> double-compressing the same kernel in this scheme.

For the latter I use a patch[1] for mips head.S that detects if
there's a dtb appended to the vmlinux.bin, which would be trivial to
adapt to what the well-defined (b)mips interface expects. Of course
then there is no board detection at all, but I think that's an
acceptable trade off.


Jonas

[1] http://git.openwrt.org/?p=openwrt.git;a=blob;f=target/linux/brcm63xx/patches-3.14/366-MIPS-add-support-for-vmlinux.bin-appended-DTB.patch;h=344e78b5b41e03bff5f3d1f9cce1e8e2cb1a9368;hb=HEAD
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

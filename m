From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 00/22] Multiplatform BMIPS kernel
Date: Thu, 20 Nov 2014 12:13:55 -0800
Message-ID: <CAJiQ=7CbOtejxhcoTiJ2VOyM9CJNCdWAw7Cv5HTzwGa1VmO5Xg@mail.gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
 <20141120030434.GE24364@ld-irv-0074> <CAJiQ=7C8h-MAuRdgzZqx2=bg8bvy7v9pv7e7tGXWmA9ghYJiqQ@mail.gmail.com>
 <546E2E3E.5040305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546E2E3E.5040305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 20, 2014 at 10:09 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Slightly unrelated, did you also try to use drivers/bus/brcmstb_gisb.c
> on these MIPS platforms?
>
> Its usefulness is probably lower on MIPS since we typically get accurate
> bus errors to be decoded by the CPU and printed through the exception
> handler, but I'd be curious if it works just fine as well.

Unfortunately ERR_CAP_CLR (the first register) starts at offset 0x7e4
on 28nm, and offset 0x0c8 on 40nm/65nm.

Just for fun I tried setting the base address to (0x104000c8 - 0x7e4)
= 0x103ff8e4 on 7420, and then noticed that the CAP_HI_ADDR register
only exists on the new chips with 40-bit addressing.  This prevents
the driver from reading the valid bit from the correct location, so
the error handler exits prematurely.  After manually hacking the code
to renumber the registers, it worked again:

# devmem 0x103ffffc
Data bus error, epc == 0040a21c, ra == 0040a1a0
brcmstb_gisb_arb_decode_addr: timeout at 0x103ffffc [R timeout], core: cpu_0
Bus error
# devmem 0x103ffffc 32 0x5678
brcmstb_gisb_arb_decode_addr: timeout at 0x103ffffc [W timeout], core: cpu_0
#

Last night I fixed up the brcmstb reset driver to work with the old
chips.  I'm wondering if it makes sense to just split this work into a
new patch series, since several of the BCM7xxx ARM drivers will need
changes (both code and DT) to run on MIPS.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

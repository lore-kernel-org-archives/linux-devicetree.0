From: Miquel RAYNAL <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Date: Thu, 11 Jan 2018 23:24:17 +0100
Message-ID: <20180111232417.4aa86075@xps13>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
        <20180111122751.4bd74366@bbrezillon>
        <87efmwb8bj.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87efmwb8bj.fsf-4ty26DBLk+jEm7gnYqmdkQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>Ezequiel Garcia <ez>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Thu, 11 Jan 2018 18:42:56 +0100
Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:

> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
> 
> Hi Boris and Miquel,
> 
> > So, here is the plan: since the driver has been tested on various
> > mvebu platforms and is known to work fine on these platforms, I'd
> > like to queue the driver and the patch modifying mvebu defconfigs
> > (patches 1 to 4) for 4.16.
> That's all right.
> 
> > I'll leave other patches for 4.17, which means I'd like remaining
> > bugs to be fixed during the 4.16 release cycle so that we can
> > eventually get rid of the old driver. That's really important to me
> > that we don't keep both drivers around for too long, because my
> > previous experience showed that, when you have 2 drivers for the
> > same HW, people don't switch to the new one until they're forced to
> > do it.
> >
> > Robert, are you fine with this approach? What about the tests you
> > were doing? Did you make any progress? Did you find other issues?
> So far, with the latest branch from Miquel of tip commit 12b9e62c851c
> ("ARM64: dts: marvell: use reworked NAND controller driver on Armada
> 8K"), the bad blocks issue is still there, ie :
>  - the old pxa3xx driver doesn't see any bad block and mounts the
> ext2/ubifs correctly
>  - barebox doesn't see any bad block
>  - marvell_nand sees all (or most all) blocks as bad with
> "flash_bbt=0" in platform data, which is very surprising
> 
> I'm really surprised that in your tests on the cm_x300, in a
> platform_data setup (ie. not device-tree setup), you're not seeing
> these errors ...

I have no problems with the cm_x300 board (using platform data) but
there is one big difference: the bootloader. You are using Barebox
while I am using U-Boot.

Please pull this branch which is for testing purpose [1].

There are two "HACK"s:
1/ Dump the timing registers: this is to see how Barebox does
initialize these registers. I will put these values back into my setup
and see how the board reacts.
2/ Dump the OOB area while reading. This is to see why the driver
declares all blocks as bad.

Can you please run this branch first?

Then, can you please:
- boot the old driver
- dump both NDTR[0|1] registers that should be well initialized
- boot the new driver with the values previously retrieved (you can
  assign these values where exactly HACK 1/ adds the printk's).


Thank you,
Miquèl

[1]
https://github.com/miquelraynal/linux/commits/marvell/nand-next/nfc-pxa-bug

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

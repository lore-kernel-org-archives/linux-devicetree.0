From: Mychaela Falconia <mychaela.falconia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Thu, 9 Jun 2016 11:35:53 -0800
Message-ID: <CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
 <20160603165909.09f27ee0@bbrezillon> <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
 <CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com> <20160609200128.5b7a6e29@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160609200128.5b7a6e29@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6/9/16, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> I also agree on this aspect. Though what you consider an evolution with
> these 'high-level' controllers is in my opinion a regression.
>
> By supporting only a subset of what NAND chips actually support, and
> preventing any raw access, you just limit the compatibility of the NAND
> controller with rather old NAND chips. For example, your controller
> cannot deal with MLC/TLC NANDs because it just can't send the private
> commands required to have reliable support for these NANDs.

I am not the one who designed the controller IP, so please don't shoot
the messenger. I fully agree that it would have been much safer if
they just bothered to add a couple of registers to their IP that
provide a raw bypass directly to the NAND interface pins - and it
would have been trivial to do so, adding just a few transistors to the
silicon - but apparently the IP vendor chose not to. I agree that it
was a poor decision on their part, but as Linux geeks we don't get the
power to change the IP we got hired to write drivers for.

As for private commands which the IP does not know about, there is a
way to send them, but it is not a truly raw way. With FTNANDC024 if
you need to send a private command to the NAND, you have to write some
custom FTNANDC024 microcode for it. The datasheet explains how to
write your own microcode, and the IP includes a small SRAM where you
can put your own microcode in addition to the mask ROM with the
standard microcode. But this provision still would not allow a
low-level driver implementation: there is still no way to implement a
driver function that just sends any arbitrary command opcode without
caring what it is, instead you would have to write a different special
microcode routine for each non-standard command you need to support,
and naturally the microcode SRAM has a finite size.

> I understand this constraint, and I know some controllers are really
> like this, but before deciding to move those controllers to some
> 'high-level NAND' framework, I'd like to make sure they are really not
> providing this raw interface.

I would be glad to share the datasheet for the controller I am working
with, so you can verify with your own eyes that it does not provide
any truly raw interface - but I don't have a place to post it. If you
like, I can send it to you as an off-list email attachment (1775641
bytes), and you can then repost it somewhere for others to see.

> I've been told many times that NAND controllers were not supporting raw
> accesses (disabling the ECC engine when accessing the NAND), and most
> of the time it was false, but the developers just didn't care about
> supporting this feature, and things like that make the whole subsystem
> unmaintainable.

With FTNANDC024 the closest you can get to a raw read are the
following two features:

1. You can disable the ECC engine and read the first "data size" bytes
of the page raw, but it does not get you the OOB area. For example, on
the Micron SLC chip I am working with currently, the raw page size is
4096+224 bytes, but the FTNANDC024 can only read the 4096 "data" bytes
this way, and not the remaining 224.

2. There is a "byte read" command that performs a truly raw read of
any range of bytes (any column address) within a page, but it can only
read a maximum of 32 bytes per operation.

If I wanted to do a truly raw dump of a full NAND page with my
controller and NAND chip (like I did when I wanted to reverse-engineer
their hardware BCH implementation), I would have to issue one read
command to get the first 4096 bytes, then another 7 "byte read"
commands to get the remaining 224 bytes. 8 read commands in total to
get a raw dump of one full NAND page, and each of those 8 FTNANDC024
read commands internally involves sending a new Read Page command to
the physical NAND - thus any read disturbs are invoked 8 times per
page instead of once.

It's even worse with raw writes - if I wanted to do a raw write of a
full NAND page, I would have to do it in 8 separate write commands
just like with the raw read. I assume that the NAND chip won't like it
at all, as it would get 8 separate Page Program commands for the same
page with different column addresses.

M~
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

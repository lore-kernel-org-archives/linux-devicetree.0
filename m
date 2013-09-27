From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 18:05:52 +0100
Message-ID: <20130927170552.GC12758@n2100.arm.linux.org.uk>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk> <CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com> <20130926205906.GT12758@n2100.arm.linux.org.uk> <CAHCPf3u9KyoJiAPv6oc_ZdVBqgix41__RAGRXh8z+d5bXO8fQw@mail.gmail.com> <20130926232907.GV12758@n2100.arm.linux.org.uk> <20130927131554.GB31178@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130927131554.GB31178-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 09:15:54AM -0400, Jason Cooper wrote:
> Russell,
> 
> On Fri, Sep 27, 2013 at 12:29:07AM +0100, Russell King - ARM Linux wrote:
> > I haven't sorted out a rootfs for this yet, so it fails trying to find
> > that.  (Rabeeh's kernel contained an initramfs buildroot image - it
> > might be useful to find some way to load that as a separate image -
> > does appended DT support that?)
> 
> yes, point to it in your config, kbuild will build the initramfs in.
> Appending the dtb and running mkimage has been working fine for me.

Yes... if I could rip the initramfs out of Rabeeh's kernel.

Having sorted out the beer problem (pintctrl-names), I now have ethernet
sort of working, but not quite.  It produces data on my LAN, but that
data is not correct.

Here's an extract from the interesting bits that I captured using another
machine (other bytes are zeros):

	0x0000:  ffff ffff ffff d063 0000 0000 0800 4500
	0x0010:  0240 0000 0000 0800 4500 0240 0000 4000
	0x0020:  4011 38ae 0000 0000 4000 4011 38ae 0043
	0x0030:  0200 ffff ffff 0044 0043 022c ffff ffff
	0x0040:  0600 5fe9 bf2c 0000 0101 0600 5fe9 bfd8
	0x0050:  0002 0000 0000 0000 0000 0002 0000 0000
	0x0060:  0000 0000 0000 0000 0000 0000 0000 0000
	0x0070:  0000 0000 0000 0000 d063 0000 0000 0000
	0x0080:  0000 d063 0000 0000 0000 0000 0000 0000
...
	0x01d0:  0000 0000 0000 0000 0000 0000 0000 6382
	0x01e0:  0000 0000 0000 0000 0382 5363 3501 0137
	0x01f0:  0801 0306 5363 3501 0137 0000 0006 0c0f
	0x0200:  111a 28ff 0000 0000 0c0f 111a 0000 0000

That data has a pattern to it.  It's supposed to be a DHCP packet, which
would be something like (this is from the same board but booting Rabeeh's
kernel instead):

	0x0000:  ffff ffff ffff d063 0000 0000 0800 4500
	0x0010:  0240 0000 4000 4011 38ae 0000 0000 ffff
	0x0020:  ffff 0044 0043 022c 0000 0101 0600 5e9a
	0x0030:  dac5 0000 0000 0000 0000 0000 0000 0000
	0x0040:  0000 0000 0000 d063 0000 0000 0000 0000
	0x0050:  0000 0000 0000 0000 0000 0000 0000 0000
...
	0x0110:  0000 0000 0000 6382 5363 3501 0137 0801
	0x0120:  0306 0c0f 111a 28ff 0000 0000 0000 0000

Now, there's a pattern to the corruption - let me rearrange them slightly:

ff ff ff ff ff ff d0 63

00 00 00 00 08 00 45 00 02 40
00 00 00 00 08 00 45 00 02 40

00 00 40 00 40 11 38 ae 00 00
00 00 40 00 40 11 38 ae

00 43 02 00 ff ff ff ff 00 44
00 43 02 2c ff ff ff ff 06 00
5f e9 bf 2c 00 00 01 01 06 00
5f e9 bf d8

00 02 00 00 00 00 00 00 00 00
00 02 00 00 00 00 00 00 00 00

00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00
d0 63 00 00 00 00 00 00 00 00
d0 63 00 00 00 00 00 00 00 00
00 00 00 00
...

00 00 00 00 
00 00 00 00 00 00 00 00 00 00
63 82 00 00 00 00 00 00 00 00
03 82 53 63 35 01 01 37 08 01
03 06 53 63 35 01 01 37 00 00
00 06 0c 0f 11 1a 28 ff 00 00
00 00 0c 0f 11 1a 00 00 00 00

That's the same order of bytes as in the original packet.  Notice how there
are identical bytes between ones below and above, and notice how the repeated
groups of bytes are always 10 bytes apart.  No, it's not giving any errors
in the interface which I ran tcpdump on!

I'm not yet sure what could cause this...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

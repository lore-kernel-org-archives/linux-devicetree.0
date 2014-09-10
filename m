From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] usb: gadget: Add xilinx usb2 device support
Date: Wed, 10 Sep 2014 16:30:50 +0200
Message-ID: <8798156.X6RhQq9Iqm@wuerfel>
References: <1406020130-20467-1-git-send-email-sbhatta@xilinx.com> <20140821140040.GE9608@saruman.home> <CALHRZuqt-XJ5mPczzGJtSN=iq7TPut0=54r90QHWR+w-Lwwtyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALHRZuqt-XJ5mPczzGJtSN=iq7TPut0=54r90QHWR+w-Lwwtyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Cc: "balbi@ti.com" <balbi@ti.com>, Daniel Mack <daniel@zonque.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michals@xilinx.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, svemula@xilinx.com, anirudh@xilinx.com, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 10 September 2014 19:25:11 sundeep subbaraya wrote:
> > that's not exactly what I asked  Usually you only add COMPILE_TEST
> > when you have an ARCH dependency. So something like:
> >
> >         depends on ARCH_ARM || COMPILE_TEST
> >
> > would make it clear that this driver is only available on ARM, but when
> > doing my build tests, I'd still be able to compile it on x86.
> 
> Ok got it 

Most of the xilinx stuff also applies to MICROBLAZE however, so it
may need to be

	ARM || MICROBLAZE || COMPILE_TEST

(not ARCH_ARM, btw).

> >> > Also, your code uses device tree functions unconditionally, which is
> >> > fine, but it must hence depend on 'OF'.
> >>
> >> Ok will add OF along with COMPILE_TEST
> >
> > so this would be:
> >
> >         depends on OF || COMPILE_TEST

If it requires OF to build, you can use 'OF && (ARM || COMPILE_TEST)',
but if there is no compile-time dependency, you can just leave out
the 'depends on OF' completely. You can't even build a Zynq machine
without OF enabled.

	Arnd

From: Marc =?UTF-8?B?TWFyw60=?= <markmb@redhat.com>
Subject: Re: [PATCH v2] QEMU fw_cfg DMA interface documentation
Date: Thu, 10 Sep 2015 16:21:41 +0200
Message-ID: <20150910162141.7a5f70a7@markmb_rh>
References: <1441012133-8154-1-git-send-email-markmb@redhat.com>
	<1441012303-8261-1-git-send-email-markmb@redhat.com>
	<CAJSP0QXgiMo0ahzRQ=2iMXVmiO+R27Re17c966LX1T_Q=Rdgow@mail.gmail.com>
	<20150902103311.5335d469@markmb_rh>
	<1441624109.27149.18.camel@redhat.com>
	<20150908164608.GA9169@morn.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150908164608.GA9169@morn.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin O'Connor <kevin@koconnor.net>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Drew <drjones@redhat.com>, Laszlo <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Graf <agraf@suse.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 8 Sep 2015 12:46:08 -0400
"Kevin O'Connor" <kevin@koconnor.net> wrote:

> On Mon, Sep 07, 2015 at 01:08:29PM +0200, Gerd Hoffmann wrote:
> > > It's just simplicity. If you want to read a few times from the
> > > same field (like in ACPI tables, read the data size and then the
> > > data), you need a way to enable and disable the selector and
> > > manage the current offset for that entry. This is already
> > > provided with the "old" interface.
> > 
> > Could be handled with a 'select' control bit.  Only when set select
> > entry and reset offset to zero.
> 
> I think two features would help "round off" the new fw_cfg DMA
> proposal: add a select bit as you describe (that uses the 16 most
> significant bits of the "control" field for the "select entry" when
> the bit is set), and define a static signature (eg, "QEMU CFG") when
> reading the 64bit MMIO dma register.
> 
> Both are optional features that don't change the fundamental
> interface; I was thinking of sending them as two patches on top of
> Marc's next version of his patch series (if no one else gets to it
> first).
> 

As there will be (at least) another version, I can add those simple
changes in the next version.

Thanks
Marc

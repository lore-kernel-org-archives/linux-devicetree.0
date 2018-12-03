From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v1 0/2] SPI-NOR add NPCM FIU controller driver
Date: Mon, 3 Dec 2018 15:30:46 +0100
Message-ID: <20181203153046.0554854f@bbrezillon>
References: <20181203091456.454030-1-tmaimon77@gmail.com>
        <20181203102240.79a86a26@bbrezillon>
        <CAP6Zq1ib3p=UVC8ct_gvB801_XjTwknXMKPfFCq7=d1Jxv0Dfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP6Zq1ib3p=UVC8ct_gvB801_XjTwknXMKPfFCq7=d1Jxv0Dfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-mtd@lists.infradead.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Tomer;

On Mon, 3 Dec 2018 16:09:19 +0200
Tomer Maimon <tmaimon77@gmail.com> wrote:


> A few comments/input:
> 
> 
>    1. We have been working on this driver for quite a long time to port it
>    to the latest Linux conventions, polish the code, run tests and reach high
>    quality.
>    Our partners and customers are waiting to get this driver upstream so
>    they can freely use it.

Your patch prefix says "v1", so I'm assuming this is the first public
version. I'm sure you spent a lot of time developing this driver
internally, but no matter how long it took, it's a first version for
us, and since we are moving away from the spi_nor controller interface,
I'm not willing to accept new drivers using this interface.

If you want more background about the spi_nor controller interface
deprecation, you can read [1].

>    Since this driver is already in final stages and is in very good shape
>    we will appreciate if you can review this specific driver/interface and
>    help us to upstream it.

Actually, I'd like to do it the other way around: let you rework the
driver to implement the spi-mem interface and review this version.
Otherwise I'll be reviewing things I don't intend to merge anyway.

>    2.  As for the new interface, we are open for any discussion and for
>    porting the driver as required.
>    We are unsure what is this specific interface and weather it really fits
>    a driver for a Flash Interface Controller module (rather than a SPI flash
>    device).

Didn't go through the code in details, but at first glance, it looks
like it would fit pretty well.

>    Is it possible to get a sample driver from another Flash Interface
>    Controller module that was ported to this new interface ?

We recently converted the atmel QSPI driver [2].

Regards,

Boris

[1]https://bootlin.com/blog/spi-mem-bringing-some-consistency-to-the-spi-memory-ecosystem/
[2]https://patchwork.kernel.org/project/spi-devel-general/list/?series=38347&state=*

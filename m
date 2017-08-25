From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] of: Restrict DMA configuration
Date: Fri, 25 Aug 2017 16:54:57 +0200
Message-ID: <20170825145457.GA17842@lst.de>
References: <0819179085df6c41c70e83a2c5c138b95c0386b3.1502468875.git.robin.murphy@arm.com> <82633e62b64e28dc18bc466319065b92faf2414f.1502468875.git.robin.murphy@arm.com> <CAL_JsqKW7nhkCDu4eEDCgdC87b0MLH1UFO8LvaH22BcJMBsY7w@mail.gmail.com> <6819c6ae-e898-3293-d8b0-7a80108d7628@arm.com> <CAL_Jsq+pDHbrpLDYUVu22tk4OtR9Di4vxZUozwWJDu2ebYSBdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+pDHbrpLDYUVu22tk4OtR9Di4vxZUozwWJDu2ebYSBdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Stefan Wahren <stefan.wahren@i2se.com>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>, Johan Hovold <johan@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 15, 2017 at 09:19:50AM -0500, Rob Herring wrote:
> > For the immediate issue at hand, I guess the alternative plan of attack
> > would be to stick a flag in struct bus_type for the bus drivers
> > themselves to opt into generic DMA configuration. That at least keeps
> > everything within the kernel (and come to think of it probably works
> > neatly for modular bus types as well).
> 
> I'm fine with the change as is, it's really just the commit text I'm
> commenting on.

Robin, can you resend this with an updated commit text?

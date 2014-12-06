From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Sat, 6 Dec 2014 14:55:33 +0100
Message-ID: <20141206135533.GA19672@amd>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com>
 <1414007405-32186-3-git-send-email-atull@opensource.altera.com>
 <20141024105200.GA20775@amd>
 <B914D894-E486-4EF1-8F84-169E939C58B4@konsulko.com>
 <alpine.DEB.2.02.1410240906340.23446@atx-linux-37>
 <CACxGe6tiLxbCThzjOqrQg44Ue3XJuuRgti5jZY=UrssSY8=xqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6tiLxbCThzjOqrQg44Ue3XJuuRgti5jZY=UrssSY8=xqg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: atull <atull@opensource.altera.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Ira Snyder <iws@ovro.caltech.edu>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason <jason@lakedaemon.net>, kyle.teske@ni.com, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, David Brown <davidb@codeaurora>
List-Id: devicetree@vger.kernel.org

Hi!

> > I am accustomed to doing 'echo -n' for most of sysfs anyway.  Once in a
> > while I am a bonehead and forget the '-n' and spend a few minutes
> > wondering why this thing that worked last week suddenly rejects all
> > commands.  I'm just trying to make my user interface a bit user-friendly.
> >
> > I will take out the '\n' stripping and update the documentation.  I didn't
> > realize this would be controversial.
> 
> Don't. You're doing the right thing by scrubbing your input. Requiring
> 'echo -n' is just stupid when it is so easy to make work easily.

'foo\nbar\n' is unusual but valid filename in linux. It is bad idea to
echo filenames into files in the first place... and arbitrarily
disallowing certain filenames is not helping.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

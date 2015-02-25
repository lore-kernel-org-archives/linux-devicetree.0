From: Pavel Machek <pavel@denx.de>
Subject: Re: SPDX-License-Identifier
Date: Wed, 25 Feb 2015 22:49:51 +0100
Message-ID: <20150225214950.GB29527@amd>
References: <20140220182257.GF23217@saruman.home>
 <5306F458.9010706@monstr.eu>
 <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
 <54CF9B12.2070807@denx.de>
 <20150202160622.GA9852@kroah.com>
 <54D24BA4.3070509@denx.de>
 <20150205064130.GB22075@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150205064130.GB22075@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Roese <sr@denx.de>, monstr@monstr.eu, balbi@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Denk <wd@denx.de>
List-Id: devicetree@vger.kernel.org

Hi!

> > >Is one tag per directory sufficient?  Is one tag per file sufficient?
> > >How about one tag per package?  If package, then isn't a single tag for
> > >the whole kernel source tree sufficient, as we all know the overall
> > >license for the kernel source tree.
> > 
> > We really need one tag per file.
> 
> I fail to see the justification for this, why?  Why not per directory?
> Why not per function?  Why not per driver?  Why not per line?  Why not
> per project?  Who has dictated this seemingly arbitrary rule?

That's how licenses are done today.

Why would I like to see SPDX?

So that GPL header at begining of each file becomes one line... and so
that if it is BSD/GPL dual licensed is plain to see, and I don't have
to read the notices saying "oh this is gpl.. but if you want to,
delete gpl above and use license below".

> Our DCO process ensures that.
> 
> > - Some parts of the Linux source code are also used by other projects.
> >   Or are derived from other projects. Because of this they are
> >   explicitly licensed under different licenses than the GPLv2
> >   (compatible to it though of course). Or are dual-licensed. So that
> >   they can be used by these other projects.
> 
> That's fine, we encourage that and want to see that happen.  How will
> SPDX change that at all?  It's obvious as to the license of the files
> that this happens with, why do anything extra?

Well, sometimes parsing license agreements at the top of file is
interesting, that's where SPDX would help, and that's why having
single SPDX per linux kernel would not work.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

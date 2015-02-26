From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: SPDX-License-Identifier
Date: Thu, 26 Feb 2015 08:39:15 -0500
Message-ID: <20150226133915.GE11217@thunk.org>
References: <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
 <54CF9B12.2070807@denx.de>
 <20150202160622.GA9852@kroah.com>
 <54D24BA4.3070509@denx.de>
 <20150205064130.GB22075@kroah.com>
 <20150225214950.GB29527@amd>
 <20150226102650.7407cf02@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150226102650.7407cf02@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Pavel Machek <pavel@denx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Roese <sr@denx.de>, monstr@monstr.eu, balbi@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Denk <wd@denx.de>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 26, 2015 at 10:26:50AM +0000, One Thousand Gnomes wrote:
> > So that GPL header at begining of each file becomes one line... and so
> > that if it is BSD/GPL dual licensed is plain to see, and I don't have
> > to read the notices saying "oh this is gpl.. but if you want to,
> > delete gpl above and use license below".
> 
> That won't happen though. You'd require every single corporate legal
> department of every large company that touched the file to agree that the
> SPDX was equivalent to the content, and some of them probably won't.
> Lawyers don't seem to believe in #include <legalese.h>

I can confirm that some lawyers, including some that work for large
companies, are concerned that an SPDX-* header is equivalent to a
copyright statement and copyright permission statement.  More
precisely, there is no legal cases on point with respect to that
particular question, and how this situation might be interpreted in
different legal systems is going to be a matter of judgement.
Morever, consider that people can easily fetch a single file out of a
git repository by referencing some URL such as:

https://git.kernel.org/cgit/fs/ext2/e2fsprogs.git/plain/contrib/e2croncheck

... so if the only place where the formal language which is in some
top-level COPYING file, it might be quite easy for a potential
infringer to claim that they didn't know about what "SPDX" and "GPL"
meant, and thus they couldn't be held responsible.

Some folks might be a bit more comfortable if at the very least there
is at least a Copyright claim, without the the full license, or at
least something like "This file may only be copied under the terms of
the license found at <URL of License", but honestly, is the effort
needed to change how we display the copyright permission statement
really worth the effort?

						- Ted

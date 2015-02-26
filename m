From: Pavel Machek <pavel@denx.de>
Subject: Re: SPDX-License-Identifier
Date: Thu, 26 Feb 2015 22:49:49 +0100
Message-ID: <20150226214949.GA10204@amd>
References: <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
 <54CF9B12.2070807@denx.de>
 <20150202160622.GA9852@kroah.com>
 <54D24BA4.3070509@denx.de>
 <20150205064130.GB22075@kroah.com>
 <20150225214950.GB29527@amd>
 <20150225220047.GS11136@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150225220047.GS11136@saruman.tx.rr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Roese <sr@denx.de>, monstr@monstr.eu, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Denk <wd@denx.de>
List-Id: devicetree@vger.kernel.org

On Wed 2015-02-25 16:00:47, Felipe Balbi wrote:
> On Wed, Feb 25, 2015 at 10:49:51PM +0100, Pavel Machek wrote:
> > Hi!
> > 
> > > > >Is one tag per directory sufficient?  Is one tag per file sufficient?
> > > > >How about one tag per package?  If package, then isn't a single tag for
> > > > >the whole kernel source tree sufficient, as we all know the overall
> > > > >license for the kernel source tree.
> > > > 
> > > > We really need one tag per file.
> > > 
> > > I fail to see the justification for this, why?  Why not per directory?
> > > Why not per function?  Why not per driver?  Why not per line?  Why not
> > > per project?  Who has dictated this seemingly arbitrary rule?
> > 
> > That's how licenses are done today.
> > 
> > Why would I like to see SPDX?
> > 
> > So that GPL header at begining of each file becomes one line... and so
> > that if it is BSD/GPL dual licensed is plain to see, and I don't have
> > to read the notices saying "oh this is gpl.. but if you want to,
> > delete gpl above and use license below".
> 
> why isn't git grep -e 'MODULE_LICENSE' enough ? It's also a single line
> and gives you the license for that driver.
> 
> > > Our DCO process ensures that.
> > > 
> > > > - Some parts of the Linux source code are also used by other projects.
> > > >   Or are derived from other projects. Because of this they are
> > > >   explicitly licensed under different licenses than the GPLv2
> > > >   (compatible to it though of course). Or are dual-licensed. So that
> > > >   they can be used by these other projects.
> > > 
> > > That's fine, we encourage that and want to see that happen.  How will
> > > SPDX change that at all?  It's obvious as to the license of the files
> > > that this happens with, why do anything extra?
> > 
> > Well, sometimes parsing license agreements at the top of file is
> > interesting, that's where SPDX would help, and that's why having
> > single SPDX per linux kernel would not work.
> 
> if you can parse SPDX, why can't you parse MODULE_LICENSE() ?

Not all sources are modules. And yes, MODULE_LICENSE() helps, but spdx
would help, too: This would become one line.

								Pavel

 * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the
  * GNU
   * General Public License (GPL) Version 2, available from the file
    * COPYING in the main directory of this source tree, or the
     * OpenIB.org BSD license below:
      *
       *     Redistribution and use in source and binary forms, with
  * or
   *     without modification, are permitted provided that the
  * following
   *     conditions are met:
    *
     *      - Redistributions of source code must retain the above
      *        copyright notice, this list of conditions and the
  * following
   *        disclaimer.
    *
     *      - Redistributions in binary form must reproduce the above
      *        copyright notice, this list of conditions and the
  * following
   *        disclaimer in the documentation and/or other materials
    *        provided with the distribution.
     *
      * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
  * KIND,
   * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  * OF
   * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  * HOLDERS
   * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
  * AN
   * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
     * SOFTWARE.
     



-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

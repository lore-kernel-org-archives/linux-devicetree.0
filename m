From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [Arm-netbook] getting allwinner SoC support upstream (was Re:
 Uploading linux (3.9.4-1))
Date: Thu, 6 Jun 2013 10:02:50 -0400
Message-ID: <20130606140250.GA4839@thunk.org>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
 <1370475609.20454.44.camel@localhost>
 <CAPweEDwS3tR=wh-bZJb3vqR8fVQra=3XxDitowGRdH9c7WRfmQ@mail.gmail.com>
 <1733666.lHUBcfUXq9@flatron>
 <CAPweEDzYLDzh_-OWU61dtVhajZ40QpQgZKHFYDsh3FgF=r9_ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPweEDzYLDzh_-OWU61dtVhajZ40QpQgZKHFYDsh3FgF=r9_ag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "luke.leighton" <luke.leighton@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>, devicetree-discuss <devicetree-discuss@ozlabs.org>, Stephen Warren <swarren@wwwdotorg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, debian-arm@lists.debian.org, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, debian-kernel@lists.debian.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2013 at 01:24:57PM +0100, luke.leighton wrote:
> On Thu, Jun 6, 2013 at 1:01 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> 
> > I don't see any other solution here than moving all the Allwinner code to
> > DT (as it has been suggested in this thread several times already), as
> > this is the only hardware description method supported by ARM Linux.
> 
>  i repeat again: please state, explicitly and unequivocably that you -
> linux kernel developers - are happy that the reach of linux and
> gnu/linux OSes is dramatically reduced due to this intransigent
> position.

But that's not a true statement.  You've said that Allwinner is
perfectly happy to carry code out of tree, by constantly porting their
hacks from mainline kernels.

For some of their customers, this will be acceptable to them.  In
those cases, Linux will still be in use.  Great!  So claiming that the
reach of Linux will be "dramatically reduced" just is not a
supportable position.

For other (potential) customers, for whom mainline kernel support is
critically important, they will choose other hardware solutions that
are in the mainline kernel.

I don't see the problem here.

						- Ted

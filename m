From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v2 11/14] MIPS: Malta: Use syscon-reboot driver to
 reboot
Date: Tue, 25 Oct 2016 11:55:49 +0100
Message-ID: <alpine.DEB.2.00.1610251003330.31859@tp.orcam.me.uk>
References: <20160919212132.28893-1-paul.burton@imgtec.com> <20160919212132.28893-12-paul.burton@imgtec.com> <alpine.DEB.2.00.1610220956020.31859@tp.orcam.me.uk> <2861325.0K2k6plxiD@np-p-burton>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2861325.0K2k6plxiD@np-p-burton>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, Stephan Linz <linz@li-pro.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Paul,

> >  This has broken reboot support, all I get now is:
> > 
> > reboot: Restarting system
> > Unable to restart system
> > Reboot failed -- System halted
> > 
> > at which point I need to issue a serial BREAK to regain control of the
> > board and get back to YAMON; fortunately the board is wired for that.
> 
> This was already reported over here:
> 
> https://www.linux-mips.org/archives/linux-mips/2016-10/msg00120.html 
> 
> These 2 patches fix it:
> 
> https://patchwork.linux-mips.org/patch/14395/ 
> https://patchwork.linux-mips.org/patch/14396/ 

 Thanks, good to know and sorry to raise a late alarm then.

 As it happens the board I've been fiddling with has been temporarily 
sitting idle, so I went ahead and verified that these changes have indeed 
removed the regression in my configuration.  So you've got a confirmation 
from a real Malta hardware user now too (QEMU may have its own quirks).

> I've asked Ralf if we can get those, along with a few others, in ASAP - 
> preferrably for -rc3.

 As these are fixes to a functional regression I also recommend merging 
them ASAP.

  Maciej

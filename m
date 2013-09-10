From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [GIT PULL] Device tree updates for v3.12
Date: Tue, 10 Sep 2013 18:19:39 -0400
Message-ID: <20130910221939.GC11063@thunk.org>
References: <CACxGe6v8hO4sRX_KGcH=YBAMrF8mQHqWdxXEvVwoC2pVS5Yv9Q@mail.gmail.com>
 <CA+bK7J5cAWFPLTBR2afNLm2JaKFH4_dJO_NpVL5gom0iX+L2dQ@mail.gmail.com>
 <CA+55aFzBbKXJnaG_6X8Fff_APGJ3EkbG0thsbithDXtiEJjdHA@mail.gmail.com>
 <CA+bK7J4F=X97HUQP6Tt8RkVe5vttE_Sw4Pd7kT19k_KGDFfpKA@mail.gmail.com>
 <CA+55aFwkAQGRo9mLa2GVeVgzToRZr=Ny8LTogzgOpO6_4BJY1Q@mail.gmail.com>
 <522F97EF.5050303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <522F97EF.5050303@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Tim Bird <tbird20d@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anton Blanchard <anton@samba.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2013 at 05:06:39PM -0500, Rob Herring wrote:
> > If I recall correctly, somebody said that things like ethernet MAC
> > addresses etc sometimes come from DT. Is my memory going, or is that
> > true but very rare?
> 
> It is true and fairly common. You can also have serial numbers in the
> DT, but that is more rare. The bootloader will also add the kernel
> command line, initrd start and end addresses.

Stuff which is common across a large number of devices is rather less
useful to merge in.  Is there some fixed way that things like serial
numbers and MAC addresses are tagged as such in the device tree?

Those are really the interesting bits to pass to
add_device_randomness().  What we want is stuff which is unique to the
device --- SP 800-90 (the NIST SPEC on Secure Random Number
Generators) refers to this as "personalization strings".

	    	      	      - Ted

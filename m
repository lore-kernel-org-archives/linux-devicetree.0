From: Tony Luck <tony.luck@gmail.com>
Subject: Re: [GIT PULL] Device tree updates for v3.12
Date: Wed, 11 Sep 2013 10:02:40 -0700
Message-ID: <CA+8MBbLVC2==zpNV1zV3OoiSQoKfptAGqF1EQNtrhFUCn=0h7A@mail.gmail.com>
References: <CACxGe6v8hO4sRX_KGcH=YBAMrF8mQHqWdxXEvVwoC2pVS5Yv9Q@mail.gmail.com>
	<CA+bK7J5cAWFPLTBR2afNLm2JaKFH4_dJO_NpVL5gom0iX+L2dQ@mail.gmail.com>
	<CA+55aFzBbKXJnaG_6X8Fff_APGJ3EkbG0thsbithDXtiEJjdHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFzBbKXJnaG_6X8Fff_APGJ3EkbG0thsbithDXtiEJjdHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Tim Bird <tbird20d@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2013 at 1:50 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> Of course, maybe even the stupid add_device_randomness() is fast
> enough. I just wanted to point out that it definitely isn't some
> optimized thing.

When I posted the patch that mixes in the whole SMBIOS table:

commit d114a33387472555188f142ed8e98acdb8181c6d
Author: Tony Luck <tony.luck@intel.com>
Date:   Fri Jul 20 13:15:20 2012 -0700

    dmi: Feed DMI table to /dev/random driver

I asked whether there was any size issue - as it tends to be a few
kilobytes on laptops and desktops, and tens of kilobytes on servers.
The answer I got back then was not to worry - digesting a few kilobytes
wouldn't be a problem.  I just threw in a debug message to check and saw:

dmi_walk_early: added 10342 bytes in 339968 cycles

So a couple of hundred microseconds for me.

There are plenty of machine specific values buried in there (e.g. serial
numbers for all the DIMMs) ... so this looks like a good use of this
much boot time.

-Tony

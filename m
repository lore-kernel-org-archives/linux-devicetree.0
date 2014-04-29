From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 00/21] FDT clean-ups and libfdt support
Date: Tue, 29 Apr 2014 15:00:48 +0100
Message-ID: <20140429140048.7C9D0C40992@trevor.secretlab.ca>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398215901-25609-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org, linux-ZwoEplunGu2h2975yA52AaxOck334EZe@public.gmane.org, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 22 Apr 2014 20:18:00 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> This is a series of clean-ups of architecture FDT code and converts the
> core FDT code over to using libfdt functions. This is in preparation
> to add FDT based address translation parsing functions for early
> console support. This series removes direct access to FDT data from all
> arches except powerpc.
> 
> The current MIPS lantiq and xlp DT code is buggy as built-in DTBs need
> to be copied out of init section. Patches 2 and 3 should be applied to
> 3.15.
> 
> Changes in v2 are relatively minor. There was a bug in the unflattening
> code where walking up the tree was not being handled correctly (thanks
> to Michal Simek). I re-worked things a bit to avoid globally adding
> libfdt include paths.
> 
> A branch is available here[1], and I plan to put into linux-next in a few
> days. Please test! I've compiled on arm, arm64, mips, microblaze, xtensa,
> and powerpc and booted on arm and arm64.

This is pretty great work. I'll read through them again and I may have a
comment or two, but in general you can add my tested by tag:

Tested-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>  40 files changed, 280 insertions(+), 598 deletions(-)

I love the diffstat!

g.
--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

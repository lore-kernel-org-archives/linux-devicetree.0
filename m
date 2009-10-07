From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: [RFC PATCH 00/12] Merge common OpenFirmware device tree code
Date: Wed, 7 Oct 2009 02:09:58 -0500
Message-ID: <200910070209.59311.rob@landley.net>
References: <20091007041007.16890.62194.stgit@angua> <fa686aa40910062149p5d7141e4x3ff849fd4d191f38@mail.gmail.com>
Reply-To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org>
In-Reply-To: <fa686aa40910062149p5d7141e4x3ff849fd4d191f38-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 06 October 2009 23:49:04 Grant Likely wrote:
>
> However, I've completely devoted to this work for at least the next
> two months, so there are plenty more patches to follow.  Once I've
> got all the common code merged between Microblaze, PowerPC and Sparc
> I'll be fix the endian problems and making it easily usable by other
> architectures like ARM and MIPS.  Lots of work to be done.

Is there any news on getting QEMU to parse a device tree to figure out what 
hardware to emulate?  (I.E. using the device tree code to let qemu provide 
configurable board emulations instead of hardwiring them in C code?)

Also, what would be involved in getting x86 to (at least have the option to) 
use the device tree stuff?

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds

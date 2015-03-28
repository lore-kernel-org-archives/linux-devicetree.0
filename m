From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V6] kbuild: dtbs_install: new make target
Date: Sat, 28 Mar 2015 15:58:22 +0000
Message-ID: <20150328155822.GA25778@io.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <1385942188-21831-1-git-send-email-jason@lakedaemon.net>
 <20150328132320.GA24391@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150328132320.GA24391-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Russell,

On Sat, Mar 28, 2015 at 01:23:20PM +0000, Russell King - ARM Linux wrote:
> Okay, I'm digging up an old version of this patch - v7 was merged but
> I find *nowhere* where that version was posted to people involved in
> this discussion.

fwiw, I just went through my archive of patch submissions:

$ ls ~/projects/linux/dtbs_install/
v2  v3  v4  v5  v6
$

I never wrote a v7.  :-(  Regardless,

> The reason is that I would've commented on v7, because of this stupid
> thing (which is now in scripts/Makefile.dtbsinst):
> 
> +       $(Q)if [ -d $(INSTALL_DTBS_PATH).old ]; then rm -rf $(INSTALL_DTBS_PATH).old; fi
> +       $(Q)if [ -d $(INSTALL_DTBS_PATH) ]; then mv $(INSTALL_DTBS_PATH) $(INSTALL_DTBS_PATH).old; fi
> +       $(Q)mkdir -p $(INSTALL_DTBS_PATH)
> 
> What gives any kernel installation target the right to move a directory
> out of the way?
> 
> Let's say that you do this:
> 
> 	make install INSTALL_PATH=$sys_root/boot
> 	make dtbs_install INSTALL_DTBS_PATH=$sys_root/boot
> 
> The result is that dtbs_install thinks it has the right to rename that
> boot directory to boot.old, create a new one, and place the DTBs in
> there, thereby leaving you with no kernel to boot - and if you run it
> again, it _deletes_ the original directory.
> 
> No *other* kernel install target has this behaviour, not even 'make
> modules_installl'.  This is stupid and dangerous behaviour.  At the
> very least, this behaviour should be *well* documented.

you are correct.  This should be fixed.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

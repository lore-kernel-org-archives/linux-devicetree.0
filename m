From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC DTC PATCH] dtc: add symlink (-L) output to dtbs
Date: Fri, 15 Nov 2013 21:12:15 +0900
Message-ID: <20131115121215.901EFC40885@trevor.secretlab.ca>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384201760-16785-1-git-send-email-jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 11 Nov 2013 20:29:20 +0000, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> Consumers of the Linux kernel's build products are beginning to hardcode
> the filenames of the dtbs generated.  Since the dtb filenames are
> currently the dts filename s/dts/dtb/, this prevents the kernel
> community from renaming dts files as needed.
> 
> Let's provide a consistent naming structure for consumers to script
> against.  Or at least, as consistent as the dts properties themselves.
> 
> With this patch, adding the '-L' option to the dtc commandline will
> cause dtc to create a symlink to the generated dtb, using the board
> compatible string as the filename, eg:
> 
>   globalscale,mirabox.dtb -> armada-370-mirabox.dtb

This whole thread is just crazy. The filename is not an ABI. Anything
digging into the kernel build tree is a) wrong, and b) userspace tooling
consuming the kernel build products which is /not/ ABI and can be changed

If we want to have a tool or script for creating a well formed directory
full of .dtb files because it would be helpful to U-Boot or something
else, then that is fine. Make it part of the "make install" path.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [git pull] Devicetree changes for v3.15
Date: Fri, 26 Sep 2014 14:30:53 +0200
Message-ID: <CACRpkdZoo=P7uTO1rNDD_HUPjfAk26C0=mNYPoZmTV0wcO3V-w@mail.gmail.com>
References: <CACxGe6vCrkHPL6UNy1p8AO4+z5VFRY6w4_2grQEZQwp_3jJ7Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6vCrkHPL6UNy1p8AO4+z5VFRY6w4_2grQEZQwp_3jJ7Yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 1, 2014 at 12:15 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:

> Here are the dt changes I've got queued up for v3.15. The full
> description is below in the tag. Please pull.
(...)
> Jason Cooper (1):
>       kbuild: dtbs_install: new make target

After this patch a while back I have observed the following behaviour
of the kernel build:

make zImage
make zImage
-> incremental build, just relink

make zImage
make dtbs
make zImage
-> The whole kernel gets rebuilt

So now if I happen to recompile my device trees, I suddenly want
the entire zImage to be rebuilt to? It's by definition not changes that
affect the kernel build :-(

I noticed this because my build scripts calls make dtbs && make zImage,
and started to rebuild absolutely everything all the time.

Do you think this can be fixed? It's quite simple to reproduce...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

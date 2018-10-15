From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: overlay: user space synchronization
Date: Mon, 15 Oct 2018 10:24:20 +0200
Message-ID: <CAMuHMdXad2g5zEZ8=XzzVgfijcatKYj5AjwVQg=W-by_rHfcAQ@mail.gmail.com>
References: <1539567282-1326-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539567282-1326-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Mon, Oct 15, 2018 at 3:36 AM <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> When an overlay is applied or removed, the live devicetree visible in
> /proc/device-tree/, aka /sys/firmware/devicetree/base/, reflects the
> changes.  There is no method for user space to determine whether the
> live devicetree was modified by overlay actions.
>
> Provide a sysfs file, /sys/firmware/devicetree/tree_version,  to allow
> user space to determine if the live devicetree has remained unchanged
> while a series of one or more accesses of /proc/device-tree/ occur.

Thanks for your patch!

> The use of both dynamic devicetree modifications and overlay apply and
> removal are not supported during the same boot cycle.  Thus non-overlay
> dynamic modifications are not reflected in the value of tree_version.

What does this mean exactly, for users?
I am used to applying and removing overlays at run time (still
carrying Pantelis'
overlay configfs patches), but when would I use non-overlay dynamic
modifications?

> --- a/Documentation/ABI/testing/sysfs-firmware-ofw
> +++ b/Documentation/ABI/testing/sysfs-firmware-ofw
>
> +What:          /sys/firmware/devicetree/tree_version
> +Date:          October 2018
> +KernelVersion: 4.20
> +Contact:       Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
> +Description:
> +               When an overlay is applied or removed, the live devicetree
> +               visible in /proc/device-tree/, aka
> +               /sys/firmware/devicetree/base/, reflects the changes.
> +
> +               tree_version provides a way for user space to determine if the
> +               live devicetree has remained unchanged while a series of one
> +               or more accesses of /proc/device-tree/ occur.
> +
> +               The use of both dynamic devicetree modifications and overlay
> +               apply and removal are not supported during the same boot
> +               cycle.  Thus non-overlay dynamic modifications are not
> +               reflected in the value of tree_version.
> +
> +               Example shell use of tree_version:
> +
> +               done=1
> +
> +               while [ $done = 1 ] ; do
> +
> +                  pre_version=$(cat /sys/firmware/devicetree/tree_version)
> +                  version=$pre_version
> +                  while [ $(( ${version} & 1 )) != 0 ] ; do
> +                     # echo is optional, sleep value can be tuned
> +                     echo "${version}  sleeping"
> +                     sleep 2;
> +                     pre_version=$(cat /sys/firmware/devicetree/tree_version)
> +                     version=${pre_version}
> +                  done
> +
> +                  # 'critical region'
> +                  # access /proc/device-tree/ one or more times
> +
> +                  post_version=$(cat /sys/firmware/devicetree/tree_version)
> +
> +                  if [ ${post_version} = ${pre_version} ] ; then
> +                     done=0
> +                  fi
> +
> +               done

Please say explicitly that tree_version contains a 32-bit unsigned
decimal number, which is incremented before and after every change.
I had to deduce that from the code.

IMHO that is more important than having the sample script here.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

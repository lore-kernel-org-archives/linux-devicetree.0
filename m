From: Alan Tull <atull@kernel.org>
Subject: Re: [PATCH] of: overlay: user space synchronization
Date: Tue, 16 Oct 2018 14:39:21 -0500
Message-ID: <CANk1AXRNKY8eAxXNtOXiWYZ00-mnzvPFMaixS-fXD=zu9C1UNw@mail.gmail.com>
References: <1539567282-1326-1-git-send-email-frowand.list@gmail.com>
 <CAMuHMdXad2g5zEZ8=XzzVgfijcatKYj5AjwVQg=W-by_rHfcAQ@mail.gmail.com>
 <e69685d5-e09f-5f7d-2ff0-7ead12500371@gmail.com> <CANk1AXQU=3Ap=wbO5b8c2pMq61hzuRkeWYNv2Esq+c9d+0e_BA@mail.gmail.com>
 <3635be33-7301-ecd5-5966-24b0494771ef@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3635be33-7301-ecd5-5966-24b0494771ef@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 15, 2018 at 7:04 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 10/15/18 13:38, Alan Tull wrote:
> > On Mon, Oct 15, 2018 at 1:09 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>
> >> On 10/15/18 01:24, Geert Uytterhoeven wrote:
> >>>
> >>> Please say explicitly that tree_version contains a 32-bit unsigned
> >>> decimal number, which is incremented before and after every change.
> >>> I had to deduce that from the code.
> >>
> >> Good point.  I'll add that.
> >
> > Looking at the code, tree_version being odd or even means something.
> > tree_version is incremented every time the of_mutex is locked or
> > unlocked, such that:
> >  * tree_version is odd  == of_mutex is locked and the tree is
> > currently be in the process of being changed
> >  * tree_version is even == of_version is unlocked again and the
> > changes are finished.
> >
> > How about making this explicit in the interface by breaking it up into
> > two attributes:
> >
> > /sys/firmware/devicetree/tree_lock == "locked" or "unlocked".  If the
> > tree is locked, you know that the tree may still be changing and the
> > sysfs can't be trusted to be stable yet.  Or maybe even more
> > specifically tree_overlay_lock?
> >
> > /sys/firmware/devicetree/tree_version = a u32 that is incremented once
> > for every overlay added or removed.
>
> I like the extra clarity of purpose that having two attributes provides,
> but it makes the user space dance more difficult.
>
> With a single attribute, the shell code is (updated from the patch
> to remove the variable "version"):
>
>         done=1
>
>         while [ $done = 1 ] ; do
>
>                 pre_version=$(cat /sys/firmware/devicetree/tree_version)
>                 while [ $(( ${pre_version} & 1 )) != 0 ] ; do
>                         # echo is optional, sleep value can be tuned
>                         echo "${pre_version}  tree locked, sleeping"
>                         sleep 2;
>                         pre_version=$(cat /sys/firmware/devicetree/tree_version)
>                 done
>
>                 # 'critical region'
>                 # access /proc/device-tree/ one or more times
>
>                 post_version=$(cat /sys/firmware/devicetree/tree_version)
>
>                 if [ ${post_version} = ${pre_version} ] ; then
>                         done=0
>                 fi
>
>         done
>
> With two attributes, the shell code is:
>
>
>         done=1
>
>         while [ $done = 1 ] ; do
>
>                 # the order of the next three lines must not change
>                 version=$(cat /sys/firmware/devicetree/tree_version)
>                 pre_version=${version}
>                 tree_lock=$(cat /sys/firmware/devicetree/tree_lock)
>                 while [ tree_lock != "unlocked" ] ||
>                       [ ${version} != ${pre_version} ] ; do
>                         # echo is optional, sleep value can be tuned
>                         echo "locked, sleeping"
>                         sleep 2;
>                         # the order of the next two lines must not change
>                         pre_version=${version}
>                         tree_lock=$(cat /sys/firmware/devicetree/tree_lock)
>                         version=$(cat /sys/firmware/devicetree/tree_version)
>                 done
>
>                 # 'critical region'
>                 # access /proc/device-tree/ one or more times
>
>                 # the order of the next two lines must not change
>                 post_version=$(cat /sys/firmware/devicetree/tree_version)
>                 tree_lock=$(cat /sys/firmware/devicetree/tree_lock)
>
>                 if [ ${tree_lock} = "unlocked" ] &&
>                    [ ${post_version} = ${pre_version} ] ; then
>                         done=0
>                 fi
>
>         done
>
>
> The two attribute example is untested, could have syntax errors, etc.
> I'm also not sure that the logic is correct.
>
> My opinion is that the extra shell complexity makes the two attribute
> solution worse.

Yes, I can see that now and agree with you here.  Thanks for giving
the idea consideration.  I'll review your v2 .

Alan

>
> -Frank
>
>
> >
> > Alan
> >
> >
> >>
> >>
> >>>
> >>> IMHO that is more important than having the sample script here.
> >>>
> >>> Gr{oetje,eeting}s,
> >>>
> >>>                         Geert
> >>>
> >>
> >

From: Alan Tull <atull@kernel.org>
Subject: Re: [PATCH] of: overlay: user space synchronization
Date: Mon, 15 Oct 2018 15:38:55 -0500
Message-ID: <CANk1AXQU=3Ap=wbO5b8c2pMq61hzuRkeWYNv2Esq+c9d+0e_BA@mail.gmail.com>
References: <1539567282-1326-1-git-send-email-frowand.list@gmail.com>
 <CAMuHMdXad2g5zEZ8=XzzVgfijcatKYj5AjwVQg=W-by_rHfcAQ@mail.gmail.com> <e69685d5-e09f-5f7d-2ff0-7ead12500371@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e69685d5-e09f-5f7d-2ff0-7ead12500371@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 15, 2018 at 1:09 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 10/15/18 01:24, Geert Uytterhoeven wrote:
> >
> > Please say explicitly that tree_version contains a 32-bit unsigned
> > decimal number, which is incremented before and after every change.
> > I had to deduce that from the code.
>
> Good point.  I'll add that.

Looking at the code, tree_version being odd or even means something.
tree_version is incremented every time the of_mutex is locked or
unlocked, such that:
 * tree_version is odd  == of_mutex is locked and the tree is
currently be in the process of being changed
 * tree_version is even == of_version is unlocked again and the
changes are finished.

How about making this explicit in the interface by breaking it up into
two attributes:

/sys/firmware/devicetree/tree_lock == "locked" or "unlocked".  If the
tree is locked, you know that the tree may still be changing and the
sysfs can't be trusted to be stable yet.  Or maybe even more
specifically tree_overlay_lock?

/sys/firmware/devicetree/tree_version = a u32 that is incremented once
for every overlay added or removed.

Alan


>
>
> >
> > IMHO that is more important than having the sample script here.
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
>

From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH 2/2] of/platform: Disable generic device linking code for PowerPC
Date: Thu, 15 Aug 2019 19:04:15 -0700
Message-ID: <CAGETcx8K2Ob7f7wchP6Z7Y=XGgX3h535ty62x6b-13-giGyZgA@mail.gmail.com>
References: <20190806192654.138605-1-saravanak@google.com> <20190806192654.138605-2-saravanak@google.com>
 <CAL_Jsq+BwHSj1XUNp_eY362XnNoOqVTNHqAkvnbgece8ZQE3Qw@mail.gmail.com>
 <CAGETcx8+EETv6nSu+BEBStKvbmBs+tZZgo1u_Pw8SNu+7Urq1Q@mail.gmail.com> <CAL_JsqLdcn5aZdenLs3RSVCOE1PRNK_qYNmQR=fXPV+ZOQ9+PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLdcn5aZdenLs3RSVCOE1PRNK_qYNmQR=fXPV+ZOQ9+PQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Android Kernel Team <kernel-team@android.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 4:41 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Aug 6, 2019 at 4:04 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Tue, Aug 6, 2019 at 2:27 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Tue, Aug 6, 2019 at 1:27 PM Saravana Kannan <saravanak@google.com> wrote:
> > > >
> > > > PowerPC platforms don't use the generic of/platform code to populate the
> > > > devices from DT.
> > >
> > > Yes, they do.
> >
> > No they don't. My wording could be better, but they don't use
> > of_platform_default_populate_init()
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/of/platform.c#n511
>
> Right, but the rest of the of/platform code is used (guess where it
> got moved here from?).
>
> > > > Therefore the generic device linking code is never used
> > > > in PowerPC.  Compile it out to avoid warning about unused functions.
> > >
> > > I'd prefer this get disabled on PPC using 'if (IS_ENABLED(CONFIG_PPC))
> > > return' rather than #ifdefs.
> >
> > I'm just moving the existing ifndef some lines above. I don't want to
> > go change existing #ifndef in this patch. Maybe that should be a
> > separate patch series that goes and fixes all such code in drivers/of/
> > or driver/
>
> So the initcall was originally just supposed to call
> of_platform_default_populate(), but it's grown beyond that. That could
> make things fragile as it is possible for platforms to call
> of_platform_populate() (directly or indirectly) before
> of_platform_default_populate_init(). That was supposed to work, but
> now I think it's getting more fragile.

Can you clarify what's wrong with of_platfrom_populate() being called
before of_platform_default_populate_init()? If that's what a platform
wants to do, they can do it? I have some thoughts of my own, but I
want to hear yours.
In any case, I'd be happy to help  clean up this initcall if you can
give me a direction to take it in.

> Anyways, I guess this patch is fine for now.

Thanks.

-Saravana

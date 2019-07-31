From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] of/platform: Add missing const qualifier in
 of_link_property
Date: Wed, 31 Jul 2019 13:37:14 -0700
Message-ID: <20190731203714.GA41488@archlinux-threadripper>
References: <20190729221101.228240-4-saravanak@google.com>
 <20190731181733.60422-1-natechancellor@gmail.com>
 <CAGETcx9LXP9b_W_1XQFmjODPJVrbnU+vH1RKer2i=jU7Q7EADg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGETcx9LXP9b_W_1XQFmjODPJVrbnU+vH1RKer2i=jU7Q7EADg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: David Collins <collinsd@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Android Kernel Team <kernel-team@android.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, kbuild test robot <lkp@intel.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 01:33:40PM -0700, Saravana Kannan wrote:
> On Wed, Jul 31, 2019 at 11:19 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Clang errors:
> >
> > drivers/of/platform.c:632:28: error: initializing 'struct
> > supplier_bindings *' with an expression of type 'const struct
> > supplier_bindings [4]' discards qualifiers
> > [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> >         struct supplier_bindings *s = bindings;
> >                                   ^   ~~~~~~~~
> > 1 error generated.
> >
> > Fixes: 05f812549f53 ("of/platform: Add functional dependency link from DT bindings")
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > Given this is still in the driver-core-testing branch, I am fine with
> > this being squashed in if desired.
> >
> >  drivers/of/platform.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index e2da90e53edb..21838226d68a 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -629,7 +629,7 @@ static bool of_link_property(struct device *dev, struct device_node *con_np,
> >                              const char *prop)
> >  {
> >         struct device_node *phandle;
> > -       struct supplier_bindings *s = bindings;
> > +       const struct supplier_bindings *s = bindings;
> >         unsigned int i = 0;
> >         bool done = true, matched = false;
> 
> Odd. I never got that email. Thanks for fixing this. I'll squash it
> into my patch series since I have a bunch of other kbuild errors about
> documentation.
> 
> -Saravana

It was a clang only email (which currently just get sent to our
clang-built-linux mailing list as there is a lot of overlap with GCC).

Not sure why there was no GCC email about this but oh well. Thanks for
picking it up!

Cheers,
Nathan

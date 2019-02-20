From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/9] iio: document bindings for mounting matrices
Date: Wed, 20 Feb 2019 22:34:11 +0100
Message-ID: <CACRpkdbSsOcem+_JZNXvjC9KA-F-+O40aAnLUq0CcrO25YCQuQ@mail.gmail.com>
References: <cover.1550671256.git.hns@goldelico.com> <a1fcef308d9193cac33cda2420b6df5000cfc9c7.1550671256.git.hns@goldelico.com>
 <20190220161017.35f2f3a4@archlinux> <49606C25-608D-4F77-8038-E2C7A11B861D@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <49606C25-608D-4F77-8038-E2C7A11B861D@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Gregor Boirie <gregor.boirie@parrot.com>, Sebastian Reichel <sre@kernel.org>, Samu Onkalo <samu.onkalo@intel.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 5:18 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> > Am 20.02.2019 um 17:10 schrieb Jonathan Cameron <jic23@kernel.org>:
> > On Wed, 20 Feb 2019 15:00:48 +0100
> > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > Hmm. I looked back and seems there were still some outstanding questions
> > on this last time around.
> >
> > https://lore.kernel.org/linux-iio/a6d866f2-ee20-282b-def0-f65de2177aee@kernel.org/
> >
> > Particularly hard as ever to define the magnetic planes when near the
> > magnetic poles when in 3D.
> >
> > That needs cleaning up ideally before we apply this.

I agree. I guess I ran out of steam somewhere when I had to
look around for my linear algebra textbooks and course notes
and I could not find them :D

> Agreed. I already placed my proposal for improvement on top of that,
> but I did not try to solve the magnetic planes issue.
>
> Maybe Linus could squeeze the patches and edit a new one that solves
> all issues.

Oh I trust you 100% to do the right thing with this, just edit it and
sign it off a second time. Whatever becomes the author is not
something I care much about either, whatever makes sense
to you.

Yours,
Linus Walleij

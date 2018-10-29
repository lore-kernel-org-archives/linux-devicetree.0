From: Rob Herring <robherring2@gmail.com>
Subject: Re: [GIT PULL] Devicetree updates for 4.20
Date: Mon, 29 Oct 2018 07:44:31 -0500
Message-ID: <CAL_JsqLgbGDHPFp2kW2tRT3iQwV9dU+NRVB4YzoS-7p+9GZHnQ@mail.gmail.com>
References: <CAL_JsqJKkPiHBbJWMF5=JzxZyO+UTN0qLFLnjvd9txkUQPdznw@mail.gmail.com>
 <CAOesGMh=iJ-LE25ooVmoSVD7Rw9AzrJhXbP2X4+OeeUwmV5HnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMh=iJ-LE25ooVmoSVD7Rw9AzrJhXbP2X4+OeeUwmV5HnQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2018 at 12:25 AM Olof Johansson <olof@lixom.net> wrote:
>
> Hi Rob,
>
> On Fri, Oct 26, 2018 at 9:07 AM Rob Herring <robherring2@gmail.com> wrote:
> >
> > Linus,
> >
> > Please pull DT updates for 4.20. A bit bigger than normal as I've been
> > busy this cycle. There's a few things with dependencies and a few
> > things subsystem maintainers didn't pick up, so I'm taking them thru
> > my tree. The fixes from Johan didn't get into linux-next, but they've
> > been waiting for some time now and they are what's left of what
> > subsystem maintainers didn't pick up. There's no conflicts yet with
> > your tree, but there are 2 conflicts I'm aware of. One is with the c6x
> > tree and the other is in drivers/soc/qcom/apr.c. The correct
> > resolutions are in linux-next.
> >
> [...]
>
> >       scripts/dtc: Update to upstream version v1.4.7-14-gc86da84d30e4
>
> This update made dtc spit out a large number of warnings on a regular
> build, due to a new requirement that a SPI node is named "spi". Seems
> like an arbitrary restriction, but either way can the warning please
> be disabled by default until them cleaned up so we don't have a bunch
> of noise in the logs?

All the fixes are sitting in your tree. :)

Rob

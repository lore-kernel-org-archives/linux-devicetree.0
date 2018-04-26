From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 6/7] dt-bindings: gnss: add sirfstar binding
Date: Thu, 26 Apr 2018 11:12:00 +0200
Message-ID: <20180426091200.GV4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424163458.11947-7-johan@kernel.org>
 <CAL_Jsq+nj9P5z=Ao=UbS-AKy+qeM98EFJiHmYgoniD_4N3Hr4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+nj9P5z=Ao=UbS-AKy+qeM98EFJiHmYgoniD_4N3Hr4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 25, 2018 at 01:25:26PM -0500, Rob Herring wrote:
> On Tue, Apr 24, 2018 at 11:34 AM, Johan Hovold <johan@kernel.org> wrote:
> > Add binding for SiRFstar-based GNSS receivers.
> >
> > Note that while four compatible-strings are initially added representing
> > devices which differ in which I/O interfaces they support, they
> > otherwise essentially share the same feature set.
> >
> > Pin and supply names (and some recommended timings) vary slightly, but
> > the binding recommends using a common set of names.
> >
> > Note that the wakeup gpio is not intended to be as a wakeup source, but
> > rather to detect the current power state of the device (active or
> > hibernate).
> >
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  .../devicetree/bindings/gnss/sirfstar.txt     | 38 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.txt   |  3 ++
> >  2 files changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gnss/sirfstar.txt
> 
> One nit below, otherwise:
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

> > @@ -390,6 +392,7 @@ vivante     Vivante Corporation
> >  vocore VoCore Studio
> >  voipac Voipac Technologies s.r.o.
> >  vot    Vision Optical Technology Co., Ltd.
> > +wi2wi  Wi2Wi
> 
> Wrong spot.

Duh. I had first misspelled this w2wi (which happens to be a different
company), and then forgot to move the entry when I corrected my mistake.

> >  wd     Western Digital Corp.
> >  wetek  WeTek Electronics, limited.
> >  wexler Wexler

Thanks,
Johan

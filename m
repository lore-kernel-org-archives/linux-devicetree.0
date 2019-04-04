From: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 1/4] ARM: davinci: fix cpufreq registration on da850-evm
Date: Thu, 4 Apr 2019 06:14:32 -0500
Message-ID: <CAHCN7x+kAPYgFJ9iZQTPm2Vypni4CgmWmBw96fgbQr0ch456bw@mail.gmail.com>
References: <20190322133105.5945-1-brgl@bgdev.pl> <20190322133105.5945-2-brgl@bgdev.pl>
 <CAHCN7xJj_aA8XFR6=ZxO-WrfkJRY5fS6NgjHbeqpdfhUnn1apA@mail.gmail.com>
 <CAMpxmJVBTny7kzADSZHQXk_ZUjnRaNWu0Ly3WC8v+zPmR8Dizg@mail.gmail.com>
 <bb734e20-d2c7-73f4-e2c5-3b810ccf4c81@ti.com> <CAMRc=MdYhaED30Xu8oJiJD7F9z=SPu6u+1p32mQnX0tEL=iOiA@mail.gmail.com>
 <CAHCN7x+-GRBygMt9APi9sf19PQksfmXk9sOZUo-1YY40RhUmng@mail.gmail.com> <CAMRc=Md-XtFYP_c4afNDHdYDUV77tGpvau8AsG1KGwQ6Hm+FhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Md-XtFYP_c4afNDHdYDUV77tGpvau8AsG1KGwQ6Hm+FhQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 4, 2019 at 5:01 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> =C5=9Br., 3 kwi 2019 o 17:49 Adam Ford <aford173@gmail.com> napisa=C5=82(=
a):
> >
> > On Wed, Apr 3, 2019 at 7:50 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > >
> > > =C5=9Br., 27 mar 2019 o 12:14 Sekhar Nori <nsekhar@ti.com> napisa=C5=
=82(a):
> > > >
> > > > Hi Bart,
> > > >
> > > > On 26/03/19 11:21 PM, Bartosz Golaszewski wrote:
> > > > > wt., 26 mar 2019 o 15:00 Adam Ford <aford173@gmail.com> napisa=C5=
=82(a):
> > > > >>
> > > > >> On Fri, Mar 22, 2019 at 8:31 AM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > > > >>>
> > > > >>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >>>
> > > > >>> The system_rev variable is never set on davinci and is always 0=
, so
> > > > >>> we're using the default max operating point of 300MHz. The cvdd=
 supply
> > > > >>> comes from the tps6507 pmic and the voltage can go all the way =
to 1.3V
> > > > >>> so the maximum supported rate should be 456MHz.
> > > > >>
> > > > >> My understanding is that only certain revisions of the silicon c=
an go
> > > > >> to 456MHz.   The L138's Datasheet lists both a 456 and 375 versi=
on.  I
> > > > >> cannot find a way to read a register to determine which version =
of the
> > > > >> silicon is available. Maybe Sekhar can confirm.
> > > > >>
> > > > >
> > > > > Commit 28bd2c341120 ("davinci: am18x/da850/omap-l138 evm: add sup=
port
> > > > > for higher speed grades") mentions the following:
> > > > >
> > > > > ---
> > > > > U-Boot on the EVM sets up ATAG_REVISION to inform the OS
> > > > > regarding the speed grade supported by the silicon. We use
> > > > > this information to pass on the speed grade information to
> > > > > the SoC code.
> > > > > ---
> > > > >
> > > > > Should the system_rev somehow reflect that revision? Any way I ca=
n check it?
> > > >
> > > > Can you check if the procedure in doc/README.davinci in U-Boot sour=
ces
> > > > still works?
> > > >
> > > > Environment Variables
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > The DA850 EVM allows the user to specify the maximum cpu clock allo=
wed by the
> > > > silicon, in Hz, via an environment variable "maxcpuclk".
> > > >
> > > > The maximum clock rate allowed depends on the silicon populated on =
the EVM.
> > > > Please make sure you understand the restrictions placed on this clo=
ck in the
> > > > device specific datasheet before setting up this variable. This inf=
ormation is
> > > > passed to the Linux kernel using the ATAG_REVISION atag.
> > > >
> > > > If "maxcpuclk" is not defined, the configuration CONFIG_DA850_EVM_M=
AX_CPU_CLK
> > > > is used to obtain this information.
> > > >
> > > > Thanks,
> > > > Sekhar
> > >
> > > Hi Sekhar,
> > >
> > > I built the current upstream u-boot and the get_board_rev() function
> > > for da850-evm doesn't seem to be called at all. For instance the
> > > lego-ev3 platform does this:
> > >
> > > ./lego/ev3/legoev3.c:108: board_rev =3D get_board_rev();
> > >
> > > but in davinci this function seems to be unused and I don't see it
> > > called from any other core u-boot component. I don't see any commit
> > > that would mention this function but there are a lot of commits
> > > removing get_board_rev() for other boards in git log. Is it possible
> > > it stopped being used at some point?
> >
> > Look for setup_revision_tag in arch/arm/lib/bootm.c
> >
> > The function appears to be called from there.
> >
> > There is a __weak reference in the header file which I think allows
> > people to remove them without breaking bootm.
> >
> > adam
> > >
> > > Bart
>
> Thanks, now verified that this still works in board file mode for
> da850-evm. Now the questions is - what about DT mode? Should we only
> enable the lowest possible mode (300MHz) and leave it to the user to
> enable any higher frequencies?

>From everything that I can find in Logic PD's database, the standard
da850-evm kits and SOM's are 375MHz, so I think it's safe to run up to
that speed.  I would disable the speed options for 408 and 456, but
leave them shown for anyone who may have purchased a custom version
with the 456MHz variant which I can also see there are some.  At least
for the L138 and AM1808 SOM's, those customers who who they are, so
making it obvious how to enable it would be a good thing.

Just my two cents.

adam
>
> Bart

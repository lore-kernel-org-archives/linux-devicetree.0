From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 3/3] mfd: stmpe: Update DT support in stmpe driver
Date: Tue, 27 Nov 2012 08:40:07 +0000
Message-ID: <20121127084007.GA7897@gmail.com>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar@linaro.org>
 <7a48ae364663ab3a336251fada9aee07ccd728b8.1353610437.git.viresh.kumar@linaro.org>
 <20121123094132.EFCB73E07BE@localhost>
 <CAKohpomAM2pw9kgB6khtHzQ2WCXKZ9_pi1_sOH2dQToVS8ep4w@mail.gmail.com>
 <20121126184015.784993E091F@localhost>
 <CAKohpo=dHz-fJRdwovOWesAZJwibgrNk-+2t--JK+T_sBsu9Tw@mail.gmail.com>
 <CAKohpomOxfLhpZqpk3aymdNa7UAGRcex7d+N5srkFDnrhtULTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpomOxfLhpZqpk3aymdNa7UAGRcex7d+N5srkFDnrhtULTw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 27 Nov 2012, Viresh Kumar wrote:

> On 27 November 2012 08:10, Viresh Kumar <viresh.kumar@linaro.org> wro=
te:
> > On 27 November 2012 00:10, Grant Likely <grant.likely@secretlab.ca>=
 wrote:
> >> It would actually be good to ask the interrupt controller driver w=
hat
> >> kind of interrupt signal it expects for a given interrupt line. Th=
at
> >> should also solve the problem and I think it would be more useful =
to
> >> other devices. Can you investigate whether or not
> >> irqd_get_trigger_type() returns the information you need?
> >
> > That's a pretty cool function to use. :)
> >
> > Will check it out :)
>=20
> I was thinking about this logic in my earlier mail, don't know what s=
topped me
> from thinking it is wrong. :(
>=20
> Problem is with invert polarity, which the interrupt controller is no=
t aware of.
> For example, suppose interrupt controller needs Rising edge interrupt=
, but
> the board has inverted the line between stmpe and IC. So, we will get
> Rising high from the routine you mentioned, but we need to generate
> opposite of that to make it rising high.

Surely that would be a hardware design error/quirk?

Can you give an example where this has happened?

> And so interrupt polarity field is still required.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

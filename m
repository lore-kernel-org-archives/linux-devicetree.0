From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V5 2/2] mfd: stmpe: Update DT support in stmpe driver
Date: Thu, 6 Dec 2012 11:12:52 +0000
Message-ID: <20121206111252.GR2718@gmail.com>
References: <20121130154542.GG23648@gmail.com>
 <CAKohpokLVEH+4F_VXh5auUm48cWWe0mumZME8yOCcAezcwJbCQ@mail.gmail.com>
 <20121205224203.691153E0E22@localhost>
 <CAKohponjLp214EPKgNHqP2N8Tje9U8ZxgywUTSvsjE-TqHy+xw@mail.gmail.com>
 <20121206095019.GN2718@gmail.com>
 <CAKohpokNQB6L2vvjmvA7_3KomFXnV9wZ-uBjrfRVuBL=QWgr_Q@mail.gmail.com>
 <20121206101131.GP2718@gmail.com>
 <CAKohpom9NK0Tg9fKdddkP-0H8FuVd-=yhHzZr-sWNb_zTVymWw@mail.gmail.com>
 <20121206103515.GQ2718@gmail.com>
 <CAKohponeU539FR+XCKJQTFnoNKJCnAh5ESB1NGP7ZK0u4Tqwyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohponeU539FR+XCKJQTFnoNKJCnAh5ESB1NGP7ZK0u4Tqwyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Samuel Ortiz <sameo@linux.intel.com>, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Thu, 06 Dec 2012, Viresh Kumar wrote:

> On 6 December 2012 16:05, Lee Jones <lee.jones@linaro.org> wrote:
> >> > Or you could not put unnecessary bindings into the Device Tree
> >> > by putting two and two together and realise that using the table
> >> > is the correct thing to do instead. This actually gives reason
> >> > to you previous patch, but should probably be fixed-up into it
> >> > so it has some proper meaning/purpose. ;)
> >>
> >> Couldn't understand this one :(
> >
> > Really?
>=20
> I tried again, but couldn't get it :(
>=20
> > Let's break it down - what do you need "stmpe,id" for?
>=20
> To distinguish two instances of of stmpe811 (for instance) on a board=
=2E
> Names of stmpe sub-modules would contain .0, .1, if we have an id
> passed to it. Passing -1 would create same names for both gpio blocks
> which belonged to different stmpe811's.

I thought we'd be over this? The 'ID' will be represented by the
address of the chip i.e. stmpe1601@40, where '40' will be
distinguishing factor?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

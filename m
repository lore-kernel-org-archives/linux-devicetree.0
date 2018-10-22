MIME-Version: 1.0
Date: Mon, 22 Oct 2018 11:03:44 -0500
References: <CAL_Jsq+Mab+6fwGMyC+aBiGQ3+EtYL2XxSqb-pSP1-BDhTbEBg@mail.gmail.com>
	<CAL_Jsq++N9RXU5VjdQpjCB7ijrbfBe5KKy-hYjuE-75ApUQROg@mail.gmail.com>
	<CAL_Jsq+QKQjShb9TO_Db2R5w2X_NheSZHNKwprB3qNQDshpW0A@mail.gmail.com>
	<e7e39bb58cb65d5fff23af4a9cd9c038d7a2bc60.camel@buserror.net>
	<DB7PR04MB42984B28138AF236FFEF72B79AF40@DB7PR04MB4298.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB42984B28138AF236FFEF72B79AF40@DB7PR04MB4298.eurprd04.prod.outlook.com>
Message-ID: <CAL_Jsq+aGRAwrkLUBHEi8TBAWJ8nz5piEfma1EvxhBh5oyXuQw@mail.gmail.com>
Subject: Re: re-licensing of bindings/chosen.txt
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: York Sun <york.sun@nxp.com>
Cc: Scott Wood <oss@buserror.net>, devicetree@vger.kernel.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, James Morse <james.morse@arm.com>, Leif Lindholm <leif.lindholm@linaro.org>, Kees Cook <keescook@chromium.org>, Yang-Leo Li <leoyang.li@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 22, 2018 at 10:09 AM York Sun <york.sun@nxp.com> wrote:
>
> On 10/22/18 06:37, Scott Wood wrote:
> > On Mon, 2018-10-22 at 08:25 -0500, Rob Herring wrote:
> >> On Wed, Oct 10, 2018 at 7:30 AM Rob Herring <robh@kernel.org> wrote:
> >>>
> >>> Fixing Scott's email.
> >>
> >> Scott, Just missing your okay on this.
> >
> > I'm fine with it personally, but I no longer work for NXP so I can't speak for
> > them.  I've CCed a couple people who still work there.
> >
>
> Rob,
>
> I didn't follow devicetree change lately. Which chosen.txt were you
> talking about? Was it the one under Linux kernel Documentation?

Yes, specifically these lines:

567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  70)
567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  71)
linux,booted-from-kexec
567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  72)
-----------------------
567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  73)
567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  74) This
property is set (currently only on PowerPC, and only needed on
567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  75)
book3e) by some versions of kexec-tools to tell the new kernel that it
567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  76) is
being booted by kexec, as the booting environment may differ (e.g.
567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  77) a
different secondary CPU release mechanism)

Rob

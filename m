From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/4] clk: st: New always-on clock domain
Date: Fri, 27 Feb 2015 21:49:41 +0000
Message-ID: <20150227214941.GB12821@x1>
References: <1424799222-9301-1-git-send-email-lee.jones@linaro.org>
 <87385r3uk9.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87385r3uk9.fsf@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mturquette@linaro.org, sboyd@codeaurora.org, kernel@stlinux.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 27 Feb 2015, Robert Jarzmik wrote:

> Lee Jones <lee.jones@linaro.org> writes:
>=20
> > v2 =3D> v3:
> >   - Ensure DT actually reflects h/w
> >     - i.e. Nodes should not contain a mishmash of different IP
> >       blocks, but should identify related h/w.  In the current
> >       example we use interconnects
> >   - Change naming from clkdomain to clk-always-on
> >   - Place "do not abuse" warning in documentation
> >
> > v1 =3D> v2:
> >   - Turned the ST specific driver into a generic one
> >  =20
> > Hardware can have a bunch of clocks which must not be turned off.
> > If drivers a) fail to obtain a reference to any of these or b) give
> > up a previously obtained reference during suspend, the common clk
> > framework will attempt to turn them off and the hardware will
> > subsequently die.  The only way to recover from this failure is to
> > restart.
> >  =20
> > To avoid either of these two scenarios from catastrophically
> > disabling the running system we have implemented a clock domain
> > where clocks are consumed and references are taken, thus preventing
> > them from being shut down by the framework.
>=20
> Hi Lee,
>=20
> I wonder why there is a need for a new clock when CLK_IGNORE_UNUSED d=
oes
> exist. What is the usecase that is covered by this patchset which is =
not used by
> CLK_IGNORE_UNUSED clock flag ?
>=20
> And if that reason exists, I'd like to find it in the commit message.

The problem is applying that flag in a generic way.

However, I guess you haven't seen this [1] yet?

[1] https://lkml.org/lkml/2015/2/27/548

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 74/75] ARM: l2c: always enable low power modes
Date: Fri, 4 Apr 2014 20:17:33 +0100
Message-ID: <20140404191732.GF7528@n2100.arm.linux.org.uk>
References: <20140328151249.GJ7528@n2100.arm.linux.org.uk> <E1WTYaK-0007I0-Sm@rmk-PC.arm.linux.org.uk> <CAL_Jsq+vja-BeNfiVnOicFAa+E6jigDfnb5KWWpxZCZ3eGkJiA@mail.gmail.com> <20140328155127.GL7528@n2100.arm.linux.org.uk> <b3b6dd79-5646-4c9f-8e62-ed9c4a5596e3@VA3EHSMHS040.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b3b6dd79-5646-4c9f-8e62-ed9c4a5596e3@VA3EHSMHS040.ehs.local>
Sender: linux-doc-owner@vger.kernel.org
To: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
Cc: Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 04, 2014 at 09:53:29AM -0700, S=F6ren Brinkmann wrote:
> On Fri, 2014-03-28 at 03:51PM +0000, Russell King - ARM Linux wrote:
> > On Fri, Mar 28, 2014 at 10:42:54AM -0500, Rob Herring wrote:
> > > On Fri, Mar 28, 2014 at 10:20 AM, Russell King
> > > <rmk+kernel@arm.linux.org.uk> wrote:
> > > > Always enable the L2C low power modes on L2C-310 R3P0 and newer=
 parts.
> > >=20
> > > I assume you want to squash this with patch 68/75? Or you are sti=
ll
> > > debating whether we want to do this or not? Given that it is r3px
> > > only, that should greatly reduce any chance of breakage to newer
> > > platforms.
> >=20
> > I will eventually - I've kept it separate for the time being to giv=
e
> > more options.  Let's see how people get on with it - it'll be runni=
ng
> > through Olof's builder later today, and there's some other people
> > wanting to take it for a spin.
>=20
> A while back I suggested altering those bits, but that was turned dow=
n:
> https://lkml.org/lkml/2013/3/1/350

As I said yesterday, please use a different archive website, preferably
one which works.  lkml.org has been broken in various ways for a couple
of days now, and quoting unreachable URLs isn't useful for discussion
purposes.

--=20
=46TTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... sl=
owly
improving, and getting towards what was expected from it.

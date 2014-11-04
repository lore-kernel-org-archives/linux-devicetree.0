From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 0/1] Compact interface for Device-Tree
Date: Tue, 04 Nov 2014 15:53:29 +0000
Message-ID: <20141104155329.A23A5C423D0@trevor.secretlab.ca>
References: <1414709964-27284-1-git-send-email-gavidov@codeaurora.org>
	<CAL_JsqLtkiiyisxSG_qBknmz6n2qDKUdpwM-ZY3tH3wgYSrO1w@mail.gmail.com>
	<7637604.7PK9W8ePf3@vostro.rjw.lan> <40803956.DTL7dD7CLv@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <40803956.DTL7dD7CLv@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Rob Herring <robherring2@gmail.com>, Gilad Avidov <gavidov@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sagar Dharia <sdharia@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 03 Nov 2014 16:06:03 +0100
, Arnd Bergmann <arnd@arndb.de>
 wrote:
> On Friday 31 October 2014 23:53:28 Rafael J. Wysocki wrote:
> > On Saturday, November 01, 2014 05:13:45 AM Rob Herring wrote:
> > > On Fri, Oct 31, 2014 at 6:59 AM, Gilad Avidov <gavidov@codeaurora=
=2Eorg> wrote:
> > > >
> > > > Device-Tree compact API
> > > > ------------------------
> > > >
> > > > Common code seen in driver=E2=80=99s probe reads device tree va=
lues and handling
> > > > erroneous return codes from all those of_property_read_xxx()  A=
PIs. This
> > > > common code is factored out by the of_property_map module which=
 allows
> > > > driver=E2=80=99s probe to replace that (often lengthy) code wit=
h a concise table:
> > > >
> > > > struct of_prop_map map[] =3D {
> > > >     {"i2c",            &dev->id,        OF_REQ,  OF_ID,  -1},
> > > >     {"qcom,clk-freq-out",    &dev->clk_freq_out,    OF_REQ,  OF=
_U32,  0},
> > > >     {"qcom,clk-freq-in",    &dev->clk_freq_in,    OF_REQ,  OF_U=
32,  0},
> > > >     {"qcom,disable-dma",    &dev->disable_dma,    OF_OPT,  OF_B=
OOL, 0},
> > > >     {"qcom,master-id",    &dev->mstr_id,        OF_SGST, OF_U32=
,  0},
> > > >     {NULL,            NULL,            0,       0,       0},
> > > > };
> > > >
> > > > Then call populate to read the values into the device=E2=80=99s=
 variables:
> > > >
> > > > ret =3D of_prop_populate(dev, dev->of_node, map);
> > >=20
> > > Interesting idea. The main concern I have with this is there has =
been
> > > on-going discussions about how to generalize property handling ac=
ross
> > > DT and ACPI to make drivers more agnostic, so I'm copying a few f=
olks
> > > involved in that. That may be a bit orthogonal to what this is do=
ing,
> > > but we may want some coordination here.
> >=20
> > Agreed.
> >=20
> > We actually have a patchset adding a unified device property API in=
=20
> > linux-next (http://git.kernel.org/cgit/linux/kernel/git/rafael/linu=
x-pm.git/log/?h=3Ddevice-properties)
> > and I'd prefer to see the "compactization" to happen at that level,=
 if possible,
> > rather that for of_ only.
>=20
> Agreed, this should definitely use the new generalized API.
> I have prototyped a similar concept last year, which actually went mu=
ch
> further and also abstracted high-level properties such as interrupts,
> gpios, pwm, dma-engine, etc. I still think we should do something
> like that, but I've never had the time to follow up and nobody else
> picked up my work from back then.
>=20
> Would others like to see that?

Absolutely. I also tried to do the same thing and didn't get very far.
And, yes, it should be done at the level of the device properties API.

g.

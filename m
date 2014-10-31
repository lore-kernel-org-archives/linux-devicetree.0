From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 0/1] Compact interface for Device-Tree
Date: Fri, 31 Oct 2014 23:53:28 +0100
Message-ID: <7637604.7PK9W8ePf3@vostro.rjw.lan>
References: <1414709964-27284-1-git-send-email-gavidov@codeaurora.org> <CAL_JsqLtkiiyisxSG_qBknmz6n2qDKUdpwM-ZY3tH3wgYSrO1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLtkiiyisxSG_qBknmz6n2qDKUdpwM-ZY3tH3wgYSrO1w@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Gilad Avidov <gavidov@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sagar Dharia <sdharia@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Saturday, November 01, 2014 05:13:45 AM Rob Herring wrote:
> On Fri, Oct 31, 2014 at 6:59 AM, Gilad Avidov <gavidov@codeaurora.org=
> wrote:
> >
> > Device-Tree compact API
> > ------------------------
> >
> > Common code seen in driver=E2=80=99s probe reads device tree values=
 and handling
> > erroneous return codes from all those of_property_read_xxx()  APIs.=
 This
> > common code is factored out by the of_property_map module which all=
ows
> > driver=E2=80=99s probe to replace that (often lengthy) code with a =
concise table:
> >
> > struct of_prop_map map[] =3D {
> >     {"i2c",            &dev->id,        OF_REQ,  OF_ID,  -1},
> >     {"qcom,clk-freq-out",    &dev->clk_freq_out,    OF_REQ,  OF_U32=
,  0},
> >     {"qcom,clk-freq-in",    &dev->clk_freq_in,    OF_REQ,  OF_U32, =
 0},
> >     {"qcom,disable-dma",    &dev->disable_dma,    OF_OPT,  OF_BOOL,=
 0},
> >     {"qcom,master-id",    &dev->mstr_id,        OF_SGST, OF_U32,  0=
},
> >     {NULL,            NULL,            0,       0,       0},
> > };
> >
> > Then call populate to read the values into the device=E2=80=99s var=
iables:
> >
> > ret =3D of_prop_populate(dev, dev->of_node, map);
>=20
> Interesting idea. The main concern I have with this is there has been
> on-going discussions about how to generalize property handling across
> DT and ACPI to make drivers more agnostic, so I'm copying a few folks
> involved in that. That may be a bit orthogonal to what this is doing,
> but we may want some coordination here.

Agreed.

We actually have a patchset adding a unified device property API in lin=
ux-next (http://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.gi=
t/log/?h=3Ddevice-properties)
and I'd prefer to see the "compactization" to happen at that level, if =
possible,
rather that for of_ only.

Rafael

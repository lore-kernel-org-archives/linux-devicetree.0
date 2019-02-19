From: Chen-Yu Tsai <wens@csie.org>
Subject: Allwinner SID THS calibration data cell representation?
Date: Tue, 19 Feb 2019 15:54:00 +0800
Message-ID: <CAGb2v65p0G83BVODsxxnXmiSCwuuwPFtY2k2ZV1F5xoFKrJjWQ@mail.gmail.com>
References: <20180830154518.29507-1-embed3d@gmail.com> <20180830154518.29507-28-embed3d@gmail.com>
 <20180904184623.e4386b8e6b657b1b25e90c09@bidouilliste.com>
 <55579dd6-625d-e71b-1482-4592dccac665@gmail.com> <20180906115114.inc6dhqhy47obo25@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906115114.inc6dhqhy47obo25@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Philipp Rossak <embed3d@gmail.com>, Emmanuel Vadot <manu@bidouilliste.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Quentin Schulz <quentin.schulz@bootlin.com>, Icenowy Zheng <icenowy@aosc.io>, linux-iio@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Sorry for resurrecting an old discussion, but since someone posted patches
for H5 and H6, I thought we should resolve this. I'm working on patches to
fix / replace the big-endian issue.

On Thu, Sep 6, 2018 at 7:51 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Sep 06, 2018 at 01:47:47PM +0200, Philipp Rossak wrote:
> > On 04.09.2018 18:46, Emmanuel Vadot wrote:
> > > > +                 /* Data cells */
> > > > +                 thermal_calibration: calib@234 {
> > > > +                         reg = <0x234 0x8>;
> > > > +                 };
> > >   You are declaring 8 bytes of calibration data but to my knowledge it's
> > > only 2 bytes per sensor, so 2 bytes for H3.
> > >   Am I missing something ?
> > >
> > >   Thanks,
> >
> > Emmanuel you are right, it is 2 bytes per Sensor and should be 2 bytes for
> > H3, but the thermal calibration data field is on all chips 64 bit wide - so
> > 8 bytes. So I'm reading here the complete calibration data field.
>
> Having one cell per channel would make more sense I guess.

Would it? The 2 32-bit words directly map onto the registers 0x74 / 0x78 in
the THS. As far as the SID is concerned, their is just one consumer for this
data, the thermal sensor. How the thermal sensor uses that data is really not
its concern. And the thermal sensor is really just copying the data from the
e-fuses into its registers. Nothing more.

Furthermore, with the register access interface, the e-fuses are read/write
32 bits at a time. Seems to me it would make more sense to enforce a 32-bit
word size, so cells should be multiples of 32 bits.

Regards
ChenYu

From: Emmanuel Vadot <manu@bidouilliste.com>
Subject: Re: Allwinner SID THS calibration data cell representation?
Date: Thu, 21 Feb 2019 11:10:17 +0100
Message-ID: <20190221111017.f3be5d56b419d9b90876b4c2@bidouilliste.com>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-28-embed3d@gmail.com>
 <20180904184623.e4386b8e6b657b1b25e90c09@bidouilliste.com>
 <55579dd6-625d-e71b-1482-4592dccac665@gmail.com>
 <20180906115114.inc6dhqhy47obo25@flea>
 <CAGb2v65p0G83BVODsxxnXmiSCwuuwPFtY2k2ZV1F5xoFKrJjWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v65p0G83BVODsxxnXmiSCwuuwPFtY2k2ZV1F5xoFKrJjWQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Philipp Rossak <embed3d@gmail.com>, Quentin Schulz <quentin.schulz@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jonathan Cameron <jic23@kernel.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Tue, 19 Feb 2019 15:54:00 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> Sorry for resurrecting an old discussion, but since someone posted patches
> for H5 and H6, I thought we should resolve this. I'm working on patches to
> fix / replace the big-endian issue.
> 
> On Thu, Sep 6, 2018 at 7:51 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Thu, Sep 06, 2018 at 01:47:47PM +0200, Philipp Rossak wrote:
> > > On 04.09.2018 18:46, Emmanuel Vadot wrote:
> > > > > +                 /* Data cells */
> > > > > +                 thermal_calibration: calib@234 {
> > > > > +                         reg = <0x234 0x8>;
> > > > > +                 };
> > > >   You are declaring 8 bytes of calibration data but to my knowledge it's
> > > > only 2 bytes per sensor, so 2 bytes for H3.
> > > >   Am I missing something ?
> > > >
> > > >   Thanks,
> > >
> > > Emmanuel you are right, it is 2 bytes per Sensor and should be 2 bytes for
> > > H3, but the thermal calibration data field is on all chips 64 bit wide - so
> > > 8 bytes. So I'm reading here the complete calibration data field.
> >
> > Having one cell per channel would make more sense I guess.
> 
> Would it? The 2 32-bit words directly map onto the registers 0x74 / 0x78 in
> the THS. As far as the SID is concerned, their is just one consumer for this
> data, the thermal sensor. How the thermal sensor uses that data is really not
> its concern. And the thermal sensor is really just copying the data from the
> e-fuses into its registers. Nothing more.

 If you see this at the controller lever and not at the sensor level it
might make sense to use the full 32bits data even some bits are ignored
I guess.

> Furthermore, with the register access interface, the e-fuses are read/write
> 32 bits at a time. Seems to me it would make more sense to enforce a 32-bit
> word size, so cells should be multiples of 32 bits.

 Ok, honestly at this point I don't really care what choice is done as
long as the dts is updated, I'll deal with the diff for FreeBSD and
ping the others BSD (Net and Open who also have a driver) for this
change.

> Regards
> ChenYu

 Cheers,

-- 
Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>

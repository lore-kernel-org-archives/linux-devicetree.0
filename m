From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
Date: Thu, 17 Jan 2019 23:42:22 +0100
Message-ID: <CAFBinCBSxCMqhF+Tvw3DfBeXQzthT9U+QtWxmPA+1X+SwivFmA@mail.gmail.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com> <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
 <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
 <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
 <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com> <0dcd4c655bd9477d7adf2c6e32a1f0ebab18cee0.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0dcd4c655bd9477d7adf2c6e32a1f0ebab18cee0.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 10:45 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Thu, 2019-01-17 at 22:20 +0100, Martin Blumenstingl wrote:
> > On Thu, Jan 17, 2019 at 9:39 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> > > > OK, but we had incorrect documentation in the past. did you check this
> > > > with someone from Amlogic?
> > > >
> > > > I'm curious because there seem to be two different approaches here:
> > > > 1) hiubus name and offsets are being fixed within this patch
> > > > 2) aobus is being dropped here and re-introduced with a different name
> > > > later
> > > > on
> > > >
> > >
> > > because hiu exist and aobus does not, for which both the name and size was
> > > wrong
> > >
> > > > approach 1) can also be used for the "rti" region (at least in my
> > > > opinion, the patch doesn't explain why it can't be done):
> > >
> > > THe patch remove aobus (instead of fixing name and size) because, of the
> > > multiple region documented covered by this 'made region', I did not
> > > anticipate
> > > which one will be required and I did not want to add them all.
> > >
> > > Better to add them as needed, which is want I done for pinctrl as you
> > > pointed
> > > out
> > >
> > > > rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
> > > > (both values can be found in mesong12a.dtsi from
> > > > buildroot_openlinux_kernel_4.9_fbdev_20180706)
> > >
> > > RTI is added here:
> > > https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com
> > >
> > > I don't really understand the problem ? result is the same
> > the actual problem is "me" as I have conflicting information:
> > - Amlogic's buildroot kernel (for G12A) uses similar bus definitions
> > as the GX SoCs (for which there are public datasheets) - this is how
> > Jianxin added it to meson-g12a.dtsi originally
>
> And it was the same for the GX family. AOBUS in the DT while there nothing
> about this in the memory map. Keep wrong patterns does not make them right.
>
> I'm merely reading the memory map here
can you explain which "memory map" you are reading exactly?

my source is the "memory map" section in the public S905X and S912 datasheets:
- "S912_Datasheet_V0.220170314publicversion-Wesion.pdf" page 48
- "S905X_Datasheet V0.3 20170314publicversion-Wesion.pdf" page 43

> > - this patch does it different - but cannot check if this is correct
> > (no public datasheet is available for G12A or AXG) nor do I have a
> > "big picture" of upcoming changes
>
> Yes it does it differently. We should have picked up on this a while ago,
> since gxbb at least, and we did not. There reason to create bus that don't
> exist in the memory map of any recent SoC.
in the GXL and GXM datasheets from above there is:
range: 0xC8100000 - 0xC81FFFFF
name: RTI

thus in my opinion, based on the two datasheets from above:
- the bus definition (start, size) in meson-gx.dtsi is fine
- probably have the wrong name for this bus in meson-gx.dtsi
- (assuming that GXBB, GXL and GXM are all the same - I only compared
the last two)

> Creating bus should at least require a start and end offset explained
> somewhere. Copying vendor DT is not enough
I fully agree on this one!


Regards
Martin

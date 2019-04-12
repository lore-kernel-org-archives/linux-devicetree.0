From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Lenovo Miix 630
Date: Fri, 12 Apr 2019 09:48:17 -0600
Message-ID: <CAOCk7NpF4hxwg+2LBHMPv3Xg2GC6j9ijy0u_W0H6WgqsOTu3JA@mail.gmail.com>
References: <20190411205144.43557-1-jeffrey.l.hugo@gmail.com>
 <20190412144712.GA7481@lakrids.cambridge.arm.com> <CAOCk7Np+WTMuoRZOrQzbt1H6xENW2OhRFgpOc-vWn+9daBBqbg@mail.gmail.com>
 <20190412153040.GB7481@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412153040.GB7481@lakrids.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: bjorn.andersson@linaro.org, agross@kernel.org, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 9:30 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Fri, Apr 12, 2019 at 09:19:18AM -0600, Jeffrey Hugo wrote:
> > > > +     keyboard@3a {
> > > > +             /* QTEC0001 is the ACPI HID, which could be used for quirks */
> > > > +             compatible = "QTEC0001", "hid-over-i2c";
> > >
> > > As mentioned last time, please drop the ACPI HID, and allocate a real
> > > compatible string.
> >
> > So, I'm in a quandary with this device.  As far as I can tell, its an
> > off the shelf component, the device adheres to the "PNP0C50" spec (HID
> > over I2C), and can be driven by the full "hid-over-i2c" driver (which
> > is just a DT shim over the PNP0C50 ACPI driver).  However, the device
> > itself identifies itself as an ELAN 400 device, which is an ID that is
> > also used for standalone touchpad devices.  Per my understanding of
> > the Linux drivers, there is a separate ELAN driver for the standalone
> > touchpad devices as its been discovered though trial and error that
> > the Linux PNP0C50 driver cannot drive those devices.  To handle this,
> > there is a quirk in hid-quirks which rejects ELAN 400 devices, except
> > those which are "QTEC0001".
> >
> > We need that quirk bypass for this device because the ELAN driver
> > cannot handle this device.
>
> This is useful context; thanks for writing this up!
>
> > I'd much rather have a single identifier to quirk on, rather than
> > having one for DT and one for ACPI, and its not looking feasible to
> > get the vendor to update the ACPI, so it seems like using the ACPI
> > identifier is just simpler.
> >
> > So, if you want a different compatible string, I'll need to go put DT
> > in a driver that is primarily ACPI.  I'm not sure what the HID folks
> > will think of that.
>
> My objection is that an ACPI HID is _not_ a DT compatible string, and
> the two should be treated separately. Munging the two together opens the
> door for other pain.
>
> The driver in question has a DT probe function, i2c_hid_of_probe, so
> there's certainly a place to wire up that quirk.

Except that isn't where HID quirks are handled.  They are handled in
drivers/hid/hid-quirks.c

There is a table of vendor/device IDs of HIDs which need quirking.  In
hid_ignore(), there is provision to detect based on vendor/device and
the device name, whether the device can be driven by the HID
framework, or needs to be handled by a standalone driver.  All the I2C
HID DT driver is doing is filling in the vendor/device IDs (read from
the hardware) into the HID framework struct.  The device name seems to
come from standard mechanisms.

>
> > I'll propose it, but what do you view is a
> > "proper" compatible string?  "ELAN0400-msm8998-clamshell"?
>
> A proper compatible string has a vendor-prefix, and is documented
> somewhere in Documentation/devicetree/bindings.
>
> e.g. you could allocate something like:
>
>         "qcom,msm8998-clamshell-hid-over-i2c"

Ok, let me create a simple bindings file, propose to amend the
hid-quirks to accept the DT string, and then have a v3 of the miix 630
dts all as one series to hopefully get everyone on the same page and
happy with things.

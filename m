From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Lenovo Miix 630
Date: Fri, 12 Apr 2019 09:19:18 -0600
Message-ID: <CAOCk7Np+WTMuoRZOrQzbt1H6xENW2OhRFgpOc-vWn+9daBBqbg@mail.gmail.com>
References: <20190411205144.43557-1-jeffrey.l.hugo@gmail.com> <20190412144712.GA7481@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412144712.GA7481@lakrids.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: bjorn.andersson@linaro.org, agross@kernel.org, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I'm sorry, I had completely missed your reply to v1.

To answer your previous question, why do we need a DT?

DT is the quick path to support for these systems.  There is already a
fair amount of support in mainline to support the core SoC (msm8998)
which is/was heavily used in top tier phone products.  All of that
support is DT based, which is expected to also be leveraged to other
products beyond these laptops, and the existing phones on the market.
As far as I am aware, the ACPI for the laptops was developed only with
Windows in mind, and it is expected, from initial investigations, that
supporting the ACPI is going to be painful.  Its on the road map, but
getting full functionality, quickly, is what what we'd like to do to
meet the demand for these systems.

On Fri, Apr 12, 2019 at 8:47 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Apr 11, 2019 at 01:51:44PM -0700, Jeffrey Hugo wrote:
> > This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> > functionality includes USB (host), microSD-card, keyboard, and trackpad.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >
> > v2:
> > -Changed "cls" to "clam" since feedback indicated "cls" is too opaque, but
> > "clamshell" is a mouthfull.  "clam" seems to be a happy medium.
>
> Please use "clamshell". The extra 5 characters aren't going to hurt
> anyone, and it avoids having yet another short name just confuses
> matters further.

Sure.  Will queue this for the next rev.

>
> [...]
>
> > +     keyboard@3a {
> > +             /* QTEC0001 is the ACPI HID, which could be used for quirks */
> > +             compatible = "QTEC0001", "hid-over-i2c";
>
> As mentioned last time, please drop the ACPI HID, and allocate a real
> compatible string.

So, I'm in a quandary with this device.  As far as I can tell, its an
off the shelf component, the device adheres to the "PNP0C50" spec (HID
over I2C), and can be driven by the full "hid-over-i2c" driver (which
is just a DT shim over the PNP0C50 ACPI driver).  However, the device
itself identifies itself as an ELAN 400 device, which is an ID that is
also used for standalone touchpad devices.  Per my understanding of
the Linux drivers, there is a separate ELAN driver for the standalone
touchpad devices as its been discovered though trial and error that
the Linux PNP0C50 driver cannot drive those devices.  To handle this,
there is a quirk in hid-quirks which rejects ELAN 400 devices, except
those which are "QTEC0001".

We need that quirk bypass for this device because the ELAN driver
cannot handle this device.

I'd much rather have a single identifier to quirk on, rather than
having one for DT and one for ACPI, and its not looking feasible to
get the vendor to update the ACPI, so it seems like using the ACPI
identifier is just simpler.

So, if you want a different compatible string, I'll need to go put DT
in a driver that is primarily ACPI.  I'm not sure what the HID folks
will think of that.  I'll propose it, but what do you view is a
"proper" compatible string?  "ELAN0400-msm8998-clamshell"?

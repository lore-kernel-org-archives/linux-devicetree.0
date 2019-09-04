From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Date: Wed, 4 Sep 2019 17:52:47 +0100
Message-ID: <20190904165246.GA25356@bogus>
References: <20190904121606.17474-1-lee.jones@linaro.org>
 <20190904141257.GB6144@bogus>
 <20190904161247.GP26880@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190904161247.GP26880@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 04, 2019 at 05:12:47PM +0100, Lee Jones wrote:
> On Wed, 04 Sep 2019, Sudeep Holla wrote:
>
> > On Wed, Sep 04, 2019 at 01:16:06PM +0100, Lee Jones wrote:
> > > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
> > > to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.
> > >
> > > Supported by this patch is: keyboard, battery monitoring, UFS storage,
> > > USB host and Bluetooth.
> > >
> >
> > Just curious to know if the idea of booting using ACPI is completely
> > dropped as it's extremely difficult(because the firmware is so hacked
> > up and may violate spec, just my opinion) for whatever reasons.
>
> Once [0] is applied, we can boot Mainline using ACPI.
>

Good to know.

> > We just made ACPI table version checking more lenient for this platform
> > and would be good to know if we continue to run ACPI on that or will
> > abandon and just use DT.
>
> Which patch are you referring to?  If you mean the ACPI v5.0 vs v5.1
> patch authored by Ard, then yes I know, I instigated it's existence
> due to these devices.
>

Yes exactly that one.

> DT will *always* be more enabled than ACPI, so it's advised that you
> use DT for anything useful.  ACPI booting is ideal for things like
> installing distros however, since they do not tend to provide DTBs in
> their installers.
>

OK, as along as it gets tested/used in some form, that's fine. I do agree
that DT will be more useful on that platform as it was derived from mobile
based SoC SDM845 rather than solely designed for Laptops and with more
alignment with ACPI spec. The way whole power/clock management is done
with ACPI on this pulls me towards DT ;)

--
Regards,
Sudeep

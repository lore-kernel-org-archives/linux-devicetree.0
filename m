From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Date: Thu, 03 Oct 2019 12:56:48 +0530
Message-ID: <3FAB5E91-9FD2-4052-881B-E4B18D44D33B@linaro.org>
References: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org> <20190830091943.22646-3-manivannan.sadhasivam@linaro.org> <20190923092209.GL5525@valkosipuli.retiisi.org.uk> <20191001184200.GA7739@Mani-XPS-13-9360> <20191002103715.GR896@valkosipuli.retiisi.org.uk> <20191003053338.GA7868@Mani-XPS-13-9360> <20191003071646.GZ896@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003071646.GZ896@valkosipuli.retiisi.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

Hi Sakari,=20

On 3 October 2019 12:46:46 PM IST, Sakari Ailus <sakari=2Eailus@iki=2Efi> =
wrote:
>Hi Manivannan,
>
>On Thu, Oct 03, 2019 at 11:03:38AM +0530, Manivannan Sadhasivam wrote:
>=2E=2E=2E=2E
>> > > > > +static int imx290_set_gain(struct imx290 *imx290, u32 value)
>> > > > > +{
>> > > > > +	int ret;
>> > > > > +
>> > > > > +	u32 adjusted_value =3D (value * 10) / 3;
>> > > >=20
>> > > > What's the purpose of this? Why not to use the value directly?
>> > > >=20
>> > >=20
>> > > The gain register accepts the value 10/3 of the actual gain
>required=2E Hence,
>> > > we need to manually do the calculation before updating the value=2E
>I can
>> > > add a comment here to clarify=2E
>> >=20
>> > It's better to use the register value directly=2E Otherwise the
>granularity
>> > won't be available to the user space=2E
>> >=20
>>=20
>> The sensor datasheet clearly defines that the 10/3'rd of the expected
>gain
>> should be set to this register=2E So, IMO we should be setting the
>value as
>
>The unit of that gain is decibels, but the controls do not have a unit=2E
>Register value is really preferred here=2E
>

Hmm, okay=2E Will just pass the value directly=2E=20

>> mentioned in the datasheet=2E I agree that we are missing the userspace
>> granularity here but sticking to the device limitation shouldn't be a
>problem=2E
>> As I said, I'll add a comment here to clarify=2E
>
>The comment isn't visible in the uAPI=2E
>

Yes=2E It would be good to have the units passed onto the userspace someho=
w like it is done in IIO=2E Then we don't need to fiddle in the driver for =
mismatch=2E Something consider in future=2E=2E=2E=20

>>=20
>> > >=20
>> > > > > +
>> > > > > +	ret =3D imx290_write_buffered_reg(imx290, IMX290_GAIN, 1,
>adjusted_value);
>> > > > > +	if (ret)
>> > > > > +		dev_err(imx290->dev, "Unable to write gain\n");
>> > > > > +
>> > > > > +	return ret;
>> > > > > +}
>> > > > > +
>> > > > > +static int imx290_set_power_on(struct imx290 *imx290)
>> > > > > +{
>> > > > > +	int ret;
>> > > > > +
>> > > > > +	ret =3D clk_prepare_enable(imx290->xclk);
>> > > >=20
>> > > > Please move the code from this function to the runtime PM
>runtime suspend
>> > > > callback=2E The same for imx290_set_power_off()=2E
>> > > >=20
>> > >=20
>> > > May I know why? I think since this is being used only once,
>you're suggesting
>> > > to move to the callback function itself but please see the
>comment below=2E I
>> > > will reuse this function to power on the device during probe=2E
>> >=20
>> > Yes, you can call the same function from probe, even if it's used
>as a
>> > runtime PM callback=2E
>> >=20
>> > There's no need to have a function that acts as a wrapper for
>calling it
>> > with a different type of an argument=2E
>> >=20
>>=20
>> You mean directly calling imx290_runtime_resume() from probe is fine?
>
>Yes=2E Feel free to call it e=2Eg=2E imx290_power_on or something=2E

Okay=2E=20

Thanks,=20
Mani

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V17 2/3] dmaengine: qcom_hidma: add debugfs hooks
Date: Wed, 27 Apr 2016 13:45:01 +0530
Message-ID: <20160427081501.GV2274@localhost>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-3-git-send-email-okaya@codeaurora.org>
 <20160426033029.GB2274@localhost>
 <b068ead6474f2ffee5acef9ea799aba3@codeaurora.org>
 <20160426162529.GK2274@localhost>
 <571F9D76.2060809@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <571F9D76.2060809@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 26, 2016 at 12:55:18PM -0400, Sinan Kaya wrote:
> On 4/26/2016 12:25 PM, Vinod Koul wrote:
> > On Tue, Apr 26, 2016 at 08:08:16AM -0400, okaya@codeaurora.org wrot=
e:
> >> On 2016-04-25 23:30, Vinod Koul wrote:
> >>> On Mon, Apr 11, 2016 at 10:21:12AM -0400, Sinan Kaya wrote:
> >>>
> >>>> +static int hidma_chan_stats(struct seq_file *s, void *unused)
> >>>> +{
> >>>> +	struct hidma_chan *mchan =3D s->private;
> >>>> +	struct hidma_desc *mdesc;
> >>>> +	struct hidma_dev *dmadev =3D mchan->dmadev;
> >>>> +
> >>>> +	pm_runtime_get_sync(dmadev->ddev.dev);
> >>>
> >>> debug shouldn't power up device, why do you want to do that
> >>
> >>
> >> Clocks are turned off while the hw is idle. I can=E2=80=99t reach =
hw
> >> registers without restoring power.
> >=20
> > Hmm, have you thought about using regmap?
> >=20
>=20
> To be honest, I didn't know what regmap is but I just read some code
> and looked at how it is used. Feel free to correct me if I got it=20
> wrong.=20
>=20
> Regmap seems to be designed for *slow* speed peripherals to improve f=
requent
> accesses by the SW. It looks like it is used by MFD, SPI and I2C driv=
ers.
>=20
> It seems to cache the register contents and flush/invalidate them onl=
y when
> needed.
>=20
> The MMIO version seems to be assuming the presence of device-tree lik=
e CLK
> API which doesn't exist on ACPI systems and is not portable.
>=20
> My reaction is that it is a lot of code with no added functionality t=
o what
> HIDMA driver is trying to achieve.=20
>=20
> Given that the use case here is only for debug purposes; I think it i=
s OK=20
> to keep this runtime call here. I don't want to add any overhead into=
 the
> existing code just to support the debug use case. =20
>=20
> None of my register read/writes are slow. This file will only be used=
 to=20
> troubleshoot customer issues.

$ is always faster than MMIO. This way you can give reg contents to use=
rs
without waking up hw.

Also we at Intel use regmap on ACPI systems without CLK API

--=20
~Vinod

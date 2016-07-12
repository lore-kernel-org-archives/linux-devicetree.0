From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 06/10] soc: Add SoC specific driver support for nuc900
Date: Tue, 12 Jul 2016 11:50:28 +0200
Message-ID: <1510379.YVtTfMI32O@wuerfel>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <4765191.NGpMC1JR46@wuerfel> <5784B302.80307@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5784B302.80307@iommu.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Wan Zongshun <vw@iommu.org>, devicetree@vger.kernel.org, jason@lakedaemon.net, Wan Zongshun <mcuos.com@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 12, 2016 5:06:10 PM CEST Wan Zongshun wrote:
> On 2016=E5=B9=B407=E6=9C=8811=E6=97=A5 16:03, Arnd Bergmann wrote:
> > On Sunday, July 10, 2016 3:27:26 PM CEST Wan Zongshun wrote:
> > I'm still a bit unsure about the set of attributes here.
> >
> > - The "soc_id" is read from the device tree from the field that con=
tains
> >    the board name, I think for consistency you should try to map th=
e
> >    GCR_CHIPID to the name of the SoC and assign that here
> >
> > - The "machine" is hardcoded to "NUC900EVB", which in turn looks li=
ke
> >    a particular board but not the one you are running on. Maybe rea=
d
> >    that from the DT instead?
> >
> > - The "revision" is not filled at all, I would suggest using someth=
ing
> >    derived from the GCR_CHIPID register here
> >
> > - you have two nonstandard attributes "chipid" and "version", which
> >    I'd hope to avoid -- the set of standard attributes is supposed =
to
> >    give enough information about the machine, and platform independ=
ent
> >    user space will never read those.
>=20
> So, Maybe I can remove those two codes, no need push those informatio=
n=20
> to user space?
>=20
> device_create_file(soc_device_to_device(soc_dev), &nuc900_chipid_attr=
);
> device_create_file(soc_device_to_device(soc_dev), &nuc900_version_att=
r);
>=20

Yes, that would be good.

	Arnd

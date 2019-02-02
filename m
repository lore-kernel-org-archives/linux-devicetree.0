From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: imu: add icm20602 bindings to
 mpu6050
Date: Sat, 2 Feb 2019 09:52:00 +0000
Message-ID: <20190202095200.2180f701@archlinux>
References: <20190128185010.8275-1-gaireg@gaireg.de>
        <20190130194942.GA30767@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130194942.GA30767@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Randolph =?UTF-8?B?TWFhw59lbg==?= <gaireg@gaireg.de>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Brian Masney <masneyb@onstation.org>, Jonathan Marek <jonathan@marek.ca>, Douglas Fischer <fischerdouglasc@gmail.com>, Martin Kelly <mkelly@xevo.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Hans de Goede <hdegoede@redhat.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Jan 2019 13:49:42 -0600
Rob Herring <robh@kernel.org> wrote:

> On Mon, 28 Jan 2019 19:50:02 +0100, =3D?UTF-8?q?Randolph=3D20Maa=3DC3=3D9=
Fen?=3D wrote:
> > Adding the invensense ICM-20602 to the compatible list of the mpu6050
> > driver
> >=20
> > Signed-off-by: Randolph Maa=C3=9Fen <gaireg@gaireg.de>
> >=20
> > ---
> > Changes in v2:
> > - write i2c disable register using reg_set instead of define
> > - decide to write to i2c disable register based on reg_set instead of
> >   chip type
> > ---
> >  Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >  =20
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

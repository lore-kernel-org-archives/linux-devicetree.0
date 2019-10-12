From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/7] iio: adc: max1027: Add debugfs register read
 support
Date: Sat, 12 Oct 2019 14:56:21 +0100
Message-ID: <20191012145621.228d4efc@archlinux>
References: <20191003173401.16343-1-miquel.raynal@bootlin.com>
        <20191003173401.16343-2-miquel.raynal@bootlin.com>
        <20191006110424.7781d99d@archlinux>
        <20191007120001.61c8ef71@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007120001.61c8ef71@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, 7 Oct 2019 12:00:01 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Jonathan,
>=20
> Jonathan Cameron <jic23@kernel.org> wrote on Sun, 6 Oct 2019 11:04:24
> +0100:
>=20
> > On Thu,  3 Oct 2019 19:33:55 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  =20
> > > Until now, only write operations were supported. Force two bytes read
> > > operation when reading from this register (might be wrong when reading
> > > the temperature, but will work with any other value).   =20
> >=20
> > That's worrying as comments go.  Just return an error on the temperature
> > register if it's going to do the wrong thing. =20
>=20
> Actually the debugfs_reg_access hook is supposedly stateless. When
> reading registers I don't know what I am reading because the "source" is
> selected during the write operation, so I have no reliable way to know
> what I am reading.
>=20
> I set the read length to 2 bytes because most of the "atomic"reads are
> two bytes and it allows us to test various commands directly from
> userspace and read meaningful values. This is a limitation as:
> * Voltage 'atomic' reads are 2 bytes
> * Temperature 'atomic' reads are 2 bytes but never come alone (usually
>   one voltage input of 2B will follow).
> * Any other 'condensed' input will be more than 2 bytes, ie. several
>   voltage values in one go.
>=20
> In any case, doing a software reset of the chip will turn it back
> into a working state no matter what was requested/read.
>=20
> For me, 2-byte reads is a "good enough" solution that will work with
> almost all the simplest ('atomic') SPI operations, but if you think
> limiting to 2-bytes access is a problem (right now there is only write
> access, which is kind of useless on its own) then let's drop the patch.
> But I wanted to contribute it because it really helped me during the
> development.=20

This is fine as is.  Comment was worrying so could perhaps have given
more detail.  Still it's a debug interface, people get to look at the
datasheet if they are using this :)

Jonathan


>=20
>=20
> Thanks,
> Miqu=C3=A8l

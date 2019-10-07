From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/7] iio: adc: max1027: Add debugfs register read
 support
Date: Mon, 7 Oct 2019 12:00:01 +0200
Message-ID: <20191007120001.61c8ef71@xps13>
References: <20191003173401.16343-1-miquel.raynal@bootlin.com>
        <20191003173401.16343-2-miquel.raynal@bootlin.com>
        <20191006110424.7781d99d@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191006110424.7781d99d@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

Jonathan Cameron <jic23@kernel.org> wrote on Sun, 6 Oct 2019 11:04:24
+0100:

> On Thu,  3 Oct 2019 19:33:55 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Until now, only write operations were supported. Force two bytes read
> > operation when reading from this register (might be wrong when reading
> > the temperature, but will work with any other value).  
> 
> That's worrying as comments go.  Just return an error on the temperature
> register if it's going to do the wrong thing.

Actually the debugfs_reg_access hook is supposedly stateless. When
reading registers I don't know what I am reading because the "source" is
selected during the write operation, so I have no reliable way to know
what I am reading.

I set the read length to 2 bytes because most of the "atomic"reads are
two bytes and it allows us to test various commands directly from
userspace and read meaningful values. This is a limitation as:
* Voltage 'atomic' reads are 2 bytes
* Temperature 'atomic' reads are 2 bytes but never come alone (usually
  one voltage input of 2B will follow).
* Any other 'condensed' input will be more than 2 bytes, ie. several
  voltage values in one go.

In any case, doing a software reset of the chip will turn it back
into a working state no matter what was requested/read.

For me, 2-byte reads is a "good enough" solution that will work with
almost all the simplest ('atomic') SPI operations, but if you think
limiting to 2-bytes access is a problem (right now there is only write
access, which is kind of useless on its own) then let's drop the patch.
But I wanted to contribute it because it really helped me during the
development. 


Thanks,
Miquèl

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCHv4 4/7] mfd: twl-core: Add twl_i2c_read/write_u16
Date: Tue, 18 Mar 2014 08:01:21 +0000
Message-ID: <20140318080121.GD25324@lee--X1>
References: <1394934211-21605-1-git-send-email-sre@debian.org>
 <1394934211-21605-5-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394934211-21605-5-git-send-email-sre@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@debian.org>
Cc: Sebastian Reichel <sre@ring0.de>, Marek Belisko <marek@goldelico.com>, Jonathan Cameron <jic23@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Add a simple twl_i2c_read/write_u16 wrapper over
> the twl_i2c_read/write, which is similar to the
> twl_i2c_read/write_u8 wrapper.
>=20
> Signed-off-by: Sebastian Reichel <sre@debian.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Jonathan Cameron <jic23@kernel.org>
> Tested-by: Marek Belisko <marek@goldelico.com>
> ---
>  include/linux/i2c/twl.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] mfd: Immutable branch for Sebastian Reichel's work on
 mfd->io driver conversion
Date: Tue, 18 Mar 2014 08:21:26 +0000
Message-ID: <20140318082126.GA25478@lee--X1>
References: <1394934211-21605-1-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394934211-21605-1-git-send-email-sre@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Cc: Sebastian Reichel <sre@ring0.de>, Marek Belisko <marek@goldelico.com>, Samuel Ortiz <sameo@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sre@debian.org
List-Id: devicetree@vger.kernel.org

The following changes since commit 0414855fdc4a40da05221fc6062cccbc0c30=
f169:

  Linux 3.14-rc5 (2014-03-02 18:56:16 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-io-3=
=2E15

for you to fetch changes up to b2931b98cebfb30d940f248d2054b5268eae87a4=
:

  mfd: twl4030-madc: Move driver to drivers/iio/adc (2014-03-18 08:16:2=
0 +0000)

----------------------------------------------------------------
Sebastian Reichel (7):
      mfd: twl4030-madc: Use managed resources
      mfd: twl4030-madc: Add DT support and convert to IIO framework
      mfd: twl4030-madc: Cleanup driver
      mfd: twl-core: Add twl_i2c_read/write_u16
      mfd: twl4030-madc: Use twl_i2c_read/write_u16 for 16 bit register=
s
      Documentation: DT: Document twl4030-madc binding
      mfd: twl4030-madc: Move driver to drivers/iio/adc

 Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt |  24 +++++=
++++
 drivers/iio/adc/Kconfig                                    |  10 ++++
 drivers/iio/adc/Makefile                                   |   1 +
 drivers/{mfd =3D> iio/adc}/twl4030-madc.c                    | 320 +++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------=
----------------------------------
 drivers/mfd/Kconfig                                        |  10 ----
 drivers/mfd/Makefile                                       |   1 -
 include/linux/i2c/twl.h                                    |  12 +++++
 include/linux/i2c/twl4030-madc.h                           |   2 +-
 8 files changed, 247 insertions(+), 133 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/twl4030-m=
adc.txt
 rename drivers/{mfd =3D> iio/adc}/twl4030-madc.c (74%)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 00/10] st33zp24 new architecture proposal and st33zp24 spi driver
Date: Sat, 10 Jan 2015 12:20:21 +0100
Message-ID: <1420888831-17491-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

The following patchset:
- clean the current tpm_i2c_stm_st33 driver
- propose a new architecture allowing to share a core st33zp24 data management
layer with different phy (i2c & spi). For st33zp24 both phy have a proprietary transport
protocol. Both are relying on the TCG TIS protocol. At the end, it simplifies the maintenance.
- Add an spi phy allowing to support st33zp24 using with an SPI bus.

The complete solution got tested in polling and interrupt mode successfully with i2c & spi phy.
This patchset applies on top of Peter's tree https://github.com/PeterHuewe/linux-tpmdd.git for-james branch
on top of:
tpm: TPM 2.0 FIFO Interface 2c71d9fb22289a196a4b51d6158cf0d2f9abcfb9

I confirm also Jarkko Sakkinen's changes are working with this product with both phy's.

Best Regards
Christophe

Christophe Ricard (10):
  tpm/tpm_i2c_stm_st33: Remove sparse spaces
  tpm/tpm_i2c_stm_st33: Sanity cleanup
  tpm/tpm_i2c_stm_st33: Replace remaining r by ret
  tpm/tpm_i2c_stm_st33: Replace access to io_lpcpd from struct
    st33zp24_platform_data to tpm_stm_dev
  tpm/tpm_i2c_stm_st33: Change tpm_i2c_stm_st33.h to tpm_stm_st33.h
  tpm/tpm_i2c_stm_st33: Add status check when reading data on the FIFO
  tpm/tpm_i2c_stm_st33/dts/st33zp24-i2c: Rename st33zp24 dts
    documentation
  tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33 in 2 layers (core + phy)
  tpm/st33zp24/spi: Add st33zp24 spi phy
  tpm/st33zp24/dts/st33zp24-spi: Add dts documentation for st33zp24 spi
    phy

 .../bindings/security/tpm/st33zp24-i2c.txt         |  36 +
 .../bindings/security/tpm/st33zp24-spi.txt         |  34 +
 .../devicetree/bindings/security/tpm/st33zp24.txt  |  36 -
 drivers/char/tpm/Kconfig                           |  11 +-
 drivers/char/tpm/Makefile                          |   2 +-
 drivers/char/tpm/st33zp24/Kconfig                  |  30 +
 drivers/char/tpm/st33zp24/Makefile                 |  12 +
 drivers/char/tpm/st33zp24/i2c.c                    | 283 +++++++
 drivers/char/tpm/st33zp24/spi.c                    | 399 +++++++++
 drivers/char/tpm/st33zp24/st33zp24.c               | 688 ++++++++++++++++
 drivers/char/tpm/st33zp24/st33zp24.h               |  32 +
 drivers/char/tpm/tpm_i2c_stm_st33.c                | 910 ---------------------
 include/linux/platform_data/st33zp24.h             |  28 +
 include/linux/platform_data/tpm_i2c_stm_st33.h     |  39 -
 14 files changed, 1544 insertions(+), 996 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33zp24-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt
 delete mode 100644 Documentation/devicetree/bindings/security/tpm/st33zp24.txt
 create mode 100644 drivers/char/tpm/st33zp24/Kconfig
 create mode 100644 drivers/char/tpm/st33zp24/Makefile
 create mode 100644 drivers/char/tpm/st33zp24/i2c.c
 create mode 100644 drivers/char/tpm/st33zp24/spi.c
 create mode 100644 drivers/char/tpm/st33zp24/st33zp24.c
 create mode 100644 drivers/char/tpm/st33zp24/st33zp24.h
 delete mode 100644 drivers/char/tpm/tpm_i2c_stm_st33.c
 create mode 100644 include/linux/platform_data/st33zp24.h
 delete mode 100644 include/linux/platform_data/tpm_i2c_stm_st33.h

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

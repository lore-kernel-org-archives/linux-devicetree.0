From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [GIT PULL] Mark - Immutable branch between MFD and Regulator
Date: Wed, 18 Jun 2014 10:54:48 +0100
Message-ID: <20140618095448.GK23945@lee--X1>
References: <1402964830-24890-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402964830-24890-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mark,

The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626=
b38f:

  Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-re=
gulator-v3.17

for you to fetch changes up to d1f79ff65b2c6a9e2785ac94c2eb6a5229859251=
:

  dt-bindings: mfd: s2mps11: Add support S2MPU02 PMIC (2014-06-18 10:18=
:45 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator for v3.17

----------------------------------------------------------------
Chanwoo Choi (3):
      mfd: sec-core: Add support for S2MPU02 device
      regulator: s2mps11: Add support S2MPU02 regulator device
      dt-bindings: mfd: s2mps11: Add support S2MPU02 PMIC

 Documentation/devicetree/bindings/mfd/s2mps11.txt |   7 +-
 drivers/mfd/sec-core.c                            |  71 ++++-
 drivers/mfd/sec-irq.c                             | 110 ++++++--
 drivers/regulator/s2mps11.c                       | 321 ++++++++++++++=
++++++--
 include/linux/mfd/samsung/core.h                  |   1 +
 include/linux/mfd/samsung/irq.h                   |  24 ++
 include/linux/mfd/samsung/s2mpu02.h               | 201 ++++++++++++++
 7 files changed, 682 insertions(+), 53 deletions(-)
 create mode 100644 include/linux/mfd/samsung/s2mpu02.h

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

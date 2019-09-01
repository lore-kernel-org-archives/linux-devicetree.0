From: Avri Altman <Avri.Altman@wdc.com>
Subject: RE: [PATCH v4 0/3] Qualcomm UFS device reset support
Date: Sun, 1 Sep 2019 06:12:15 +0000
Message-ID: <MN2PR04MB699135203C45147049130AB6FCBF0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Bean Huo <beanhuo@micron.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,=20
>=20
> This series adds a new ufs vops to allow platform specific methods for
> resetting an attached UFS device, then implements this for the
> Qualcomm driver.
> This reset seems to be necessary for the majority of Dragonboard845c
> devices.
>=20
> Bean requested in v3 that a software fallback mechanism, using
> UIC_CMD_DME_END_PT_RST. I have not been successful in validating
> that this
> works for me, so I'm postponing this effort and hoping we can add it
> incrementally at a later time.
This series looks good to me.
Yeah - We can add and test the uic command bail-out once this is accepted.

Thanks,
Avri

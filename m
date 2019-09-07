From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v4 0/3] Qualcomm UFS device reset support
Date: Sat, 07 Sep 2019 16:37:21 -0400
Message-ID: <yq1d0gbkflq.fsf@oracle.com>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org> (Bjorn
        Andersson's message of "Wed, 28 Aug 2019 12:17:53 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org


Bjorn,

> This series adds a new ufs vops to allow platform specific methods for
> resetting an attached UFS device, then implements this for the
> Qualcomm driver.  This reset seems to be necessary for the majority of
> Dragonboard845c devices.

Applied to 5.4/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

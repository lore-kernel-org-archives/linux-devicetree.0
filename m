From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: RE: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
Date: Sat, 24 Aug 2019 23:11:58 +0200
Message-ID: <20190824211158.5900-1-martin.blumenstingl@googlemail.com>
References: <90cc600d6f7ded68f5a618b626bd9cffa5edf5c3.1566531960.git.eswara.kota@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <90cc600d6f7ded68f5a618b626bd9cffa5edf5c3.1566531960.git.eswara.kota@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: eswara.kota@linux.intel.com
Cc: cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, qi-ming.wu@intel.com, robh@kernel.org, hauke@hauke-m.de
List-Id: devicetree@vger.kernel.org

Hi Dilip,

> Add driver for the reset controller present on Intel
> Lightening Mountain (LGM) SoC for performing reset
> management of the devices present on the SoC. Driver also
> registers a reset handler to peform the entire device reset.

[...]
> +static const struct of_device_id intel_reset_match[] = {
> +	{ .compatible = "intel,rcu-lgm" },
> +	{}
> +};
how is this IP block differnet from the one used in many Lantiq SoCs?
there is already an upstream driver for the RCU IP block on the Lantiq
SoCs: drivers/reset/reset-lantiq.c

some background:
Lantiq was started as a spinoff from Infineon in 2009. Intel then
acquired Lantiq in 2015. source: [0]
Intel is re-using some of the IP blocks from the MIPS Lantiq SoCs
(Intel even has some own MIPS SoCs as part of the Lantiq acquisition,
typically used for PON/GPON/ADSL/VDSL capable network devices).
Thus I think it is likely that the new "Lightening Mountain" SoCs use
an updated version of the Lantiq RCU IP.


Martin


[0] https://wikidevi.com/wiki/Lantiq

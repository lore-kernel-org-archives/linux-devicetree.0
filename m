From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2 1/2] EDAC: add EDAC driver for DMC520
Date: Sat, 23 Mar 2019 10:23:42 +0100
Message-ID: <20190323092342.GD23698@zn.tnic>
References: <BN7PR08MB5572D3A5217C4749AC4E7DC4AE4C0@BN7PR08MB5572.namprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BN7PR08MB5572D3A5217C4749AC4E7DC4AE4C0@BN7PR08MB5572.namprd08.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rui Zhao <ruizhao@outlook.com>, "james.morse@arm.com" <james.morse@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "okaya@kernel.org" <okaya@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, Rui Zhao <ruizhao@microsoft.com>
List-Id: devicetree@vger.kernel.org

Just some initial comments. The general direction of this should be
looked at by James.

On Thu, Mar 07, 2019 at 01:24:01AM +0000, Rui Zhao wrote:
> From: Rui Zhao <ruizhao@microsoft.com>
> 
> New driver supports error detection and correction on
> the devices with ARM DMC-520 memory controller.
> 
> Signed-off-by: Rui Zhao <ruizhao@microsoft.com>
> ---
>  MAINTAINERS                |   6 +
>  drivers/edac/Kconfig       |   7 +
>  drivers/edac/Makefile      |   1 +
>  drivers/edac/dmc520_edac.c | 619 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 633 insertions(+)
>  create mode 100644 drivers/edac/dmc520_edac.c

...

> diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
> index 716096d..793d64f 100644
> --- a/drivers/edac/Makefile
> +++ b/drivers/edac/Makefile
> @@ -78,3 +78,4 @@ obj-$(CONFIG_EDAC_SYNOPSYS)		+= synopsys_edac.o
>  obj-$(CONFIG_EDAC_XGENE)		+= xgene_edac.o
>  obj-$(CONFIG_EDAC_TI)			+= ti_edac.o
>  obj-$(CONFIG_EDAC_QCOM)			+= qcom_edac.o
> +obj-$(CONFIG_EDAC_DMC520)		+= dmc520_edac.o
> diff --git a/drivers/edac/dmc520_edac.c b/drivers/edac/dmc520_edac.c
> new file mode 100644
> index 0000000..c70ce4e
> --- /dev/null
> +++ b/drivers/edac/dmc520_edac.c
> @@ -0,0 +1,619 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// EDAC driver for DMC-520

No "//" commenting in .c files. Make sure to have a cursory look at

Documentation/process/submitting-patches.rst

Also, this patch doesn't apply - please redo it against:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=for-next

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

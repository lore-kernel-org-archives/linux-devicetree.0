From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v8 02/10] edac: synopsys: Rename the static functions to
 a shorter name
Date: Mon, 8 Oct 2018 20:03:38 +0200
Message-ID: <20181008180338.GB5919@zn.tnic>
References: <1538667328-9465-1-git-send-email-manish.narani@xilinx.com>
 <1538667328-9465-3-git-send-email-manish.narani@xilinx.com>
 <20181004203540.GD5149@zn.tnic>
 <DM6PR02MB52274CC51BE196CF18C97834C1E60@DM6PR02MB5227.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DM6PR02MB52274CC51BE196CF18C97834C1E60@DM6PR02MB5227.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <MNARANI@xilinx.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 08, 2018 at 01:45:28PM +0000, Manish Narani wrote:
> >  /**
> > - * synps_edac_get_eccstate - Return the controller ecc enable/disable status
> > - * @base:	Pointer to the ddr memory controller base address
> > + * get_ecc_state - Return the controller ECC enable/disable status
> 
> Nit: ecc --> ECC correction can be moved to Comments correction patch. Minor. Can keep it here too. 
> 

All fixed except this one - this one can remain here because the patch
is touching the line anyway.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/3] thermal: broadcom: Add Stingray thermal driver
Date: Mon, 29 Apr 2019 16:24:22 +0100
Message-ID: <20190429152422.GC17516@e107155-lin>
References: <1527486084-4636-1-git-send-email-srinath.mannam@broadcom.com>
 <1527486084-4636-4-git-send-email-srinath.mannam@broadcom.com>
 <da76e12f246c3f10bfed28d8b91a3575dc73f243.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <da76e12f246c3f10bfed28d8b91a3575dc73f243.camel@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: Srinath Mannam <srinath.mannam@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 29, 2019 at 06:07:12PM +0300, David Woodhouse wrote:
> On Mon, 2018-05-28 at 11:11 +0530, Srinath Mannam wrote:
> > From: Pramod Kumar <pramod.kumar@broadcom.com>
> >
> > This commit adds stingray thermal driver to monitor six
> > thermal zones temperature and trips at critical temperature.
>
> This matches an ACPI "BRCM0500" device but then calls
> devm_thermal_zone_of_sensor_register(), which AFAICT is going to fail
> on an ACPI system because the first thing that does is call
> of_find_node_by_name(NULL, "thermal-zones") which isn't going to find a
> match.
>

Thanks David for bringing this up. I hadn't noticed that this driver is
cheekily trying to do thermal management in ACPI using crafty
acpi_device_id match. ACPI thermal objects/methods must be used in the
firmware to do thermal management.

Pramod, can you remove the ACPI support or I can go ahead and post the
patch to do the same ?

> How does this work in the ACPI case?

It can't and shouldn't work if one can make it happen :)

--
Regards,
Sudeep

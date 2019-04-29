From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH 3/3] thermal: broadcom: Add Stingray thermal driver
Date: Mon, 29 Apr 2019 20:58:26 +0530
Message-ID: <CABe79T4MYf65QM+OHTPa_F8uG6_pd-9VLMQOHb9EPRyj2mEx1A@mail.gmail.com>
References: <1527486084-4636-1-git-send-email-srinath.mannam@broadcom.com>
 <1527486084-4636-4-git-send-email-srinath.mannam@broadcom.com>
 <da76e12f246c3f10bfed28d8b91a3575dc73f243.camel@infradead.org> <20190429152422.GC17516@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429152422.GC17516@e107155-lin>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi David,

Thank you for notifying..

Hi Sudeep,

I will send a patch to remove ACPI support.

Regards,
Srinath.

On Mon, Apr 29, 2019 at 8:54 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Mon, Apr 29, 2019 at 06:07:12PM +0300, David Woodhouse wrote:
> > On Mon, 2018-05-28 at 11:11 +0530, Srinath Mannam wrote:
> > > From: Pramod Kumar <pramod.kumar@broadcom.com>
> > >
> > > This commit adds stingray thermal driver to monitor six
> > > thermal zones temperature and trips at critical temperature.
> >
> > This matches an ACPI "BRCM0500" device but then calls
> > devm_thermal_zone_of_sensor_register(), which AFAICT is going to fail
> > on an ACPI system because the first thing that does is call
> > of_find_node_by_name(NULL, "thermal-zones") which isn't going to find a
> > match.
> >
>
> Thanks David for bringing this up. I hadn't noticed that this driver is
> cheekily trying to do thermal management in ACPI using crafty
> acpi_device_id match. ACPI thermal objects/methods must be used in the
> firmware to do thermal management.
>
> Pramod, can you remove the ACPI support or I can go ahead and post the
> patch to do the same ?
>
> > How does this work in the ACPI case?
>
> It can't and shouldn't work if one can make it happen :)
>
> --
> Regards,
> Sudeep

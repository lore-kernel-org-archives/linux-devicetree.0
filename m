From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 1/3] vfio, platform: add support for ACPI while detecting the reset driver
Date: Tue, 29 Mar 2016 11:25:47 +0200
Message-ID: <98854818.NJS35fvhsb@wuerfel>
References: <1459172124-6730-1-git-send-email-okaya@codeaurora.org> <1459172124-6730-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <1459172124-6730-2-git-send-email-okaya@codeaurora.org>
Sender: kvm-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sinan Kaya <okaya@codeaurora.org>, kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Baptiste Reynal <b.reynal@virtualopensystems.com>, vikrams@codeaurora.org, marc.zyngier@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, vinod.koul@intel.com, Alex Williamson <alex.williamson@redhat.com>, agross@codeaurora.org, Dan Carpenter <dan.carpenter@oracle.com>, shankerd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Monday 28 March 2016 09:35:22 Sinan Kaya wrote:
> The code is using the compatible DT string to associate a reset driver with
> the actual device itself. The compatible string does not exist on ACPI
> based systems. HID is the unique identifier for a device driver instead.
> The change allows a driver to register with DT compatible string or ACPI
> HID and then match the object with one of these conditions.
> 
> Rules for loading the reset driver are as follow:
> - ACPI HID needs match for ACPI systems
> - DT compat needs to match for OF systems
> 
> Tested-by: Eric Auger <eric.auger@linaro.org> (device tree only)
> Tested-by: Shanker Donthineni <shankerd@codeaurora.org> (ACPI only)
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> 


This really feels wrong for two reasons:

* device assignment of non-PCI devices is really special and doesn't
  seem to make sense on general purpose servers that would be the target
  for ACPI normally

* If there is indeed a requirement for ACPI to handle something like this,
  it should be part of the ACPI spec, with a well-defined method of handling
  reset, rather than having to add a device specific hack for each
  device separately.

	Arnd

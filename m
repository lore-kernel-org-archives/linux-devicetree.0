From: Feng Kan <fkan@apm.com>
Subject: Re: [PATCH V2 0/6] Enable X-Gene platform reboot driver.
Date: Wed, 15 Jan 2014 09:39:17 -0800
Message-ID: <CAL85gmC+OR_hR+jtsAdBSgMau7MnHZSqFpoR+VJ7dWNOGdfBXQ@mail.gmail.com>
References: <1389135041-16062-1-git-send-email-fkan@apm.com>
	<20140114160755.GC4307@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20140114160755.GC4307@srcf.ucam.org>
Sender: linux-acpi-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 14, 2014 at 8:07 AM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> On Tue, Jan 07, 2014 at 02:50:35PM -0800, Feng Kan wrote:
>> Enable X-Gene platform driver for the X-Gene platform. Remove the
>> use of the mask attribute from the reboot dts node. Add support
>> for using the ACPI and DTS resource for the reboot driver.
>
> Why can't you just use the standard ACPI reboot register values in the
> FADT?
>
FKAN: I am removing the acpi patch in the next round. Mainly, I don't see a
way for the arm64 kernel to use those values. EFI in x86 have some runtime
services that can be triggered to call reset_system, but that code is not
available yet in arm64.

> --
> Matthew Garrett | mjg59@srcf.ucam.org

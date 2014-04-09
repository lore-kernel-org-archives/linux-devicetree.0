From: Borislav Petkov <bp@alien8.de>
Subject: Re: [RFC PATCH v2] edac: synopsys: Added EDAC support for zynq ddr
 ecc controller
Date: Wed, 9 Apr 2014 13:03:39 +0200
Message-ID: <20140409110339.GF6529@pd.tnic>
References: <1220b715-6fc2-42ed-8393-b9859fc0deb9@TX2EHSMHS021.ehs.local>
 <20140408204047.GQ30077@pd.tnic>
 <CAGnW=BYJxEkhAitCGi-i6+260-i-+GPrg0yPcY=M+7YmDF6ZRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGnW=BYJxEkhAitCGi-i6+260-i-+GPrg0yPcY=M+7YmDF6ZRw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: punnaiah choudary kalluri <punnaia@xilinx.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, dougthompson@xmission.com, linux-edac@vger.kernel.org, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, sorenb@xilinx.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Punnaiah Choudary <kpc528@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 09, 2014 at 11:34:31AM +0530, punnaiah choudary kalluri wrote:
> Since it is recommended in Documentation/kernel-doc-nano-HOWTO.txt
> but also said it is low priority and at the discretion of the MAINTAINER of
> that kernel source file
> 
> So, if you recommend not use kernel-doc annotation then i will take care
> in next version.

I don't think there's need for documenting those functions for
kernel-doc - it is an EDAC driver and not some subsystem function with a
lot of users.

> devm_ioremap_resource function will check this condition, so not
> checking for the NULL explicitly

And it would say

	dev_err(dev, "invalid resource\n");

so we'll know what fails, ok.

> Since the probe returns error, it it that the devm_ framework will
> clean these resources automatically?

Ah, that's the managed thing, ok.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

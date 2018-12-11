Return-Path: <SRS0=IqaF=OU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57344 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbeLKOSR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Dec 2018 09:18:17 -0500
Date: Tue, 11 Dec 2018 06:18:14 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
Message-ID: <20181211141814.GM6707@atomide.com>
References: <20181210144851.GZ6707@atomide.com>
 <20181210154426.GB6707@atomide.com>
 <7e50de23-10d3-511b-a16d-4c32ba58a842@ti.com>
 <20181210162123.GC6707@atomide.com>
 <20181210163830.GD6707@atomide.com>
 <2b736366-7d16-3cd5-0216-1072784a5d36@ti.com>
 <20181210172327.GE6707@atomide.com>
 <7ac1fd56-d8c9-d622-a53c-ce6e9da862e5@ti.com>
 <404d06a3-c2b4-d287-8776-b09c9eb52d9d@ti.com>
 <2db7b1c5-87aa-a3ec-3b66-882adedeb717@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2db7b1c5-87aa-a3ec-3b66-882adedeb717@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [181211 10:53]:
> > It looks like there is a bug in tilcdc as well, but the display is not
> > coming up because the backlight is not proping:
> > [    0.618627] ecap 48304000.epwmss:ecap@48304100: invalid resource
> > [    0.618822] ecap: probe of 48304000.epwmss:ecap@48304100 failed with
> > error -22
> 
> Sent a patch to fix the ecap:
> ARM: dts: am33xx-l4: Fix epwmssX/ecapX/ehrpwmX ranges and reg
> 
> Now LCD is working.

OK good to hear. I did not get LCD enabled on am335x-evm even with
adding 800x600 EDID file.

Regards,

Tony

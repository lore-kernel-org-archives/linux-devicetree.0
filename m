From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH V2 1/2] arm/dts: OMAP2: Add support for OMAP2420 SDP
Date: Tue, 12 Jun 2012 00:20:26 -0700
Message-ID: <20120612072025.GG12766@atomide.com>
References: <1339107066-10461-1-git-send-email-jon-hunter@ti.com>
 <1339107066-10461-2-git-send-email-jon-hunter@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1339107066-10461-2-git-send-email-jon-hunter@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Jon Hunter <jon-hunter@ti.com>
Cc: device-tree <devicetree-discuss@lists.ozlabs.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

* Jon Hunter <jon-hunter@ti.com> [120607 15:15]:
> Simple DTS file for OMAP2420 SDP adding memory information to allow device-tree
> testing on an OMAP2420 SDP.
> 
> Verified that kernel boots with DT using a simple RAMDISK file-system on
> OMAP2420 SDP.

I suspect this is the H4 board? If so, please rename it to H4 as it shares
the "debug board" with H2 and H3 so in theory we may at some point have
some common .dtsi for the debug board devices..

Regards,

Tony

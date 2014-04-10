From: Borislav Petkov <bp@alien8.de>
Subject: Re: [RFC PATCH v2] edac: synopsys: Added EDAC support for zynq ddr
 ecc controller
Date: Thu, 10 Apr 2014 12:05:42 +0200
Message-ID: <20140410100542.GH29093@pd.tnic>
References: <1220b715-6fc2-42ed-8393-b9859fc0deb9@TX2EHSMHS021.ehs.local>
 <20140408204047.GQ30077@pd.tnic>
 <534633C0.9090905@monstr.eu>
 <20140410092144.GD29093@pd.tnic>
 <5e0042b6-f169-4025-8fd7-9d70c2ed0cf6@AM1EHSMHS012.ehs.local>
 <20140410100047.GG29093@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140410100047.GG29093@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Michal Simek <monstr@monstr.eu>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, dougthompson@xmission.com, linux-edac@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, sorenb@xilinx.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, punnaia@xilinx.com
List-Id: devicetree@vger.kernel.org

On Thu, Apr 10, 2014 at 12:00:47PM +0200, Borislav Petkov wrote:
> Then you'll have to check whether edac can even stomach more than one
> drivers in parallel. TTBOMK, no one has ever done this so far... Yadda
> yadda.

Alternatively, you could put together a single edac driver which
contains both zynq and L2 functionality.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

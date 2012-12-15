From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/7] ARM: sh7372: add missing "#interrupt-cells"
 properties
Date: Sat, 15 Dec 2012 18:05:28 +0900
Message-ID: <20121215090527.GI9073@verge.net.au>
References: <1355503531-7276-1-git-send-email-g.liakhovetski@gmx.de>
 <1355503531-7276-2-git-send-email-g.liakhovetski@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1355503531-7276-2-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-sh-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2012 at 05:45:25PM +0100, Guennadi Liakhovetski wrote:
> Two of four interrupt controllers in sh7372.dtsi are missing the compulsory
> "#interrupt-cells" properties. Fix this.

Thanks.

I think that is fixed in the latest INTC DT series that I posted just
a few moments ago "[RFC v7 00/10] ARM: shmobile: DT initialisation of INTC
and GIC".

Sorry for sitting on that code for so long. Could you check if the
problem you saw is resolved?

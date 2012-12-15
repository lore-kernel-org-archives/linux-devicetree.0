From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/7] ARM: sh7372: add clock lookup entries for DT-based
 devices
Date: Sat, 15 Dec 2012 17:36:14 +0900
Message-ID: <20121215083613.GG9073@verge.net.au>
References: <1355503531-7276-1-git-send-email-g.liakhovetski@gmx.de>
 <1355503531-7276-5-git-send-email-g.liakhovetski@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1355503531-7276-5-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-sh-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2012 at 05:45:28PM +0100, Guennadi Liakhovetski wrote:
> When booting with DT, devices are named differently. To get their clocks
> additional entries have to be added to the lookup table.

Thanks applied.

I have applied this to a temporary 'soc5' branch which is based on 3.7-rc1.
I will rebase this on 3.8-rc1 once it is released and rename the branch
to the more sane 'soc'.

I have also merged this change into the next branch.


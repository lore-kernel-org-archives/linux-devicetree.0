From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/7] ARM: sh7372: add clock lookup entries for DT-based devices
Date: Sat, 15 Dec 2012 07:29:32 +0000
Message-ID: <20121215072932.3DC0B3E0C0F@localhost>
References: <1355503531-7276-1-git-send-email-g.liakhovetski@gmx.de> <1355503531-7276-5-git-send-email-g.liakhovetski@gmx.de>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1355503531-7276-5-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-sh-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 14 Dec 2012 17:45:28 +0100, Guennadi Liakhovetski <g.liakhovetski@gmx.de> wrote:
> When booting with DT, devices are named differently. To get their clocks
> additional entries have to be added to the lookup table.
> 
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>

Please use AUXDATA to manipulate the device name for consistency with
other platforms. When clock bindings get added to the device tree for
this platform then all the AUXDATA declarations can be removed.

g.


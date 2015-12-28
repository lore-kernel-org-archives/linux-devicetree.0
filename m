From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: porter: add DU DT support
Date: Tue, 29 Dec 2015 08:43:25 +1100
Message-ID: <20151228214325.GA16456@verge.net.au>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
 <2158897.lfmL4b1c4V@wasted.cogentembedded.com>
 <20151228052902.GF1066@verge.net.au>
 <568148B5.6080202@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <568148B5.6080202@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 28, 2015 at 05:35:33PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 12/28/2015 08:29 AM, Simon Horman wrote:
> 
> >>Define  the Porter board dependent part of the DU device node.
> >>Add the device node  for Analog Devices ADV7511W  HDMI transmitter to I2C2
> >>bus and the HDMI connector. Add the necessary subnodes to interconnect  DU
> >>and HDMI devices.
> >>
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >>---
> >>This patch is against 'renesas-devel-20151221-v4.4-rc6' tag of Simon Horman's
> >>'renesas.git' repo.
> >
> >Thanks, I have queued this up for v4.6.
> 
>    Actually, I was going to check this patch WRT the DU channels used, given
> Laurent's remark. OK, I will just send an incremental patch if needed.

Thanks and sorry for being a bit hasty.

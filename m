From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: porter: add CAN0 DT support
Date: Wed, 28 Oct 2015 07:41:42 +0900
Message-ID: <20151027224142.GB21745@verge.net.au>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
 <5706086.RKBCVZugI4@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5706086.RKBCVZugI4@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 28, 2015 at 12:03:22AM +0300, Sergei Shtylyov wrote:
> Define the Porter board dependent part of the CAN0 device node.
> 
> This patch is  analogous to the commit 457acc4a6ce8 (ARM: shmobile:
> henninger: add CAN0 DT support) as there are no differences between the
> boards in this respect.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, I have queued this up for v4.5 after updating the changelog
as per checkpatch.pl's insight:

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 457acc4a6ce8 ("ARM: shmobile: henninger: add CAN0 DT support")'
#8: 
This patch is  analogous to the commit 457acc4a6ce8 (ARM: shmobile:

From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: porter: add HS-USB DT support
Date: Thu, 15 Oct 2015 09:18:18 +0900
Message-ID: <20151015001818.GA25019@verge.net.au>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
 <80272771.MSjafmr6yE@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <80272771.MSjafmr6yE@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 14, 2015 at 10:35:46PM +0300, Sergei Shtylyov wrote:
> Enable HS-USB device  for the Porter board, defining the GPIO that the
> driver should check  when probing (which is the ID output from MAX3355
> OTG chip).
> 
> Note that there  will be pinctrl-related error messages if both internal
> PCI  and  HS-USB drivers are enabled but they should be just ignored.
> 
> This patch is  analogous  to the commit 6f4f7156e0e6 (ARM: shmobile:
> henninger: enable HS-USB) as there  are no differences between the
> boards in this respect.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 

Thanks Sergei,

I have queued this up for v4.5.

I took the liberty of tweaking the changelog to address a complaint made
by Mr. Check Patch.

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 6f4f7156e0e6 ("ARM: shmobile: henninger: enable HS-USB")'

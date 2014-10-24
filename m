From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 0/2] Add HS-USB device tree support for R8A7790/Lager
 board
Date: Fri, 24 Oct 2014 14:09:28 +0900
Message-ID: <20141024050928.GI7537@verge.net.au>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 11:53:11PM +0400, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20141007-v3.17' tag. Here we add the HS-USB device tree support
> on the R8A7790/Lager reference board. The patchset requires the USB PHY
> driver (already merged by Kishon and Greg) and the generic PHY support patches
> for the HS-USB driver posted by Yoshihiro Shimoda in order to work...
> 
> [1/2] ARM: shmobile: r8a7790: add HS-USB device node
> [2/2] ARM: shmobile: lager: enable HS-USB

Now that v3.18-rc1 is present in my devel branch should I queue-up
these patches? If so, please rebase them on renesas-devel-20141024-v3.18-rc1

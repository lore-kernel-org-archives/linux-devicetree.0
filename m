From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: henninger: remove board DT
Date: Thu, 29 Oct 2015 07:34:01 +0900
Message-ID: <20151028223358.GA27318@verge.net.au>
References: <2890345.M5sT48V28r@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2890345.M5sT48V28r@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 29, 2015 at 12:34:29AM +0300, Sergei Shtylyov wrote:
> The Henninger low cost board was never sold and so  had  no  users outside
> Renesas (and Cogent Embedded). Instead Renesas  has made the Porter  board
> which has mostly similar hardware. Now that the Porter board support is on
> par with Henninger, we can remove  the Henninger's device tree file.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, I have queued this up for v4.5.

From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: porter: enable PCIe
Date: Mon, 12 Oct 2015 09:08:23 +0900
Message-ID: <20151012000823.GD20025@verge.net.au>
References: <13633423.im5T5IW5o3@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <13633423.im5T5IW5o3@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 10, 2015 at 12:41:26AM +0300, Sergei Shtylyov wrote:
> Enable the PCIe controller and clock for the Porter board.
> 
> This patch is analogous to the commit 485f3ce67c11 ("ARM: shmobile:
> henninger: Enable PCIe Controller & PCIe bus clock") as there are no
> differences between the boards in this respect.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against 'renesas-devel-20151008-v4.3-rc4' tag  of Simon Horman's
> 'renesas.git' repo plus the Porter I2C2, VIN0/ADV7180, and QSPI patches posted
> earlier.

Thanks, I have queued this up for v4.4.

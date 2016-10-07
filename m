From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 0/11] Add R8A7743/SK-RZG1M board support
Date: Fri, 7 Oct 2016 19:40:34 +0300
Message-ID: <5be99d76-a082-129b-1aa6-b6f7402ae79b@cogentembedded.com>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10/06/2016 12:23 AM, Sergei Shtylyov wrote:

>    Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20161003-v4.8' tag. I'm adding the device tree support for
> the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
> seems identical to the R8A7791/Porter board. The device tree patches depend on
> the R8A7743 CPG/MSSR driver series just posted in order to compile and work.

    Forgot to mention that this version causes a regression with the sh_eth 
driver (well, actually with phylib): since IRQC now gets a deferred probing, 
PHY IRQ doesn't work anymore -- phylib falls back to polling.

MBR, Sergei

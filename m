From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 0/3] Add R8A7791/Henninger board CAN DT support
Date: Fri, 20 Feb 2015 00:44:26 +0300
Message-ID: <54E6593A.500@cogentembedded.com>
References: <1652479.NHBlqJ9OaR@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1652479.NHBlqJ9OaR@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/06/2015 01:22 AM, Sergei Shtylyov wrote:

>     Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20141231-v3.19-rc2' tag. Here we add the CAN device tree support
> for the R8A7791-based Henninger board. It depends on the clk driver RCAN clock
> patch reposted today in order to work.

    Simon, now that this patch has been merged, could you merge the patchset too?

> [1/3] ARM: shmobile: r8a7791: add CAN clocks
> [2/3] ARM: shmobile: r8a7791: add CAN DT support
> [3/3] ARM: shmobile: henninger: add CAN0 DT support

WBR, Sergei


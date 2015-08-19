From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/2] Add R8A7794/SILK I2C device tree support
Date: Thu, 20 Aug 2015 01:08:33 +0300
Message-ID: <55D4FE61.5010800@cogentembedded.com>
References: <2390854.nqPs17CVpc@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2390854.nqPs17CVpc@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/20/2015 12:57 AM, Sergei Shtylyov wrote:

>     Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20150819-v4.2-rc7' tag. Here we add the I2C device tree support
> for the R8A7794/SILK board.
>
> [1/2] ARM: shmobile: r8a7794: add I2C DT support
> [2/2] ARM: shmobile: silk: add I2C1 DT support

    Simon, actually the above patch is atop of my SILK SDHI1 patch but should 
apply with offsets atop of your tag.

MBR, Sergei


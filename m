From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/2] Add R8A7791 EtherAVB DT support
Date: Fri, 4 Dec 2015 17:00:37 +0300
Message-ID: <56619C85.6040102@cogentembedded.com>
References: <2926317.Iq110C4Bmk@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2926317.Iq110C4Bmk@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 12/3/2015 1:19 AM, Sergei Shtylyov wrote:

>     Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20151201-v4.4-rc3' tag. Here we add the EtherAVB device tree
> support for the R8A7791 SoC. The 2nd patch depends on the Simon's recent
> EtherAVB driver patches in order to work...

    Well, not exactly "work", as the node is disabled. Anyway, Simon's patches 
got merged to net-next.git by Dave, so I think this series can be merged now 
as well...

> [1/2] ARM: shmobile: r8a7791: add EtherAVB clock
> [2/2] ARM: shmobile: r8a7791: add EtherAVB DT support

MBR, Sergei


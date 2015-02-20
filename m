From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] ARM: shmobile: r8a7791: add ADSP clocks
Date: Fri, 20 Feb 2015 23:02:52 +0300
Message-ID: <54E792EC.4090807@cogentembedded.com>
References: <4692589.Khlcz7yVTN@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <4692589.Khlcz7yVTN@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 12/30/2014 11:20 PM, Sergei Shtylyov wrote:

> Add the ADSP clocks to the CPG and MSTP5 nodes of the R8A7791 device tree.

> Based on the original patch by Konstantin Kozhevnikov
> <konstantin.kozhevnikov@cogentembedded.com>.

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---
> The patch is against 'renesas-devel-20141229-v3.19-rc2' tag of Simon Horman's
> 'renesas.git' repo plus the R8A7791 CAN patches posted last week. It depends on
> the patch adding the ADSP clock support to  the 'clk-rcar-gen2' driver in order
> to work.

    That patch now sits in Mike's tree and should soon be merged by Linus. 
Simon, please consider merging this patch.

WBR, Sergei


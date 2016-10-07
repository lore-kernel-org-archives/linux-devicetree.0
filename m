From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/3] Renesas R8A7743 CPG/MSSR clock support
Date: Fri, 7 Oct 2016 23:35:43 +0300
Message-ID: <7c5715a6-0a29-1055-7b6a-6fe13e4ee96b@cogentembedded.com>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 10/05/2016 11:50 PM, Sergei Shtylyov wrote:

>    Here's the set of 3 patches against the 'clk-next' branch of CLK group's
> 'linux.git' repo. The R8A7743 SoC support will be posted separately later --
> this series depend on the Kconfig variable introduced there, however, the DTs
> in that series will depend on the patch #2 of this series...
>
> [1/3] clk: renesas: cpg-mssr: add common R-Car Gen2 support

    This will probably have to be fixed up to handle the absence of the PLL0CR 
register oin the low end SoC (like RZ/G1E)...

> [2/3] ARM: shmobile: r8a7743: add CPG clock index macros
> [3/3] clk: renesas: cpg-mssr: add R8A7743 support

    I'm splitting the above 2 patches into a new series and will repost it RSN.

MBR, Sergei

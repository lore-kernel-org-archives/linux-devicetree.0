From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/5] arm64: dts: renesas: r8a77970: enable HDMI output
Date: Thu, 1 Feb 2018 11:16:25 +0300
Message-ID: <5da7d5be-87ed-2515-b9f9-70cadd8a8819@cogentembedded.com>
References: <20180131161811.12699-1-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180131161811.12699-1-niklas.soderlund@ragnatech.se>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>, Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

On 1/31/2018 7:18 PM, Niklas Söderlund wrote:

> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Hi,
> 
> This series enables the HDMI out put on V3M. It is based on top of the
> latest renesas-drivers release and depends on patches from both Laurent
> and Sergei.
> 
> - [PATCH v2 00/12] R-Car DU: Convert LVDS code to bridge driver
> - [PATCH v2 0/2] Add R-Car V3M (R8A77970) support to the DU driver
> - [PATCH 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS driver
> 
> It is tested on V3M by connecting the HDMI output to a monitor and
> booting the board. To console shall eventually show up on the screen.
> 
> Niklas Söderlund (5):
>    arm64: dts: renesas: r8a77970: add FCPVD node
>    arm64: dts: renesas: r8a77970: Add VSPD instance
>    arm64: dts: renesas: r8a77970: add DU instance
>    arm64: dts: renesas: r8a77970: add the LVDS instance

    I have already posted such series, hadn't you seen it?

>    arm64: dts: renesas: eagle: add HDMI output using the ADV7511W

    Not posted this patch, however -- I was only doing it for the V3M Starter 
Kit board.

>   arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 66 +++++++++++++++++++++++
>   arch/arm64/boot/dts/renesas/r8a77970.dtsi      | 72 ++++++++++++++++++++++++++
>   2 files changed, 138 insertions(+)

MBR, Sergei

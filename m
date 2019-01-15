From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 0/3] arm64: ti: k3-am654: USB support
Date: Tue, 15 Jan 2019 08:33:06 -0600
Message-ID: <20190115143306.wub3y2c2zsq7byy5@kahuna>
References: <1547200861-17795-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547200861-17795-1-git-send-email-rogerq@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: t-kristo@ti.com, nsekhar@ti.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12:00-20190111, Roger Quadros wrote:
> Hi,
> 
> The AM654 SoC supports 2 DWC3 USB controller instances. The
> AM654 base board supports the 2nd (USB1) instance in high-speed.
> 
> This series enables support for USB1 instance on the AM654-base-board.
> 
> To test, you need to first apply the below 2 series.
> 
> AM654 USB2 PHY support https://lkml.org/lkml/2018/12/5/908
> AM654 DWC3 support https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1896101.html
> 

Please clarify if these have hit linux-next yet (I dont see anything in
the threads as to being picked up yet, may be I am wrong). Once they do hit
linux-next, please rebase to Tero's latest tip and repost.


-- 
Regards,
Nishanth Menon

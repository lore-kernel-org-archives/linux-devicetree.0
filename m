From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: phycore: Remove 1.8 GHz operation point
Date: Wed, 14 Feb 2018 09:07:31 +0100
Message-ID: <7871181.EPqc8gR4GV@diego>
References: <1518515074-22526-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518515074-22526-1-git-send-email-d.schultz@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Schultz <d.schultz@phytec.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. Februar 2018, 10:44:32 CET schrieb Daniel Schultz:
> Rockchip recommends to run the CPU cores only with operations points of
> 1.6 GHz or lower.
> 
> Removed the cpu0 node with too high operation points and use the default
> values instead.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>

applied all 3 for 4.17


Thanks
Heiko

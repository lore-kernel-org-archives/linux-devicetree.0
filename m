From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm: dts: rockchip: Fix typo in rk32288 sdmmc card detect pin name
Date: Sat, 12 Dec 2015 00:08:17 +0100
Message-ID: <1649282.ILIgoNi0K6@diego>
References: <1449845158-8284-1-git-send-email-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449845158-8284-1-git-send-email-mbrugger@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, olof@lixom.net, lorenzo.pieralisi@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

Am Freitag, 11. Dezember 2015, 15:45:58 schrieb Matthias Brugger:
> The card detect pin is currently called sdmcc-cd.
> This patch fixes the typo and renames the pin to sdmmc-cd.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

applied to my dts32 branch for 4.5, after fixing the rk32288 in the subject


Thanks
Heiko

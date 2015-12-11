From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: Fix typo in rk3368 card detect binding
Date: Fri, 11 Dec 2015 15:35:04 +0100
Message-ID: <8411276.uRATKJsWEo@diego>
References: <1449840139-32420-1-git-send-email-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449840139-32420-1-git-send-email-mbrugger@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, olof@lixom.net, lorenzo.pieralisi@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

Am Freitag, 11. Dezember 2015, 14:22:19 schrieb Matthias Brugger:
> The card detect pin is called sdmcc-cd.
> This patch fixes the typo and renames the pin to sdmmc-cd.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

applied to my arm64 dts branch, after fixing up the subject.


Thanks
Heiko

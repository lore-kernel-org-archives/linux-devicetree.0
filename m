From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 3/9] ARM: dts: rockchip: rk3288-vyasa: Use vmmc-supply
 from PMIC
Date: Tue, 17 Oct 2017 21:10:23 +0200
Message-ID: <3048917.UNI3VLpOcx@phil>
References: <1508156187-27519-1-git-send-email-jagan@amarulasolutions.com>
 <1508156187-27519-4-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1508156187-27519-4-git-send-email-jagan@amarulasolutions.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagannadh.teki@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 16. Oktober 2017, 17:46:21 CEST schrieb Jagan Teki:
> rk808, SWITCH_REG1 has configured for sdmmc regulator as vcc_sd,
> so use the same by renaming vcc33_sd to vcc_sd(as per schematic)
> and drop explicit regulator definition from root.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

applied for 4.15

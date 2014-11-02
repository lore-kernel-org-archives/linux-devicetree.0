From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: add serial aliases for rk3066 and rk3188
Date: Sun, 02 Nov 2014 13:27:44 +0100
Message-ID: <1556322.3CdNOEchaI@diego>
References: <1414684277-17248-1-git-send-email-julien.chauveau@neo-technologies.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414684277-17248-1-git-send-email-julien.chauveau@neo-technologies.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 30. Oktober 2014, 16:51:17 schrieb Julien CHAUVEAU:
> Add aliases for UARTs on rk3066 and rk3188 in order to fix the numbering
> scheme. This will keep the debug console on ttyS2 when UART 1 is disabled,
> for example.
> 
> Signed-off-by: Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>

applied to my dts branch for 3.19

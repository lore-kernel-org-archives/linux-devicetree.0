From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: fix invalid unit-address in rk3188.dtsi
Date: Thu, 13 Nov 2014 00:32:44 +0100
Message-ID: <1834074.A8oL01ENBp@diego>
References: <5384745.1WqprI8GVl@diego> <1415407496-18507-1-git-send-email-julien.chauveau@neo-technologies.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415407496-18507-1-git-send-email-julien.chauveau@neo-technologies.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Samstag, 8. November 2014, 01:44:56 schrieb Julien CHAUVEAU:
> Unit addresses, whilst written in hex, don't contain a 0x prefix.
> 
> Signed-off-by: Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>

added this to my v3.19-armsoc/dts branch

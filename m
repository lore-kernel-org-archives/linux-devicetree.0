From: Paul Bolle <pebolle@tiscali.nl>
Subject: ARM: mvebu: CONFIG_DEBUG_MVEBU_UART_ALTERNATE
Date: Mon, 12 Jan 2015 10:33:56 +0100
Message-ID: <1421055236.22660.12.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Maxime,

Your commit d91125ddf962 ("ARM: mvebu: Rename DEBUG_LL to indicate UART
index") is included in today's linux-next (ie, next-20150112). So is the
related commit bd920490047a ("ARM: mvebu: Add UART1 as DEBUG_LL possible
target"). I noticed because a script I use, spotted a minor issue with
the first commit.

See, the first commit renamed DEBUG_MVEBU_UART_ALTERNATE to
DEBUG_MVEBU_UART0_ALTERNATE (so "0" was added). But there's still a last
reference to CONFIG_DEBUG_MVEBU_UART_ALTERNATE in a comment in
arch/arm/boot/dts/armada-xp-axpwifiap.dts. Is a patch to rename that
last reference queued somewhere? If not, should I submit a trivial patch
to do that?


Paul Bolle

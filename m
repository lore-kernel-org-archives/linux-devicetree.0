From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 0/2] Add support for iNet D978 Rev2 board
Date: Tue, 23 Aug 2016 14:44:49 +0800
Message-ID: <20160823064451.25997-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is a white brand Allwinner A33 tablet board by iNet.

It features a RTL8723BS Wi-Fi/BT combo chip, which is rarely seen on
low-end Allwinner tablets.

The first patch adds basical supports to the tablet, including the Wi-Fi
function of RTL8723BS. (It should be used with the out-of-tree driver at
https://github.com/hadess/rtl8723bs )

The second patch enables the UART1 on the board, which is connected to the
BT part of RTL8723BS. (In order to merge this patch, the patchset
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-August/450774.html
should be firstly merged. It's the reason why I send this patch as a dedicated
patch and do not combine it in PATCH 1/2. And the Bluetooth function needs
a modified version of hciattach by Realtek, which can be now retrieved at
the GitHub, from https://github.com/NextThingCo/rtl8723bs_bt )

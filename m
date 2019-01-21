From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 0/2] mmp2: separate LCDC peripheral clk form the display
Date: Mon, 21 Jan 2019 07:31:27 +0100
Message-ID: <20190121063129.552580-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

this pair of patches fix how the display clocks are configured on the
MMP2 platform.

The dt-bindings patch assumes the SP clock is not there as it probably
was a mistake to expose it (see the 'Revert "dt-bindings: marvell,mmp2:
Add clock id for the SP clock' patch sent separately).

Thanks,
Lubo

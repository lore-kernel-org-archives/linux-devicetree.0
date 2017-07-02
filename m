From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 00/18] JZ4770 support
Date: Sun,  2 Jul 2017 18:29:58 +0200
Message-ID: <20170702163016.6714-1-paul@crapouillou.net>
References: <20170607200439.24450-2-paul@crapouillou.net>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170607200439.24450-2-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is the v3 of my patchset that introduces support for the jz4770 SoC
from Ingenic.

The only change in the whole series is that now
<dt-bindings/clock/jz4770-cgu.h> is introduced in a separate patch (05/18).


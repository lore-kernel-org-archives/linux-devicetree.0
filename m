From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 0/2] clk: vc5: Add IDT VersaClock 5P49V5925
Date: Sun,  9 Jul 2017 20:39:30 +0300
Message-ID: <1499621970-12925-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- Update IDT VersaClock 5 driver to support 5P49V5925
- Add bindings for IDT VersaClock 5P49V5925

This has the following dependency:
- [V3,7/8] clk: vc5: Add bindings for IDT VersaClock 5P49V6901
- [V3,8/8] clk: vc5: Add support for IDT VersaClock 5P49V6901

Vladimir Barinov (2):
[1/2] clk: vc5: Add support for IDT VersaClock 5P49V5925
[2/2] dt: Add bindings for IDT VersaClock 5P49V5925

---
This patchset is against the 'kernel/git/torvalds/linux.git' repo.

 Documentation/devicetree/bindings/clock/idt,versaclock5.txt |   11 +++++++----
 drivers/clk/clk-versaclock5.c                               |   11 +++++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

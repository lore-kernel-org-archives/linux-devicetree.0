From: Markus Mayer <code@mmayer.net>
Subject: [RFC 0/2] Basic divider clock
Date: Tue, 14 Mar 2017 13:22:34 -0700
Message-ID: <20170314202236.39910-1-code@mmayer.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Markus Mayer <mmayer@broadcom.com>, Linux Clock Mailing List <linux-clk@vger.kernel.org>, Device Tree Mailing List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Markus Mayer <mmayer@broadcom.com>

This series contains a patch that was originally submitted by Mike
Turquette in August 2013, but never merged.[1] Although I didn't see
any comments rejecting it.

We have been using this code for our STB platform for quite some time
and wouldn't mind seeing it upstream. What are the current thoughts on
merging this code?

The patch is almost entirely how Mike submitted it originally. For the
purposes of this RFC, I kept my modifications separate, to make it
easier to see what is different from the original. I am expecting that
my modifications would need to be squashed into the main patch with
annotations in the commit message.

There were trivial conflicts applying the original patch to 4.11-rc1.
Those were entirely due to the patch context changing
(clk_hw_unregister_divider() didn't exist back then) and not due to any
incompatibilities with the patch itself.

The other changes I made are listed and described in patch 2/2.

[1] https://patchwork.kernel.org/patch/2848065/

Markus Mayer (1):
  clk: divider: modifications for 4.11

Mike Turquette (1):
  clk: dt: binding for basic divider clock

 .../devicetree/bindings/clock/divider-clock.txt    |  90 +++++++++++++++++++
 drivers/clk/clk-divider.c                          | 100 ++++++++++++++++++++-
 include/linux/clk-provider.h                       |   1 +
 3 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/divider-clock.txt

-- 
2.7.4

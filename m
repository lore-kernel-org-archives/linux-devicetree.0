From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: clk: mb86s7x: ARCH_MB86S7X not defined
Date: Tue, 14 Apr 2015 11:30:28 +0200
Message-ID: <20150414093028.GB29667@station.rsr.lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jaswinder.singh@linaro.org
Cc: andy.green@linaro.org, vincent.yang@socionext.com, nuriya.tetsuya@socionext.com, mturquette@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Andreas Ruprecht <rupran@einserver.de>, stefan.hengelein@fau.de
List-Id: devicetree@vger.kernel.org

Hi Jassi,

your commit 1ccdd04f5365 ("clk: Add clock driver for mb86s7x") is in
today's Linux next tree.  The clock driver clk-mb86s7x.c is
conditionally compiled depending on CONFIG_ARCH_MB86S7X.  This option is
nowhere defined in Kconfig, so that the driver cannot be compiled at its
current tate.

Is there a patch queued somewhere that adds this feature?

I detected this issue with ./scripts/checkkconfigsymbols.py by diffing
yesterday's and today's next tree.

Kind regards,
 Valentin

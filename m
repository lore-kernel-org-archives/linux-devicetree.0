From: Stephen Boyd <sboyd@kernel.org>
Subject: =?utf-8?q?Re=3A_=5BPATCH_v8_00/42=5D_ARM=3A_davinci=3A_convert_to_common_?=
 =?utf-8?q?clock_framework=E2=80=8B?=
Date: Mon, 19 Mar 2018 17:53:43 -0700
Message-ID: <152150722338.254778.4743967512266809482@swboyd.mtv.corp.google.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521168778-27236-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>
List-Id: devicetree@vger.kernel.org

Quoting David Lechner (2018-03-15 19:52:16)
> This series converts mach-davinci to use the common clock framework.
> 
> The series works like this, the first 19 patches create new clock drivers
> using the common clock framework. There are basically 3 groups of clocks -
> PLL, PSC and CFGCHIP (syscon). There are six different SoCs that each have
> unique init data, which is the reason for so many patches.

Should I apply the first 19 patches to clk tree? Looking over them
nothing stands out except for your self comment about the bad
reviewed-by tag which I can remove.

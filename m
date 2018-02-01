From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 02/41] clk: davinci: New driver for davinci PLL clocks
Date: Thu, 1 Feb 2018 17:52:57 +0530
Message-ID: <2a833d5c-4cd7-5c55-4b4a-a02bd7fde6d9@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-3-git-send-email-david@lechnology.com>
 <ff3a0549-2f76-9a8d-21bc-164649e8a6be@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ff3a0549-2f76-9a8d-21bc-164649e8a6be@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 01 February 2018 01:31 PM, Sekhar Nori wrote:
> One thing missing is DIV4.5 clock. It will be nice to add that too,
> mostly just because it will make the binding complete.

Ah, ignore this comment please. I noticed that its part of cfgchip
clocks (which makes sense).

Thanks,
Sekhar

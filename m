From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v9 06/27] ARM: davinci: da850: add new clock init using
 common clock framework
Date: Tue, 1 May 2018 19:47:01 +0530
Message-ID: <525160f1-056b-69d1-2ce2-e5bdff8bffcc@ti.com>
References: <20180427001745.4116-1-david@lechnology.com>
 <20180427001745.4116-7-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180427001745.4116-7-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 27 April 2018 05:47 AM, David Lechner wrote:
> This adds the new board-specific clock init in mach-davinci/da850.c
> using the new common clock framework drivers.
> 
> The #ifdefs are needed to prevent compile errors until the entire
> ARCH_DAVINCI is converted.
> 
> Also clean up the #includes since we are adding some here.
> 
> Some CFGCHIP macros were removed because we are now including
> linux/mfd/da8xx-cfgchip.h which defines the same values.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar

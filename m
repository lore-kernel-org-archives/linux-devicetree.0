From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v7 10/42] clk: davinci: New driver for davinci PSC clocks
Date: Fri, 16 Mar 2018 10:55:29 -0700
Message-ID: <152122292977.70929.17084619305591596735@swboyd.mtv.corp.google.com>
References: <1519071723-31790-1-git-send-email-david@lechnology.com>
 <1519071723-31790-11-git-send-email-david@lechnology.com>
 <CAMpxmJVxfGtO=kh63KF-5Uqew3yy97DsK4FSd14CyyRQTOhrTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJVxfGtO=kh63KF-5Uqew3yy97DsK4FSd14CyyRQTOhrTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, David Lechner <david@lechnology.com>
Cc: linux-clk@vger.kernel.org, linux-devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Bartosz Golaszewski (2018-02-28 04:38:38)
> 2018-02-19 21:21 GMT+01:00 David Lechner <david@lechnology.com>:
> 
> I believe there to be two issues: one is with v7 - we need to increase
> the clock reference count in davinci_psc_genpd_attach_dev().
> 
> Second is the error path in the clock framework - we should remove the
> destroyed clk_core from the debug list, which is not being done now.
> 
> Why we even need to track the refcount of clk_core is a mistery for me
> though. Stephen, Mike?
> 

Which part of the code are we talking about? I see that
__clk_core_init() calls clk_debug_register() when ret == 0 and that
looks fine. I do wonder why clk_debug_register() even returns a value
though because we ignore it.

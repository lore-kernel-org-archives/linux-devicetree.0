From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Add RMII RCLK gates for both AST2500 MACs
Date: Thu, 10 Oct 2019 23:41:35 +0000
Message-ID: <CACPK8Xcrc_2itUcGw6caa8Fp3sJE8oHBO5LJgBtqScwmVAuHJw@mail.gmail.com>
References: <20191010020655.3776-1-andrew@aj.id.au> <20191010020655.3776-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010020655.3776-3-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 10 Oct 2019 at 02:06, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> RCLK is a fixed 50MHz clock derived from HPLL that is described by a
> single gate for each MAC.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

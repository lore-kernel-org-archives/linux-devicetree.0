From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] dt-bindings: clock: sunxi-ccu: Add compatibles for sun5i
 CCU driver
Date: Wed, 9 Aug 2017 16:55:57 +0800
Message-ID: <CAGb2v65Rbr11b-ojmgFD_fkDSXkr227HGDMS7oDsZ3Zx2juaJg@mail.gmail.com>
References: <20170808012540.16691-1-net147@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170808012540.16691-1-net147@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jonathan Liu <net147@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 8, 2017 at 9:25 AM, Jonathan Liu <net147@gmail.com> wrote:
> The bindings were not updated when the sun5i CCU driver was added in
> commit 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver").
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Looks good to me. Will wait for the device tree binding maintainers
to have a say before I apply it for 4.14.

ChenYu

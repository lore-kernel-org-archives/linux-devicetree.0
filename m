From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 03/20] clk: sunxi: tcon-ch1: Do not return a negative
 error in get_parent
Date: Tue, 17 May 2016 00:05:18 +0800
Message-ID: <CAGb2v64GxTFnnx40Jy9Cz9e+c+T2j2QcbFznZ4-Lm-tdHFgcXg@mail.gmail.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-4-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1463402840-17062-4-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 16, 2016 at 8:47 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> get_parent is supposed to return an unsigned 8 bit integer, so returning
> -EINVAL is a bad idea.
>
> Remove it.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

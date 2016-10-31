From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: cdce925: add support for CDCE913, CDCE937, and
 CDCE949
Date: Mon, 31 Oct 2016 01:34:28 -0500
Message-ID: <20161031063428.w3xov2xqyyppgsy6@rob-hp-laptop>
References: <1477848637-5151-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477848637-5151-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>, Michael Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 31, 2016 at 02:30:37AM +0900, Akinobu Mita wrote:
> The CDCE925 is a member of the CDCE(L)9xx programmable clock generator
> family.  There are also CDCE913, CDCE937, CDCE949 which have different
> number of PLLs and outputs.
> 
> The clk-cdce925 driver supports only CDCE925 in the family.  This adds
> support for the CDCE913, CDCE937, CDCE949, too.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Mike Looijmans <mike.looijmans@topic.nl>
> Cc: Michael Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/ti,cdce925.txt       |  15 ++-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/Kconfig                                |  11 ++-
>  drivers/clk/clk-cdce925.c                          | 106 ++++++++++++++++-----
>  3 files changed, 99 insertions(+), 33 deletions(-)

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] reset: uniphier: remove sLD3 SoC support
Date: Thu, 10 Aug 2017 15:30:59 -0500
Message-ID: <20170810203059.abbmh4zhrk36shxb@rob-hp-laptop>
References: <1501987442-2583-1-git-send-email-yamada.masahiro@socionext.com>
 <1501987442-2583-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501987442-2583-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Aug 06, 2017 at 11:44:01AM +0900, Masahiro Yamada wrote:
> This SoC is too old.  It is difficult to maintain any longer.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/reset/uniphier-reset.txt   |  2 -
>  drivers/reset/reset-uniphier.c                     | 48 ++++++++--------------
>  2 files changed, 16 insertions(+), 34 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

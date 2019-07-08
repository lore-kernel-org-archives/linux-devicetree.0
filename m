From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of/platform: Drop superfluous cast in
 of_device_make_bus_id()
Date: Mon, 8 Jul 2019 14:07:12 -0600
Message-ID: <20190708200712.GA29483@bogus>
References: <20190624124620.21891-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190624124620.21891-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Mon, 24 Jun 2019 14:46:20 +0200, Geert Uytterhoeven wrote:
> There is no need to cast "u64" to "unsigned long long" before printing
> it, as both types have been made identical on all architectures many
> years ago.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/of/platform.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied, thanks.

Rob

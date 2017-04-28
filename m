From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] iio: adc: Drop if clock from Renesas GyroADC bindings
Date: Fri, 28 Apr 2017 08:42:45 -0500
Message-ID: <20170428134245.okn4in5d6uh3i4oh@rob-hp-laptop>
References: <20170420154216.32709-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170420154216.32709-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 20, 2017 at 05:42:16PM +0200, Marek Vasut wrote:
> The "if" interface clock speed is actually derived from the "fck"
> block clock, as in the hardware they are the same clock. Drop the
> incorrect second "if" clock and retain only the "fck" clock.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh@kernel.org> 

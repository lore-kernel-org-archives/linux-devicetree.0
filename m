From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: sx150x: Add support for sx1502
Date: Fri, 18 Dec 2015 22:19:38 -0600
Message-ID: <20151219041938.GT14936@rob-hp-laptop>
References: <1450216894-19390-1-git-send-email-peda@lysator.liu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450216894-19390-1-git-send-email-peda@lysator.liu.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@lysator.liu.se>
Cc: linux-gpio@vger.kernel.org, Peter Rosin <peda@axentia.se>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 11:01:34PM +0100, Peter Rosin wrote:
> From: Peter Rosin <peda@axentia.se>
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  .../devicetree/bindings/gpio/gpio-sx150x.txt       |  3 +-

For the binding:

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpio/gpio-sx150x.c                         | 53 ++++++++++++++++++++--
>  2 files changed, 51 insertions(+), 5 deletions(-)

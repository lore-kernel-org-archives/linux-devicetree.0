From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] gpio: davinci: Add keystone-k2g compatible
Date: Thu, 3 Aug 2017 11:17:48 -0500
Message-ID: <20170803161748.u7ier3kt3xmm25jw@rob-hp-laptop>
References: <1501051524-5990-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501051524-5990-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: ssantosh@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, t-kristo@ti.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, fcooper@ti.com, s-anna@ti.com, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 12:15:23PM +0530, Keerthy wrote:
> The patch adds keystone-k2g compatible, specific properties and
> an example.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
> 
> Changes in v3:
> 
>   * Added details about family of SoCs corresponding to compatibles.
> 
>  .../devicetree/bindings/gpio/gpio-davinci.txt      | 40 +++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

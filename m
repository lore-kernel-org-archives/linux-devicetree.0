From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/7] watchdog: sunxi: allow setting timeout in
 devicetree
Date: Sun, 18 Feb 2018 18:06:19 -0600
Message-ID: <20180219000619.4pjftflhcew5zav6@rob-hp-laptop>
References: <20180211200847.25000-1-marcus.folkesson@gmail.com>
 <20180211200847.25000-2-marcus.folkesson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180211200847.25000-2-marcus.folkesson@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sylvain Lemieux <slemieux.tyco@gmail.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 11, 2018 at 09:08:42PM +0100, Marcus Folkesson wrote:
> watchdog_init_timeout() will allways pick timeout_param since it
> defaults to a valid timeout.
> 
> By following best practice described in
> Documentation/watchdog/watchdog-kernel-api.txt, it also
> let us to set timout-sec property in devicetree.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 4 ++++
>  drivers/watchdog/sunxi_wdt.c                             | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

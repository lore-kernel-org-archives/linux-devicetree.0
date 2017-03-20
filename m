From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] irqchip: augment Gemini bindings to reflect Faraday
 origin
Date: Mon, 20 Mar 2017 11:42:39 -0500
Message-ID: <20170320164238.2whmughx6nhlpt5b@rob-hp-laptop>
References: <20170311231350.15857-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170311231350.15857-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: openwrt-devel@openwrt.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Thomas Gleixner <tglx@linutronix.de>, Janos Laube <janos.dev@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 12, 2017 at 12:13:50AM +0100, Linus Walleij wrote:
> When we merged the Gemini interrupt controller it was not yet
> discovered that this IP block is actually a standard Faraday
> Technology interrupt controller.
> 
> As the IP block will probably appear in other designs as well,
> let's augment the DT bindings to reflect that it is first and
> foremost a standard Faraday part with a function name (FTINTC010)
> so that people reusing the IP easily find the driver they need.
> 
> Sorry for the mistakes due to lack of information.
> 
> Greentime Hu <green.hu@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  ...,gemini-interrupt-controller.txt => faraday,ftintc010.txt} | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/interrupt-controller/{cortina,gemini-interrupt-controller.txt => faraday,ftintc010.txt} (63%)

Acked-by: Rob Herring <robh@kernel.org>

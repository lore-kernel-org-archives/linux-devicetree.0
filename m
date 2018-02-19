From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 2/7] watchdog: sunxi: allow setting timeout in
 devicetree
Date: Mon, 19 Feb 2018 11:01:19 +0800
Message-ID: <CAGb2v67ei8atFKyiFXA=EZ_wPbjBt+-2e-aSRqSzS9zaxHaTKg@mail.gmail.com>
References: <20180211200847.25000-1-marcus.folkesson@gmail.com>
 <20180211200847.25000-2-marcus.folkesson@gmail.com>
 <20180219000619.4pjftflhcew5zav6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219000619.4pjftflhcew5zav6@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-watchdog@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, Barry Song <baohua@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 19, 2018 at 8:06 AM, Rob Herring <robh@kernel.org> wrote:
> On Sun, Feb 11, 2018 at 09:08:42PM +0100, Marcus Folkesson wrote:
>> watchdog_init_timeout() will allways pick timeout_param since it
>> defaults to a valid timeout.
>>
>> By following best practice described in
>> Documentation/watchdog/watchdog-kernel-api.txt, it also
>> let us to set timout-sec property in devicetree.
>>
>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 4 ++++
>>  drivers/watchdog/sunxi_wdt.c                             | 2 +-
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

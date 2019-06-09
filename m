From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC next v1 2/5] gpio: of: parse stmmac PHY reset line specific
 active-low property
Date: Sun, 9 Jun 2019 22:38:28 +0200
Message-ID: <20190609203828.GA8247@lunn.ch>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, alexandre.torgue@st.com, linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, joabreu@synopsys.com, khilman@baylibre.com, peppe.cavallaro@st.com, linux-amlogic@lists.infradead.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 09, 2019 at 08:06:18PM +0200, Martin Blumenstingl wrote:
> The stmmac driver currently ignores the GPIO flags which are passed via
> devicetree because it operates with legacy GPIO numbers instead of GPIO
> descriptors.

Hi Martin

I don't think this is the reason. I think historically stmmac messed
up and ignored the flags. There are a number of device tree blobs
which have the incorrect flag value, but since it was always ignored,
it did not matter. Then came along a board which really did need the
flag, but it was too late, it could not be enabled because too many
boards would break. So the hack was made, and snps,reset-active-low
was added.

Since snps,reset-active-low is a hack, it should not be in the
core. Please don't add it to gpiolib-of.c, keep it within stmmac
driver.

	Andrew

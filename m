From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 2/5] dt-bindings: Add pinctrl bindings for
 mt65xx/mt81xx.
Date: Wed, 28 Jan 2015 08:48:38 +0100
Message-ID: <20150128074838.GX12209@pengutronix.de>
References: <1421818097-9281-1-git-send-email-hongzhou.yang@mediatek.com>
 <1421818097-9281-3-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1421818097-9281-3-git-send-email-hongzhou.yang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, maoguang.meng@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, alan.cheng@mediatek.com, Russell King <linux@arm.linux.org.uk>, toby.liu@mediatek.com, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrsoft.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, dandan.he@mediatek.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 21, 2015 at 01:28:14PM +0800, Hongzhou Yang wrote:
> From: Hongzhou Yang <hongzhou.yang@mediatek.com>
> 
> Add devicetree bindings for Mediatek SoC pinctrl driver.
> 
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

This basically follows the pinmux binding I suggested as generic pinmux
binding for per-pin type controllers, so:

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

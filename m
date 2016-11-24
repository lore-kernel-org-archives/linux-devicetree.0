From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: New driver for TI DA8XX/OMAP-L138/AM18XX
 pinconf
Date: Thu, 24 Nov 2016 15:05:43 +0100
Message-ID: <CACRpkdYzJFdbEPON_TGDpzhNmA=e5O4XkhfYiWhgYj4p94=nHQ@mail.gmail.com>
References: <1479871767-20160-1-git-send-email-david@lechnology.com>
 <1479871767-20160-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1479871767-20160-3-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Axel Haslam <ahaslam@baylibre.com>, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Bailon <abailon@baylibre.com>, =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bgolaszewski@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 23, 2016 at 4:29 AM, David Lechner <david@lechnology.com> wrote:

> This adds a new driver for pinconf on TI DA8XX/OMAP-L138/AM18XX. These
> SoCs have a separate controller for controlling pullup/pulldown groups.
>
> Signed-off-by: David Lechner <david@lechnology.com>

Nice and clean driver, resend with the minor fixes pointed out
by Sekhar and I'll merge it.

Yours,
Linus Walleij

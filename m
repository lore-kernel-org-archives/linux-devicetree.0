From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: fix for Allwinner H5 pinctrl's
 compatible
Date: Tue, 14 Mar 2017 14:11:00 +0100
Message-ID: <CACRpkdZMwNoD2CGe2Hy6OXoDcjiQah_JOndVyFDUbBpFim=1aQ@mail.gmail.com>
References: <20170301180111.12365-1-icenowy@aosc.xyz>
 <20170301180111.12365-4-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170301180111.12365-4-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 1, 2017 at 7:01 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:

> The compatible for Allwinner H5 pin controller is wrong written as
> allwinner,sun50i-h5-r-pinctrl, however, it's really a generic pinctrl
> rather than a "r" one.
>
> Fix this compatible string.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij

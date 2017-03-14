From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] pinctrl: sunxi: refactor pinctrl choice selecting
 for ARM64
Date: Tue, 14 Mar 2017 14:09:16 +0100
Message-ID: <CACRpkdZzTFAn-Mkm+SUwoatbV3RzyqoSVMB0dqkNhuDsYY56AA@mail.gmail.com>
References: <20170301180111.12365-1-icenowy@aosc.xyz>
 <20170301180111.12365-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170301180111.12365-2-icenowy@aosc.xyz>
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

> ARM64 Allwinner SoCs used to have every pinctrl driver selected in
> ARCH_SUNXI. Change this to make their default value to (ARM64 &&
> ARCH_SUNXI).
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij

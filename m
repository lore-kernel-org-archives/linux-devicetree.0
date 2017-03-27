From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/7] pinctrl: dt-bindings: Add documentation for Armada
 37xx pin controllers
Date: Mon, 27 Mar 2017 11:18:48 +0200
Message-ID: <CACRpkdaP9Q=3ZeARTYizCKKtH6NdCrCnapxS7p=EdV1gvCZe8w@mail.gmail.com>
References: <cover.26288667a039bc9f8e62dec2fd6342ded4014d12.1490120798.git-series.gregory.clement@free-electrons.com>
 <2dc869315a1b6bcc6d7eedd67b9ea8c0483b9789.1490120798.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2dc869315a1b6bcc6d7eedd67b9ea8c0483b9789.1490120798.git-series.gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Victor Gu <xigu@marvell.com>, Hua Jing <jinghua@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 7:28 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> Document the device tree binding for the pin controllers found on the
> Armada 37xx SoCs.
>
> Update the binding documention of the xtal clk which is a subnode of this
> syscon node.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

These look all right to me, but let's see what the DT people say.

This business with a subnode named "gpio-controller" that the code is
checking for is not in the bindings or examples, is this part of the old
Armada bindings?

Yours,
Linus Walleij

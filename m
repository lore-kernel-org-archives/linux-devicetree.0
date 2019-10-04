From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] arm: dts: integratorap: Remove top level dma-ranges
Date: Fri, 4 Oct 2019 23:12:43 +0200
Message-ID: <CACRpkdaY8G6LT-FSr7BQrGyskBTXqMmhooKBpHDVMBuv7uAQeQ@mail.gmail.com>
References: <20190920153622.14616-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920153622.14616-1-robh@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2019 at 5:36 PM Rob Herring <robh@kernel.org> wrote:

> 'dma-ranges' at the top level doesn't make sense. 'dma-ranges' implies
> there is a parent bus node with '#address-cells' and '#size-cells' which
> is impossible here.
>
> Likely this translation needs to be moved down to sub-nodes that need
> it.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied! I'll get this to ARM SoC with some
other stuff.

Yours,
Linus Walleij

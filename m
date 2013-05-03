From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 26/63] dmaengine: ste_dma40: Supply full Device Tree
 parsing support
Date: Fri, 3 May 2013 22:59:52 +0200
Message-ID: <CACRpkdaj0RcZUJ9DX8D1v-MKecFs6ZwGjqD2gqaSFvP9QCbgGA@mail.gmail.com>
References: <1367591569-32197-1-git-send-email-lee.jones@linaro.org>
	<1367591569-32197-27-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1367591569-32197-27-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus WALLEIJ <linus.walleij@stericsson.com>, Srinidhi KASAGAR <srinidhi.kasagar@stericsson.com>, Vinod Koul <vinod.koul@intel.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Per Forlin <per.forlin@stericsson.com>, Dan Williams <djbw@fb.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 3, 2013 at 4:32 PM, Lee Jones <lee.jones@linaro.org> wrote:

> Using the new DMA DT bindings and API, we can register the DMA40 driver
> as Device Tree capable. Now, when a client attempts to allocate a
> channel using the DMA DT bindings via its own node, we are able to parse
> the request and allocate a channel in the correct manner.
>
> Cc: Vinod Koul <vinod.koul@intel.com>
> Cc: Dan Williams <djbw@fb.com>
> Cc: Per Forlin <per.forlin@stericsson.com>
> Cc: Rabin Vincent <rabin@rab.in>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: devicetree-discuss@lists.ozlabs.org
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to my ux500-dma40 branch.

Thanks!
Linus Walleij

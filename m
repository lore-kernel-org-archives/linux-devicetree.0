From: Christoph Hellwig <hch@lst.de>
Subject: Re: [BUG BISECT] Ethernet fail on VF50 (OF: Don't set default
        coherent DMA mask)
Date: Mon, 30 Jul 2018 11:23:06 +0200
Message-ID: <20180730092306.GA18701@lst.de>
References: <CAJKOXPeaguNxRr7pCArJ5Db4tS6Kr5BDheCxskY+vd0dUN+0GQ@mail.gmail.com> <CAJKOXPfageiBVXddtdJRBS+092O3QfD0yoS_Mk+PoX7+qNYNUA@mail.gmail.com> <20180727140448.GA29001@lst.de> <20180728165820.GA5731@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180728165820.GA5731@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@lst.de>, Krzysztof Kozlowski <krzk@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Fugang Duan <fugang.duan@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 28, 2018 at 09:58:20AM -0700, Guenter Roeck wrote:
> I would call it a serious regression. Also, no longer setting a default
> coherent DMA mask is a quite substantial behavioral change, especially
> if and since the code worked just fine up to now.
> 
> Crash when booting sam460ex attached below, as is a bisect log.

Things should be ok again with:

commit a5516219b10218a87abb3352c82248ce3088e94a
Author: Robin Murphy <robin.murphy@arm.com>
Date:   Fri Jul 27 15:14:15 2018 +0100

    of/platform: Initialise default DMA masks

from the lastest dma-mapping tree as of Friday.  It isn't in the
latest linux-next tree yet but be in the next one.

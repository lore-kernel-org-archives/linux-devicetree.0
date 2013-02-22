From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dma: Remove erroneous __exit and __exit_p() references
Date: Fri, 22 Feb 2013 19:29:26 +0100
Message-ID: <CACRpkdZamOCWHWMcFYRqQDKJARZOCEP_eSNPNaxSgHfAn2wmEw@mail.gmail.com>
References: <1361318824-22287-1-git-send-email-maxin.john@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1361318824-22287-1-git-send-email-maxin.john@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxin.john@gmail.com
Cc: gregkh@linuxfoundation.org, djbw@fb.com, nicolas.ferre@atmel.com, vinod.koul@intel.com, rmk+kernel@arm.linux.org.uk, jassisinghbrar@gmail.com, lars@metafoo.de, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, "Maxin B. John" <maxin.john@enea.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2013 at 1:07 AM,  <maxin.john@gmail.com> wrote:

> From: "Maxin B. John" <maxin.john@enea.com>
>
> Removing the annotation with __exit and referencing with __exit_p()
> present in dma driver module remove hooks.
>
> Part of the __devexit and __devexit_p() purge.
>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

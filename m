From: "Maxin B. John" <maxin.john@gmail.com>
Subject: Re: [PATCH] dma: Remove erroneous __exit and __exit_p() references
Date: Thu, 7 Mar 2013 10:17:40 +0100
Message-ID: <CAMhs6YwC+Lx0Vt=w2MoQV08on+rB1zidGCsNHRqcst8KBrb2XQ@mail.gmail.com>
References: <1361318824-22287-1-git-send-email-maxin.john@gmail.com>
	<CACRpkdZamOCWHWMcFYRqQDKJARZOCEP_eSNPNaxSgHfAn2wmEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZamOCWHWMcFYRqQDKJARZOCEP_eSNPNaxSgHfAn2wmEw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com
Cc: gregkh@linuxfoundation.org, djbw@fb.com, nicolas.ferre@atmel.com, linus.walleij@linaro.org, rmk+kernel@arm.linux.org.uk, jassisinghbrar@gmail.com, lars@metafoo.de, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, "Maxin B. John" <maxin.john@enea.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Feb 22, 2013 at 7:29 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Feb 20, 2013 at 1:07 AM,  <maxin.john@gmail.com> wrote:
>
>> From: "Maxin B. John" <maxin.john@enea.com>
>>
>> Removing the annotation with __exit and referencing with __exit_p()
>> present in dma driver module remove hooks.
>>
>> Part of the __devexit and __devexit_p() purge.
>>
>> Signed-off-by: Maxin B. John <maxin.john@enea.com>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Gentle ping...

> Yours,
> Linus Walleij

Regards,
Maxin

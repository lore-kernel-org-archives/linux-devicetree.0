From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 11/16] pinctrl: samsung: Use one GPIO chip per pin bank
Date: Wed, 10 Oct 2012 10:49:09 +0200
Message-ID: <10399745.GY5ZiH5kRN@amdc1227>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
 <1349685556-23718-12-git-send-email-t.figa@samsung.com>
 <CACRpkdY3rk41xDQbG9Ft8iVYZnyk3vu3Fs9Ehin2Q1oSZ3JO-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <CACRpkdY3rk41xDQbG9Ft8iVYZnyk3vu3Fs9Ehin2Q1oSZ3JO-Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com
List-Id: devicetree@vger.kernel.org

On Wednesday 10 of October 2012 09:43:25 Linus Walleij wrote:
> On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > This patch modifies the pinctrl-samsung driver to register one GPIO
> > chip
> > per pin bank, instead of a single chip for all pin banks of the
> > controller.
> > 
> > It simplifies GPIO accesses a lot (constant time instead of looping
> > through the list of banks to find the right one) and should have a good
> > effect on performance of any bit-banging driver.
> > 
> > In addition it allows to reference GPIO pins by a phandle to the bank
> > node and a local pin offset inside of the bank (similar to previous
> > gpiolib driver), which is more clear and readable than using indices
> > relative to the whole pin controller.
> > 
> > Example:
> >         device {
> >         
> >                 /* ... */
> >                 gpios = <&gpk0 4 0>;
> >                 /* ... */
> >         
> >         };
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> 
> This also looks good (and I think it has been discussed before)
> so needs to be applied in isolation from the regs-to-DT stuff.

Please see my reply for patch 9.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center

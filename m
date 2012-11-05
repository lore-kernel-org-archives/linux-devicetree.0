From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Mon, 5 Nov 2012 16:31:23 +0900
Message-ID: <7471321.6NJDeDGfYW@percival>
References: <38620644.IyR5R8rjKP@percival> <CACRpkdZc3cEGfSKW-b=G31yuw_E-GOXid3jkxZ0tuKYGYRE5Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZc3cEGfSKW-b=G31yuw_E-GOXid3jkxZ0tuKYGYRE5Nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus, thanks for the reply!

On Monday 05 November 2012 02:04:33 Linus Walleij wrote:
> On Wed, Oct 31, 2012 at 10:04 AM, Alex Courbot <acourbot@nvidia.com> wrote:
> > Would anyone be opposed to having a gpio_get() function that works
> > similarly to e.g. regulator_get() and clk_get()?
> 
> I understand the concept and why you want to do this.
> 
> However I think the global GPIO numberspace defeats the
> purpose.
> 
> gpio_get() should get an abstract handle just like clk_get() or
> regulator_get(), not a fixed numeral.
> 
> That is the only way to really transit away from the global GPIO
> numberspace.

Interesting. I see you already gave the whole thing a thought. What I don't 
understand however is what is so wrong with the current GPIO numberspace that 
you want to replace it? Whether we use simple integers or blind pointers, the 
adressable space will basically remain the same. GPIO numbers can actually be 
considered as handles, and actually I would not mind typedef'ing "int" to a 
GPIO handle type in order to add more opacity to the framework.

Also the current DT bindings will likely continue to require the legacy API 
anyway, so I am not sure we can make it go away.

My initial thought was to build something on top of the existing scheme to 
address my immediate needs - what you are talking about is much more scary. :) 
Could you elaborate on your motivations for such a radical direction? 

Thanks,
Alex.

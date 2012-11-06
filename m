From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Tue, 6 Nov 2012 10:33:35 +0900
Message-ID: <1801189.6J3flQFRCq@percival>
References: <38620644.IyR5R8rjKP@percival> <CACRpkdZc3cEGfSKW-b=G31yuw_E-GOXid3jkxZ0tuKYGYRE5Nw@mail.gmail.com> <5097F8CF.5090100@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5097F8CF.5090100@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 06 November 2012 01:35:11 Stephen Warren wrote:
> On 11/04/2012 11:04 AM, Linus Walleij wrote:
> > On Wed, Oct 31, 2012 at 10:04 AM, Alex Courbot <acourbot@nvidia.com> 
wrote:
> >> Would anyone be opposed to having a gpio_get() function that works
> >> similarly to e.g. regulator_get() and clk_get()?
> > 
> > I understand the concept and why you want to do this.
> > 
> > However I think the global GPIO numberspace defeats the
> > purpose.
> > 
> > gpio_get() should get an abstract handle just like clk_get() or
> > regulator_get(), not a fixed numeral.
> 
> I don't really see why the return type of gpio_get() influences whether
> it can be implemented or not.
> 
> If gpio_get() were implemented today, it could return an integer with
> the same value as any other GPIO functions use already.
> 
> With board files, some "gpio map" table would simply contain the same
> int GPIO ID value the table as is used anywhere else already. With DT,
> the same xlate function would translate from DT GPIO-chip-relative
> IDs/specifiers into the global number space in the same way that we do
> today via other APIs.
> 
> If the GPIO subsystem were reworked as you propose, this API could be
> reworked in exactly the same way, or if implemented after the rework, it
> would return whatever handle type was in use at the time.

How about, in a first time (and because I'd also like to get the power seqs 
moving on), a typedef from int to gpio_handle_t and a first implementation of 
the gpio_handle_*() API that would just call the existing integer-based API 
(apart from gpio_handle_get())? That way things will not break when we switch 
to a real handle.

Alex.

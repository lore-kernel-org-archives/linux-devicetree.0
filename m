From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Mon, 05 Nov 2012 10:35:11 -0700
Message-ID: <5097F8CF.5090100@wwwdotorg.org>
References: <38620644.IyR5R8rjKP@percival> <CACRpkdZc3cEGfSKW-b=G31yuw_E-GOXid3jkxZ0tuKYGYRE5Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZc3cEGfSKW-b=G31yuw_E-GOXid3jkxZ0tuKYGYRE5Nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alex Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/04/2012 11:04 AM, Linus Walleij wrote:
> On Wed, Oct 31, 2012 at 10:04 AM, Alex Courbot <acourbot@nvidia.com> wrote:
> 
>> Would anyone be opposed to having a gpio_get() function that works similarly
>> to e.g. regulator_get() and clk_get()?
> 
> I understand the concept and why you want to do this.
> 
> However I think the global GPIO numberspace defeats the
> purpose.
> 
> gpio_get() should get an abstract handle just like clk_get() or
> regulator_get(), not a fixed numeral.

I don't really see why the return type of gpio_get() influences whether
it can be implemented or not.

If gpio_get() were implemented today, it could return an integer with
the same value as any other GPIO functions use already.

With board files, some "gpio map" table would simply contain the same
int GPIO ID value the table as is used anywhere else already. With DT,
the same xlate function would translate from DT GPIO-chip-relative
IDs/specifiers into the global number space in the same way that we do
today via other APIs.

If the GPIO subsystem were reworked as you propose, this API could be
reworked in exactly the same way, or if implemented after the rework, it
would return whatever handle type was in use at the time.

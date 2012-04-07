From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] of: add clock providers
Date: Sat, 07 Apr 2012 14:04:37 -0500
Message-ID: <4F808FC5.6090601@gmail.com>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-3-git-send-email-robherring2@gmail.com>
 <20120407041841.054AE3E2F59@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120407041841.054AE3E2F59@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/06/2012 11:18 PM, Grant Likely wrote:
> On Tue, 13 Mar 2012 18:22:22 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>
>> Based on work by Ben Herrenschmidt and Jeremy Kerr, this patch adds an
>> of_clk_get function to allow platforms to retrieve clock data from the
>> device tree.
>>
>> Platform register a provider through of_clk_add_provider, which will be
>> called when a device references the provider's OF node for a clock
>> reference.
>>
>> v3: - Clarified documentation
>>
>> v2: - fixed errant ';' causing compile error
>>     - Editorial fixes from Shawn Guo
>>     - merged in adding lookup to clkdev
>>     - changed property names to match established convention. After
>>       working with the binding a bit it really made more sense to follow the
>>       lead of 'reg', 'gpios' and 'interrupts' by making the input simply
>>       'clocks' & 'clock-names' instead of 'clock-input-*', and to only use
>>       clock-output* for the producer nodes. (Sorry Shawn, this will mean
>>       you need to change some code, but it should be trivial)
>>     - Add ability to inherit clocks from parent nodes by using an empty
>>       'clock-ranges' property.  Useful for busses.  I could use some feedback
>>       on the new property name, 'clock-ranges' doesn't feel right to me.
>>
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Reviewed-by: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
> 
> Hi Rob,
> 
> Thanks for respinning this patch.  Since you're actually using it, do
> you want to take over getting it into mainline?
> 

Yes. Is what you have on your public tree the latest?

>> ---
>>  .../devicetree/bindings/clock/clock-bindings.txt   |  116 ++++++++++++++
>>  .../devicetree/bindings/clock/fixed-clock.txt      |   21 +++
>>  drivers/clk/clkdev.c                               |    9 +
>>  drivers/of/Kconfig                                 |    6 +
>>  drivers/of/Makefile                                |    1 +
>>  drivers/of/clock.c                                 |  165 ++++++++++++++++++++
> 
> I would actually like to see this file moved into drivers/clk.  I
> don't think there is any need anymore to collect OF support code into
> drivers/of.  I plan to move the spi and gpio support code into
> drivers/spi and drivers/gpio respectively.
> 

You keep saying that and if you recall, the i2c maintainers objected to
doing that. I'd imagine you'll find the spi and gpio maintainer more
agreeable. ;)

I'll have to think about how to split it as much of it is really clkdev
code.

Rob

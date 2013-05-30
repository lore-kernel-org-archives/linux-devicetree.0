From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH 3/3] IRQ: irq domain: defer of irq ressoure resolve
 at platform_drv_probe
Date: Thu, 30 May 2013 08:53:57 +0100
Message-ID: <CACxGe6uWYnqm5RYDDBhGQv7h8eDuA6skaR4Je18CSP4KfGzw=w@mail.gmail.com>
References: <20130528145219.GA30411@game.jcrosoft.org>
 <1369753729-12997-3-git-send-email-plagnioj@jcrosoft.com>
 <20130529224814.3F8F53E16F4@localhost> <201305300952.06036.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201305300952.06036.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2013 at 8:52 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 30 May 2013, Grant Likely wrote:
>> On Tue, 28 May 2013 17:08:49 +0200, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
>> >
>> >  /**
>> > + * of_device_alloc_irq - initialize irq of an platfrom_device
>> > + * @dev: plaform_device to work on
>> > + */
>> > +int of_device_init_irq(struct platform_device *dev)
>> > +{
>> > +   struct device_node *np = dev->dev.of_node;
>> > +   int num_irq;
>> > +   int ret;
>> > +   struct resource *res = dev->resource;
>> > +
>> > +   if (!np)
>> > +           return 0;
>> > +
>> > +   num_irq = of_irq_count(np);
>> > +   if (!num_irq)
>> > +           return 0;
>> > +
>> > +   res += dev->num_resources - num_irq;
>>
>> This is a little fragile. Instead of statically calculating the offset,
>> scan the table and make *absolutely* sure that there is a free block of
>> irq resources.
>>
>> Also, if the table has already been populated successfully, then that
>> should be checked for. That would prevent the same table from being
>> parsed over and over in the case of a device that keeps getting
>> deferred.
>>
>> Finally, if it fails, make sure any entries that have been filled in get
>> cleared out again before exiting.
>
> Can we actually ever get a case where mapping a subset of the interrupts
> fail but works at a later point? If not, we could just return a fatal
> error here and won't get called again.
>
> Since a platform device only has one "interrupt-parent", as soon as
> one of the interrupts can get mapped, I would expect that the controller
> is present, and we don't need to defer the probing any more.

If it goes through an interrupt map node then it may only be able to
resolve a subset.

g.

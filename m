From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pin control mappings for DT
Date: Thu, 1 Dec 2011 14:22:02 -0800
Message-ID: <20111201222202.GG13928@atomide.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
 <20111129195937.GO13928@atomide.com>
 <CACRpkdYY0Am52m2Lss+_wxnxXA9nHiGJ2TTdXymAPk=g4Zg+Jw@mail.gmail.com>
 <20111130165415.GR13928@atomide.com>
 <CACRpkdayqNgmOQAG+Kr_xPX8aeKghmeoDdaR4mK0N3U1CcYt-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdayqNgmOQAG+Kr_xPX8aeKghmeoDdaR4mK0N3U1CcYt-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111201 04:15]:
> On Wed, Nov 30, 2011 at 5:54 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> > * Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111130 06:39]:
> 
> >> For the global list of maps in pinctrl I sent a patch today which
> >> augments this so board files can add several incremental sets of
> >> maps.
> >>
> >> So it can now grow dynamically but not shrink dynamically (hey,
> >> 50% done!)
> >
> > Great, sounds like that makes multiple pinmux driver instances to work,
> > unloading the pinmux driver of course will still not work..
> 
> Oh that already works, it's just that you have a single static mapping
> table for all the controllers, and it doesn't get free:ed up when
> loading and unloading pinmux drivers, the mappings get enabled
> when you load them and disabled when you unload them, simply.

Yes that's the problem I'm having. If the mapping exists, then we
should not add to it.

But how does the second pinmux driver instance know if it's OK
to add to the mapping or not? The mapping exists, but it might be
also from the previous time you loaded the pinmux driver..

I really think we should free the (non-static) mapping on unregister
so we can use standard Linux development methods for the pinmux drivers.
 
> Of course you have to use a string like "pinctrl.0" or "pinctrl.1"
> (or a symbolic .init_name) to refer to it in the map since your
> struct device * is not static, but the string works just fine.
> 
> So the situation is the same as with say, clkdev and multiple
> clock drivers.
> 
> But: how do we deal with clients still using a pinmux say if a
> device driver has issued pmx = pinmux_get() on it, when you
> remove the device underneath? (We're not doing anything
> about that today.)

Heh, I'd assume it's mostly the people developing pinmux drivers
who need to rmmod and insmod :)

Maybe we should just print warnings in this case, some people
actually prefer to set up the pins once during the init and then
not touch them at all afterwards.
 
> >> If what you propose is to do away with these two fields and instead
> >> store just the rest of the mapping in a per-pinctrl list passed in
> >> from platform data, as is done with regulators, I see what you mean,
> >> that's maybe more elegant. The current solution is on par with
> >> clkdev.
> >
> > Yes right, they should be per-pinctrl as otherwise we can't free the
> > mapping when unloading a pinmux driver. Basically we need a way to do
> > pinmux_free_mappings(struct pinmux_map *map) so it only frees per-pinctrl
> > map.
> 
> It's true you cannot free the mappings but for example the pinmux
> hogs will be free:ed when you unload the driver.
> 
> > Maybe the static map should be copied over to make it per-pinctrl during
> > init based on the ctrl_dev_name?
> 
> Maybe I'm misunderstanding something. This is currently inside
> pinmux.c:
> 
> /* List of pinmux hogs */
> static DEFINE_MUTEX(pinmux_hoglist_mutex);
> static LIST_HEAD(pinmux_hoglist);
> 
> /* Global pinmux maps */
> static struct pinmux_map *pinmux_maps;
> static unsigned pinmux_maps_num;
> 
> When  a pinmux device is loaded, it attempts to match
> pinmux mappings from the pinmux_map onto itself and
> set up any hogs, using pinmux_get() then these are
> added to the pinmux_hoglist in the function
> pinmux_hog_maps(); (Hogs are optional, it is orthogonal
> to use them directly from board code or devices with
> pinmux_get())
> 
> After this, board code or devices can look up
> pinmuxes with pinmux_get() and this will traverse
> the map to find matching pinmux devices.
> 
> When a device is unloaded the hogs are likewise removed
> from the list in pinmux_unhog_maps() with
> pinmux_put() calls.
> 
> That the mapping is for all devices doesn't stop you from
> loading and unloading pinmux drivers as much as you
> want, we already handle that (well there may be bugs in the
> code since it's not deployed on any system adding/removing
> controllers, but the idea sure is there...)  if you're only
> using hogs and no pinmux_get() from elsewhere on it,
> it will even work in practice :-)

Well if there are dynamic maps, we still need to release
the maps also.

How about we pass the static map in platform_data to the pinmux
driver in question, then have the pinmux driver set it up with
pinctrl fwk as per-pinctrl map.

This would remove the need for the global map. This would
also allow making the pinctrl fwk into loadable modules
in some cases.

Regards,

Tony

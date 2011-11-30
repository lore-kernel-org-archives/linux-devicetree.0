From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Pin control mappings for DT
Date: Wed, 30 Nov 2011 16:14:56 +0100
Message-ID: <CACRpkdYY0Am52m2Lss+_wxnxXA9nHiGJ2TTdXymAPk=g4Zg+Jw@mail.gmail.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
 <20111129195937.GO13928@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111129195937.GO13928-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2011 at 8:59 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:

> The current pinctrl mapping is totally messed up in it's current form I'm
> sorry to say in a polite way :)

Hehe :-)

> It currently assumes one set of static map data being passed from the
> board/machine. So you can't mix static data and dynamic data coming
> from DT.

For the global list of maps in pinctrl I sent a patch today which
augments this so board files can add several incremental sets of
maps.

So it can now grow dynamically but not shrink dynamically (hey,
50% done!)

> And it does not allow freeing the mappings if you have a loadable
> pinmux module.. Things get even more messed up when trying to support
> multiple driver instances..
>
> To sort this out the mappings need to be tied to pinctrl/pinmux driver
> instances to start with.

It *is* tied to the pinctrl/pinmux driver instance since each mapping entry
has:

 * @ctrl_dev: the pin control device to be used by this mapping, may be NULL
 *      if you provide .ctrl_dev_name instead (this is more common)
 * @ctrl_dev_name: the name of the device controlling this specific mapping,
 *      the name must be the same as in your struct device*, may be NULL if
 *      you provide .ctrl_dev instead

        struct device *ctrl_dev;
        const char *ctrl_dev_name;

If what you propose is to do away with these two fields and instead
store just the rest of the mapping in a per-pinctrl list passed in
from platform data, as is done with regulators, I see what you mean,
that's maybe more elegant. The current solution is on par with
clkdev.

> That should be done before relying on it further
> and adding more features to it. Anyways, on the positive side, it seems
> that eventually most mappings can be dynamically generated with DT.

Yes, DT will likely make things better.

> Oh, one more thing that needs to be considered is that the mappings are not
> static. Consider popular development boards like beagle. Depending how
> you choose to use the available pins, you need to mux them for an
> extension board, for example. You don't really want to edit the mux mappings
> and recompile the kernel just to support the same board with different
> add on boards. Just changing the DT entries should be enough to map
> the extra pins to an extra I2C controller or LCD or whatever.

Once we have DT support for the mappings this should
come for free I guess?

Linus

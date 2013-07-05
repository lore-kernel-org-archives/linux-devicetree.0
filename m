From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Fri, 5 Jul 2013 10:02:15 +0100
Message-ID: <CACxGe6uO=-ABdg+z+fJ-LmXYWVZ-ToOztoSVhSTzv4AUgUxjcg@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com> <20130702202548.GE13924@flint.arm.linux.org.uk>
 <CACxGe6uTv2yaTH-_JLa=vtgmXwq=++wz3=eDpkRr2GVbKaME1A@mail.gmail.com>
 <20130705085020.GV13924@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130705085020.GV13924-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
To: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 5, 2013 at 9:50 AM, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Fri, Jul 05, 2013 at 09:37:34AM +0100, Grant Likely wrote:
>> Alternatively, you can have the same effect with a property or set of
>> properties in the controller node that contains phandles to the
>> required devices. That would provide the driver with the same
>> information about which devices must be present.
>
> How do you go from phandle to something-that-the-driver-for-that-device-
> has-setup?
>
> From what I can see, you can go from phandle to OF node, but no further.

Correct, and that has historically been by design because it is
possible for multiple struct devices to reference a single
device_node. Any subsystem that needs to get a particular device has a
lookup mechanism that searches the list of known devices and returns a
match.

example: of_mdio_find_bus()

> I'm guessing we'd need some kind of "registry" for sub-drivers with
> these structures to register their devices OF node plus "shared" data
> so that other drivers can find it.  "shared" data might be a
> standardized operations struct or something similar to 'struct
> device_driver' but for componentised devices.

If it is per-subsystem, the effort shouldn't be too high because it
will be able to collect devices of the same type. It gets more
complicated to design a generic componentised device abstraction
(which I'm not opposed to, it's just going to be tricky and subtle).

One big concern I have is differentiating between manditory and
optional dependencies. Manditory is always easy to handle, but what
about cases where the supernode (using phandles to other nodes)
references other devices, but it is perfectly valid for the driver to
complete probing before it becomes available? I may just be borrowing
trouble here though. Supporting only mandatory dependencies in the
first cut would still be a big step forward.

One simple approach would be to add a "depends on" list to struct
device and make the driver core check that all the dependant devices
have drivers before probing. The risk is that would become a
complicated set of reference counting and housekeeping.

g.

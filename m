From: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Tue, 2 Jul 2013 20:19:23 +0100
Message-ID: <20130702191923.GD13924@flint.arm.linux.org.uk>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130702204255.2044c01b@armhf>
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
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 02, 2013 at 08:42:55PM +0200, Jean-Francois Moine wrote:
> It seems that you did not look at the NVIDIA Tegra driver (I got its
> general concept for my own driver, but I used a simple atomic counter):
> 
> - at probe time, the main driver (drivers/gpu/host1x/drm/drm.c) scans
>   the DT and finds its external modules. These ones are put in a
>   "clients" list.
> 
> - when loaded, the other modules register themselves into the main
>   driver. This last one checks if each module is in the "client" list.
>   If so, the module is moved from the "client" to an "active" list".
> 
> - when the "client" list is empty, this means all modules are started,
>   and, so, the main driver starts the drm stuff.
> 
> The active list is kept for module unloading.

Please tell me how this works with the two LCD controllers if you wish
to drive the two LCD controllers as entirely separate devices.  Given
that the above requires the use of global data in the driver, how do
you distinguish between the two?

> Putting "phandle"s in the 'display' seems more flexible (I did not do so
> because I knew the hardware - 2 LCDs and the dcon/ire).

Except you haven't looked at the bigger picture - the Armada 510 is
unusual in that it has two LCD controllers and the DCON.  All of the
other SoCs using this IP block that I've been able to research have
only one LCD controller and no DCON.  I don't think they even have an
IRE (image rotation engine) either.

Neither have you considered the case where you may wish to keep the
two LCD controllers entirely separate (eg, you want X to drive one
but something else on the other.)  X drives the DRM device as a whole,
including all CRTCs which make up that device - with them combined
into one DRM device, you can't ask X to leave one controller alone
because you're doing something else with it.  (This is just the simple
extension of the common case of a single LCD controller, so it's
really nothing special.)

So, the unusual case _is_ the Armada 510 with its two LCD controllers
and DCON which we _could_ work out some way of wrapping up into one
DRM device, or we could just ignore the special case, ignore the DCON
and just keep the two LCD CRTCs as two separate and independent DRM
devices.

I'm actually starting to come towards the conclusion that we should go
for the easiest solution, which is the one I just mentioned, and forget
trying to combine these devices into one super DRM driver.

-- 
Russell King

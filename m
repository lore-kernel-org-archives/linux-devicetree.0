From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Thu, 1 Nov 2012 11:48:13 +0900
Message-ID: <17133691.o4iLtizVux@percival>
References: <38620644.IyR5R8rjKP@percival> <509142F5.4010307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <509142F5.4010307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 31 October 2012 23:25:41 Stephen Warren wrote:
> On 10/31/2012 03:04 AM, Alex Courbot wrote:
> > Hi,
> > 
> > Would anyone be opposed to having a gpio_get() function that works
> > similarly to e.g. regulator_get() and clk_get()?
> 
> One major stumbling block is that with device tree, each individual
> binding gets to decide on the specific naming of the propert{y,ies} that
> define the GPIO(s) for the device, and so there's no way to provide a
> generic implementation of that function.

The idea is not to make every GPIOs declared so far accessible through this 
function - as you point out this would be tricky at best - but to also define 
how they should be properly declared (similarly to regulators and pals) for 
bindings that need to use get_gpio(). Existing bindings and drivers that can 
live without it should not be modified. And now that you mention it, the end of 
the GPIO declaration anarchy would be another point in favor of this feature.

Now I am aware that almost every subsystem comes with its own scheme for 
declaring resources in the DT and there will be an long fight to decide which 
one should apply here, but I'm willing to take that road.

> Related, I've always wished that DT nodes looked like:
> 
> device {
>     reg = <...>;
>     compatible = <...>;
>     resources {
>         pwms = <...>;
>         regulators = <...>;
>         clocks = <...>;
>         gpios = <...>;
>         other-devices = <...>; /* for custom API dependencies */
>     };
>     config {
>         /* device-specific properties */
>     };
>     child-busses {
>         0 = { ... };
>         1 = { ... };
>     };
> };
> 
> ... specifically so that all resource allocation, and perhaps even child
> bus enumeration, could be completely standardized in the DT/device core.
> This could also feed into deferred probe, which could then be purely
> implemented inside the DT/driver core. However, that'd require something
> incompatible like "device tree 2.0"

I think this would be awesome. This could even probably be implemented without 
breaking things, if everything takes place inside well-defined subnodes of the 
device.

Alex.

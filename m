From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: OF_DYNAMIC usage
Date: Fri, 06 Jul 2012 06:46:50 +1000
Message-ID: <1341521210.6330.16.camel@pasglop>
References: <4FF586D1.2050407@monstr.eu> <4FF594AD.6000401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF594AD.6000401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2012-07-05 at 08:20 -0500, Rob Herring wrote:
> On 07/05/2012 07:21 AM, Michal Simek wrote:
> > Hi,
> > 
> > can someone tell me usage of OF_DYNAMIC?
> > How this can be used by user?
> > 
> > Is it possible to exchange device node?
> > Add new one, delete one, etc?
> > 
> > Any user guide/log will be helpful to see what I can do with it.
> 
> 2nd question on OF_DYNAMIC in a week... I haven't really looked at it. I
> would suggest looking at the existing users (only powerpc iseries and
> pseries). My concern using would be that the reference counting is not
> correct for many drivers as of_node_get/put is a nop without OF_DYNAMIC.
> 
> You can also activate/deactivate nodes with the status property.
> 

No doc that I know of. It's used by pseries only (iseries is gone btw)
for "DLPAR" (aka Dynamic Reconfiguration aka hotplug).

The way it works at the moment is that when something new is plugged in,
the hypervisor talks to a proprietary crap daemon in userspace which
talks to a special tool (that one we have the source code) which then
obtains via some FW interfaces a "blob" of bits of device-tree to add
(or to remove), using a phyp specific format, and echo that stuff
into /proc/ppc64/ofdt.

It's pretty fugly...

Because nodes can come and go, we thus add refcounting. There's various
places where the refcounting is not quite right but mostly things that
don't get plugged/unplugged, actual vio devices or PCI devices tend to
get it right.

Also we don't have good rules for properties lifetime, as it is, it's
assumed to be the same as the node and there's no proper way to
add/remove/modify a property "live". I would recommend at least
something RCUish if you're going to try to be safe to delay the freeing
of the old value in the dynamic case.

There's definitely room for improvements in that area...

Cheers,
Ben.

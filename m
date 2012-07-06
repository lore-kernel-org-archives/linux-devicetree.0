From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: OF_DYNAMIC usage
Date: Fri, 06 Jul 2012 16:19:22 +1000
Message-ID: <1341555562.6330.51.camel@pasglop>
References: <4FF586D1.2050407@monstr.eu> <4FF594AD.6000401@gmail.com>
 <1341521210.6330.16.camel@pasglop> <4FF67F96.1040902@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF67F96.1040902-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
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
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2012-07-06 at 08:03 +0200, Michal Simek wrote:
> >
> > The way it works at the moment is that when something new is plugged in,
> > the hypervisor talks to a proprietary crap daemon in userspace which
> > talks to a special tool (that one we have the source code) which then
> > obtains via some FW interfaces a "blob" of bits of device-tree to add
> > (or to remove), using a phyp specific format, and echo that stuff
> > into /proc/ppc64/ofdt.
> 
> Where is that source code for the special tool?

I can dig that for you, however ...

> Can you point me to the "phyp specific format"?

Same deal, I don't think there's a public doc, however..

>  From reconfig.c it looks like that there are some key words like
> add_node/remove_node/add_property... follow by space and node name +
> options which lookes like dtb format.

Right, I would just recommend you don't do that.

The need to "hotplug" bits of device-tree is going to be generic enough
that we should come up with something better and more generic than that
pseries stuff.

IE. Some way to pass bits of ftb blob rather than this specific format
to begin with, etc...

So I'd say just ignore the pseries stuff, I can dig the tool etc... if
you -really- need them but I'd rather you don't base your stuff on it,
just make up something better & more generic for you. It will be useful
to others.

Cheers,
Ben.

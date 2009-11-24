From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 11/11] of: unify phandle name in struct device_node
Date: Wed, 25 Nov 2009 08:06:55 +1100
Message-ID: <1259096815.16367.133.camel@pasglop>
References: <20091124081316.6216.66310.stgit@angua>
	<20091124081957.6216.74456.stgit@angua>
	<20091124.093732.203692950.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091124.093732.203692950.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2009-11-24 at 09:37 -0800, David Miller wrote:
> From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Date: Tue, 24 Nov 2009 01:20:05 -0700
> 
> > In struct device_node, the phandle is named 'linux_phandle' for PowerPC
> > and MicroBlaze, and 'node' for SPARC.  There is no good reason for the
> > difference, it is just an artifact of the code diverging over a couple
> > of years.  This patch renames .node to .linux_phandle for SPARC.
> 
> I know it's just a name, but there is no reason to put "linux" in the
> member name.  It's the real device phandle value from OpenFirmware not
> something invented by Linux's OF layer.
> 
> PowerPC uses this for something different, it records the information
> here using the special "linux,phandle" and "ibm,phandle" properties.
> 
> See unflatten_dt_node() in arch/powerpc/kernel/prom.c before your
> changes.

Right, this comes from a subtle problem with our firmwares on pSeries.

We have a phandle from OF. But some devices, especially virtual devices,
also have an "ibm,phandle" which may or may not be the same afaik.

In addition, when the hypervisor hotplugs some devices, it sends us some
new device-tree bits to add. Those don't have a phandle in the formal
sense afaik, but -do- have an ibm,phandle property.

I think we can always just use ibm,phandle instead of the OF one when
the former is present, they should be non overlapping, but of course,
any chance in that area will require plenty of testing on some of those
machines.

Cheers,
Ben.

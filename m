From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt: platform: Extract device name from device tree blob
Date: Thu, 15 Nov 2012 15:52:46 +0000
Message-ID: <20121115155246.C4EC83E194B@localhost>
References: <1352732343-1199-1-git-send-email-per.forlin@stericsson.com>
 <CACxGe6vjLA3j-bc_048UrdB5Q=8pV8=LPSVUnU_k3anX23vwyw@mail.gmail.com>
 <50A17E30.7030807@stericsson.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6816041666675836764=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50A17E30.7030807-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
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
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Fredrik SODERSTEDT <fredrik.soderstedt-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============6816041666675836764==
Content-Type: text/plain

On Mon, 12 Nov 2012 23:54:40 +0100, Per Förlin <per.forlin-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> wrote:
> On 11/12/2012 04:20 PM, Grant Likely wrote:
> > On Mon, Nov 12, 2012 at 2:59 PM, Per Forlin <per.forlin-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> wrote:
> >> Add support to extract device name from device tree blob.
> >> If the property "dev-name" is set in the DTS this name will
> >> be used when creating the device.
> >> The auxdata_lookup has precedence and will override
> >> the "dev-name" property.
> > 
> > Using a 'dev-name' property has the same problem that the 'cell-index'
> > properties have in that it is encoding part of the global namespace
> > local to the node and it becomes easy to create collisions. Instead of
> > this check to see if one of the properties in /aliases points to the
> > node and use that for the name.
> > 
> > g.
> > 
> Thanks Grant for your feedback,
> 
> Extract from exynos5250.dtsi:
> -----------
> 	aliases {
> 		spi0 = &spi_0;
> 		spi1 = &spi_1;
> 		spi2 = &spi_2;
> 	};
> 
> 	spi_0: spi@12d20000 {
> ...
> 	};
> 
> 	spi_1: spi@12d30000 {
> ...
> 	};
> 
> 	spi_2: spi@12d40000 {
> ...
> 	};
> ---------------
> 
> Alias refers to the device node. The device node is not aware of the alias.
> 
> How to get a device name from the aliases.
> 1. Traverse all aliases for each device node (time consuming if there are many aliases)
> 2. Make a new function of_alias_get_name(), today there is only of_alias_get_id()
> 3. The functionality of setting device_name based on alias name needs to be optional because one may want to use aliases without changing the name of the device.
> All this is feasible but perhaps not optimal.
> 
> I don't really see how come name space is a big issue in this case. The name space of "dev-name" is local to the device node. A child device node can use the same dev-name as the parent (unless I'm mistaken which happens quite often). Introducing yet another property name pollutes the name space of the device node. Still I think the pros are stronger than the cons.
> 
> Do you still prefer to use the name of the Alias? Could you please elaborate a bit more how this can be done in practice?
> I would agree with you if there was a reference from the device node to the alias.

Oh, I see what you're trying to do. As Lee pointed out you're trying to
make the Linux internal way of matching up clocks and regulators happy.
That is very much a Linux-kernel internal thing and should be solved in
the kernel. Trying to solve it with fixed names in the device tree will
cause problems down the road.

I though you were wanting to have logical names for the devices that
make sense to the user which is how aliases is used now.

So, no, don't do this.

g.


--===============6816041666675836764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6816041666675836764==--

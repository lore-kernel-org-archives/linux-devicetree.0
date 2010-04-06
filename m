From: "Herring Robert-RA7055" <ra7055-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: devicetree platform bus bindings
Date: Tue, 6 Apr 2010 05:45:17 -0700
Message-ID: <DE2504B3A515524BBE6934369EFDC0DA0925331F@az33exm20.fsl.freescale.net>
References: <DE2504B3A515524BBE6934369EFDC0DA09252CF7@az33exm20.fsl.freescale.net>
	<k2nfa686aa41004011531tbecd5a5bp9c43abc7d206ff70@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <k2nfa686aa41004011531tbecd5a5bp9c43abc7d206ff70-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant,

> > Do you plan to have generic DT parsing to platform device 
> creation code or
> > will this remain platform specific?
> 
> I'm actively developing this.  A while ago I decided I was not going
> to port of_platform_bus_type bus to any new architectures because it
> is effectively just platform_bus_type with a slightly different
> matching scheme.  So I wrote a patch that generates platform devices
> from the device tree instead.
> 
> However, since then I took on the task of removing
> of_platform_bus_type entirely and just using platform_bus_type on ppc,
> mb & sparc, so arm will be able to use the same code.  The patches I
> just pushed out to my experimental branch show my WIP code and how
> both the versatile and omap platforms are modified to use the common
> code.
> 
> Word of warning though, this is highly experimental code and I cannot
> promise it won't break spectacularly.
> 

I've updated to your latest tree and have MX51 working with DT. I've got
a few issues with bus_id/name+id. Is your goal that existing platform
drivers work unmodified? If so, the current <address>.<name> bus_id
scheme doesn't really work. The platform matching code needs
platform_device.name to be just a name without any instance id. I was
thinking this would be the compatible field. There are also dependencies
on the bus_id being name.id in the clock code for example. I was
planning to use cell-index property for the id.

How do you see adding platform_data to the devices working?

Rob

From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [RFC PATCH 00/14] Versatile Express device tree port
Date: Thu, 19 Aug 2010 10:45:12 +0800
Message-ID: <1282185912.3194.90.camel@pororo>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

> This patchset provides an initial version of device tree enabled kernel on
> an ARM Versatile Express board.

Awesome, nice work. As Grant has said, most of my patches are now in his
tree, and that's probably the best place to work from. There shouldn't
be much change required to do a rebase.

> Clock names as well as amba device names are temporary waiting for OF bindings
> definition (clocks).

Grant - I saw you weren't too concerned with the mixed phandle,string
format. What do you think about the binding - should we continue using
the clock name in the property name?

> Lorenzo Pieralisi (14):
>   ARM: amba device memory allocation fix
>   ARM: vexpress: fix clocks definition to comply with new framework
>   ARM: fix add instruction to set the flags
>   ARM: r1 DT mach id init

Sounds like these are (or will be) in Grant's tree already

>   ARM: vexpress: fix typo in addruart

I'd suggest posting this as a separate fix to linux-arm-kernel.

>   platform: add function to initialize OF match table
>   drivers/smsc911x: add DT support
>   ARM: versatile-i2c driver DT port
>   ARM: ARM flash driver DT port
>   drivers/USB: isp1760 DT platform parsing and binding
>   ARM: PMU: add device tree probing
>   ARM: vexpress: add board support for DT probing
>   ARM: vexpress: Definition of vexpress dts specification
>   ARM: vexpress: add device tree build system and dtbuImage

Cheers,

Jeremy

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 06/24] C6X: devicetree
Date: Tue, 13 Sep 2011 17:33:59 +0200
Message-ID: <201109131733.59700.arnd@arndb.de>
References: <1314826019-22330-1-git-send-email-msalter@redhat.com>
	<6360771.ouEC5EKNMR@wuerfel>
	<1315917546.11280.38.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1315917546.11280.38.camel-PDpCo7skNiwAicBL8TP8PQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 13 September 2011, Mark Salter wrote:
> On Tue, 2011-09-13 at 08:43 +0200, Arnd Bergmann wrote:
> > Are these instructions specific to the interrupt controller or
> > do they access a register space that can contain arbitrary
> > devices?
> > 
> > If there is a separate address space for special devices, it might
> > be good to describe that in the device tree, like we do for PCI
> > I/O space.
> > 
> 
> It is a core register area. Similar to ARM or MIPS coprocessor
> registers.

I guess it still depends, it's probably a grey area. If the register layout
is the same on all c6x cores and it's only for core stuff, there is no need
to put it in the device tree. If you have multiple soc (off-core) devices
being controlled through the registers, or the numbers vary a lot between
different chips, I would put all of them into the device tree.

	Arnd

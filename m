From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: How do I choose an arbitrary minor number for my tty device?
Date: Wed, 24 Nov 2010 12:13:14 -0600
Message-ID: <20101124121314.503dd860@udp111988uds.am.freescale.net>
References: <4CE44B1B.9040709@freescale.com> <20101117215147.GA26792@suse.de>
	<4CE452CD.3050001@freescale.com> <20101117221903.GA4066@suse.de>
	<4CE45A4E.70308@freescale.com> <20101118022434.GA9833@suse.de>
	<4CE546C5.8060401@freescale.com> <20101118153912.GA1443@suse.de>
	<4CE54E40.9040503@freescale.com>
	<20101118112146.3275eb08@udp111988uds.am.freescale.net>
	<4CE5657D.8060105@freescale.com>
	<20101118121356.3491da72@udp111988uds.am.freescale.net>
	<1290594227.4446.12.camel@concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1290594227.4446.12.camel@concordia>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[sorry for the resend, fixed the devtree list address]

On Wed, 24 Nov 2010 21:23:47 +1100
Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:

> On Thu, 2010-11-18 at 12:13 -0600, Scott Wood wrote:
> > Unfortunately, it's not an exact match, and the fact that reg doesn't
> > translate to a physical address means that AFAICT you'll currently get
> > something like "byte-channel.nnn", where "nnn" is an arbitrary
> > kernel-assigned number.
> 
> Can you not use device_rename() ?

Ah, didn't know about that.  Still, might be nice to add support for
"handle" nodes at the infrastructure level rather than in each driver.

> > It would be nice if platform devices that are created from device tree
> > nodes included a link to the corresponding /proc/device-tree node in
> > their sysfs node.
> 
> It's not a link, but the OF path is in devspec, so you can work it out
> fairly easily.

Hmm, I see a "devspec" in PCI devices, but not in devtree-probed
platform devices.  of_bus_type_init isn't being called from anywhere
but the ibmebus code.  It looks like this was a casualty of merging
of_platform with platform (commit eca3930163ba8884060ce9d9ff5ef0d9b7c7b00f).

-Scott

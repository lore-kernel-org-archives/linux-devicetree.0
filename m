From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] Clock binding
Date: Sat, 29 Aug 2009 08:33:52 +1000
Message-ID: <1251498832.20467.184.camel@pasglop>
References: <1250569288.19007.15.camel@pasglop>
	<1251346157.20467.22.camel@pasglop> <4A96F69A.5050003@firmworks.com>
	<1251411532.20467.74.camel@pasglop> <4A970C85.8090703@firmworks.com>
	<1251420686.20467.96.camel@pasglop> <4A974295.9020504@firmworks.com>
	<1251427388.20467.122.camel@pasglop>
	<955e48b80908280516m457530cfn3b07b52f2fa2c471@mail.gmail.com>
	<fa686aa40908280906w7953017ek44ee498d57e0a642@mail.gmail.com>
	<B7829AEE-B751-403D-9A16-CFE1A4E0FAB0@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <B7829AEE-B751-403D-9A16-CFE1A4E0FAB0-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2009-08-28 at 20:24 +0200, Rafal Jaworowski wrote:
> Grant,
> When choosing the best location for the bindings page please consider  
> it uniform enough so that various OSes can use it as a reference. We  
> are very much interested in bringing FDT support for embedded FreeBSD  
> (arm, powerpc), and one of the uncertainties is how to deal with  
> existing Linux bindings definitions: at the moment they are maintained  
> as part of kernel source tree, and there are doubts whether we should  
> come up with our own set (most likely *very* similar), which we'd like  
> to avoid.

I agree. We need to be OS neutral.

In fact, one of the main issue right now with the core binding is the
phandles, which are put into "linux,phandle" properties. That must
change and we need to make the kernel aware of the change.

We will still keep linux-specific properties around, I suppose, mostly
for linux-specific things exchanged between the boot wrapper and the
kernel, but the base tree should generally be devoid of a "linux,"
property.

Cheers,
Ben.

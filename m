From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 18:17:41 +1000
Message-ID: <1243498661.3171.167.camel@pasglop>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<4A1DB855.2030608@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4A1DB855.2030608-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2009-05-28 at 06:01 +0800, Mitch Bradley wrote:
> If anybody is interested, the core ARM support has been added to the 
> Open Firmware tree at svn://openfirmware.info/openfirmware - the same 
> version of OFW that's used on OLPC - under an MIT-style license. This is 
> a full-featured Open Firmware whose lineage traces back to the original 
> Open Boot implementation that I wrote for Sun starting in 1987.
> 
> It's not yet fully elaborated for specific platforms and devices, but it 
> does contain all the core IEE1275 device tree stuff and the standard 
> support packages.  It gets you to an ok prompt on Beagle Board and 
> Gumstix Overo systems.  The source-level and assembly-language debuggers 
> are fully functional. As currently configured on those systems, you can 
> load it into memory either via u-boot or instead of u-boot.
> 
> This base ARM port, while newly released as FOSS, is quite solid, having 
> been developed some years ago for the Digital (RIP) DNARD system.
> 
> I'd be happy to work with people to add deeper support for specific 
> device and platforms.

That's actually great news !

While most of the discussion here revolves around whether to use a
device-tree or not, mostly with the flattened device-tree format in
mind, having a real OF implementation is always a much better option
as far as I'm concerned.

Cheers,
Ben.

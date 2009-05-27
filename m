From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 06:01:57 +0800
Message-ID: <4A1DB855.2030608@firmworks.com>
References: <1243408083.13460.14.camel@debian-nb>	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <ed82fe3e0905270739k38018c87ka11f62c5977e45fb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

If anybody is interested, the core ARM support has been added to the 
Open Firmware tree at svn://openfirmware.info/openfirmware - the same 
version of OFW that's used on OLPC - under an MIT-style license. This is 
a full-featured Open Firmware whose lineage traces back to the original 
Open Boot implementation that I wrote for Sun starting in 1987.

It's not yet fully elaborated for specific platforms and devices, but it 
does contain all the core IEE1275 device tree stuff and the standard 
support packages.  It gets you to an ok prompt on Beagle Board and 
Gumstix Overo systems.  The source-level and assembly-language debuggers 
are fully functional. As currently configured on those systems, you can 
load it into memory either via u-boot or instead of u-boot.

This base ARM port, while newly released as FOSS, is quite solid, having 
been developed some years ago for the Digital (RIP) DNARD system.

I'd be happy to work with people to add deeper support for specific 
device and platforms.

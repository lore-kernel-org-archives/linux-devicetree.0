From: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 02:07:07 +0200
Message-ID: <20090528000707.GR6805@pengutronix.de>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<fa686aa40905270839m375bbdacqb1acb1be0a2d2da0@mail.gmail.com>
	<20090527162000.GM6805@pengutronix.de>
	<fa686aa40905271335o1165419hda2334bef42aa3f@mail.gmail.com>
	<20090527234801.GP6805@pengutronix.de>
	<4A1DD3A0.3010501@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4A1DD3A0.3010501-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 06:58:24PM -0500, Scott Wood wrote:
> Robert Schwebel wrote:
>> The oftree by design wants to be a complete hardware description. As
>> you mention above, there are cases where you *nevertheless* need
>> ad-hoc information about things *not* encoded into the device tree.
>>
>> This renders the whole concept ad absurdum. You need a machine number
>> again - and if you need that: why not stay with the ARM model, define
>> everything with platform data and avoid the whole thing?
>
> Because it's better to have a little platform specific code than a lot
> of it?

Until now, oftree has created more problems than it has solved for us.
The idea works fine for well-known things like memory maps and
interrupts. It works badly for corner cases, and embedded land is full
of it. The effort to get the oftree stuff right is often more than a
magnitude of order higher than the effort for the actual functionality.
That should be an alarm sign that something is wrong.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

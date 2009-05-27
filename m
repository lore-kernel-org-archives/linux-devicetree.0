From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 15:05:58 -0600
Message-ID: <fa686aa40905271405pc2f1738gc8dd139f61a0e27@mail.gmail.com>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<20090527192909.GA32398@flint.arm.linux.org.uk>
	<20090527205218.GA5591@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527205218.GA5591-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 2:52 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Wed, May 27, 2009 at 08:29:10PM +0100, Russell King wrote:
>> On Wed, May 27, 2009 at 02:08:42PM -0500, Scott Wood wrote:
>
>> > I'm not talking about platform specific code, I'm talking about code to
>> > retrieve information about a device from the device tree. =A0There wou=
ld
>> > not be separate instances of this for "platforms X, Y and Z", just one
>> > of_platform binding in each driver. =A0It's no different than having a
>> > platform bus binding, except in the data structures used.
>
>> I really don't see what OF buys us then, apart from additional dependenc=
ies
>> that have to be correct for the kernel to work. =A0I can only see disadv=
antages
>> if all OF is, is a way to pass some file to the kernel to (effectively) =
tell
>> it which drivers to use.
>
> The main selling points of the device tree AFAICT are that some
> platforms have to use it it anyway due to the native OS and firmware for
> the platform use it, the possibility of using the same device tree with
> more than one OS (modulo unrepresentable holes) and the fact that some
> people find it more convenient to use than straight data tables
> (personally I find the two approaches to be much of a muchness there).
> Perhaps I'm missing something, though?

Here are some that I've find useful:

There is the advantage that it decouples the machine description from
the kernel code, which in turn seems to encourage code reuse.  There
has been a significant decrease in the amount of platform specific
code in powerpc since the switch to FDT booting.

There is the advantage of easy multiplatform support.  I regularly
build a single kernel image which boots on all my MPC5200 boards, and
on my MPC83xx boards.  Because the machine description is a separate
image blob, and not hard compiled into the kernel, the kernel doesn't
have to be explicitly told what boards it may possibly be booted on
(other than turning on the appropriate drivers; handled with modules,
just like on x86).  It may not be much of an advantage for current
deployed systems, but it is a huge win during development and
testing....

That being said, I've been told that Motorola has shipped phones with
FDT support in the kernel for exactly the reason of booting a single
kernel image on multiple versions of the device.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

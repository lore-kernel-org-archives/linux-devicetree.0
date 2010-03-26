From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Thu, 25 Mar 2010 19:22:08 -0500
Message-ID: <ed82fe3e1003251722o784f6b96paf140e76cfdaf93@mail.gmail.com>
References: <4BAA4C8A.70104@freescale.com>
	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<ed82fe3e1003250742t5affee7dudca651ab3352bc16@mail.gmail.com>
	<20100325.175343.706994262324563953.imp@bsdimp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100325.175343.706994262324563953.imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 25, 2010 at 6:53 PM, M. Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org> wrote:

> Most !linux systems are not GPL'd. =A0They are BSDL, primarily, or some
> private license between seller and buyer. =A0In any event, other OSes
> likely won't have the GPL issue.

You're probably right.

> But I'm confused. =A0If you can't distribute the binary firmware, why
> can you distribute the hex dump of the firmware?

We can distribute the binary firmware.  We just can't embed it in the
Linux kernel, since it's not GPL.  So it needs to be delivered to the
kernel at boot time via a non-GPL mechanism.  The device tree is one
option.  An initrd is another.  The problem Freescale has is that
modifying our BSP to use an initrd is not a trivial task, and it's a
lot more complicated than using the device tree.  For example, there's
the possibility that U-Boot and Linux will use different microcode
binaries, and it also means that the initrd becomes SOC-specific.

-- =

Timur Tabi
Linux kernel developer at Freescale

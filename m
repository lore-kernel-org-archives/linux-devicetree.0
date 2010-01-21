From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Flattened Device Tree
Date: Thu, 21 Jan 2010 09:38:37 -0700
Message-ID: <fa686aa41001210838k1fff33fbndf98e9d5a99dec2c@mail.gmail.com>
References: <7f9d9abf1001180924o5b587b54i737d60467e3c878@mail.gmail.com>
	<33307c791001191410r6430bb81wbfee8f9e82c5cbf9@mail.gmail.com>
	<fa686aa41001210833v7ac9c0a1gd5b40d0ff5bfdc32@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41001210833v7ac9c0a1gd5b40d0ff5bfdc32-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Oops, originally bcc'd the mailing list instead of cc'd.  resend.

---------- Forwarded message ----------

Hey Rafal,

A friend pointed this status update out to me on the FreeBSD mailing
list. =A0I'm thrilled to see that you're making progress.

I'm also working on adding Linux FDT support to the ARM architecture,
and I think we need to coordinate. =A0Specifically, I'd like to agree on
a common boot interface for FDT booting on ARM (and PowerPC for that
matter).

For PowerPC, I assume you're adopting the boot interface specified in
ePAPR and are using r3 to pass the FDT blob pointer (page 53 of
ePAPR). =A0Correct?

What are you using for the ARM boot interface? =A0For the experiments
performed to date, the dtb is getting passed to the kernel in a new
ATAG, but I thing ATAGs are Linux specific. =A0Ideally, I'd like to have
exactly one method of passing the dtb to the kernel, and I don't see
any good reason for Linux, FreeBSD, or any other OS to use different
methods. =A0However, I also don't want to break booting older operating
system images that don't support FDT. =A0The ATAG approach is nice for
Linux because it just adds an additional data item in a backwards
compatible way.

Thoughts?

g.

> ---------- Forwarded message ----------
> Flattened Device Tree for embedded FreeBSD
> =A0=A0 URL: http://wiki.FreeBSD.org/FlattenedDeviceTree
> =A0=A0 URL:
> =A0=A0 http://p4db.FreeBSD.org/changeList.cgi?FSPC=3D//depot/projects/fdt=
/...
> =A0=A0 Contact: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
> =A0=A0 The purpose of this project is to provide FreeBSD with support for=
 the
> =A0=A0 Flattened Device Tree (FDT) technology, the mechanism for describi=
ng
> =A0=A0 computer hardware resources, which cannot be probed or self enumer=
ated,
> =A0=A0 in a uniform and portable way. The primary consumers of this techn=
ology
> =A0=A0 are embedded FreeBSD platforms (ARM, AVR32, MIPS, PowerPC), where =
a lot
> =A0=A0 of designs are based on similar chips but have different assignmen=
t of
> =A0=A0 pins, memory layout, addresses bindings, interrupts routing and ot=
her
> =A0=A0 resources.
> =A0=A0 Current state highlights:
> =A0=A0 =A0 * Environment, supported tools
> =A0=A0 =A0 =A0 =A0 =A0+ Integrated device tree compiler (dtc) and libfdt =
into FreeBSD
> =A0=A0 =A0 =A0 =A0 =A0 =A0userspace, kernel and loader build
> =A0=A0 =A0 * loader(8)
> =A0=A0 =A0 =A0 =A0 =A0+ Full support for device tree blob handling
> =A0=A0 =A0 =A0 =A0 =A0+ Load, traverse, modify (including add/remove) dev=
ice tree
> =A0=A0 =A0 =A0 =A0 =A0 =A0nodes and properties
> =A0=A0 =A0 =A0 =A0 =A0+ Pass the device tree blob to the kernel
> =A0=A0 =A0 =A0 =A0 =A0+ Both ARM and PowerPC loader(8) supported
> =A0=A0 =A0 * Kernel side FDT support (common)
> =A0=A0 =A0 =A0 =A0 =A0+ Developed OF interface for FDT-backed platforms
> =A0=A0 =A0 =A0 =A0 =A0+ ofw_bus I/F (and /dev/openfirm) available with FDT
> =A0=A0 =A0 =A0 =A0 =A0+ Integrated FDT resources representation with newb=
us (fdtbus
> =A0=A0 =A0 =A0 =A0 =A0 =A0and simplebus drivers)
> =A0=A0 =A0 * PowerPC kernel (Freescale MPC85XX SOC)
> =A0=A0 =A0 =A0 =A0 =A0+ MPC8555CDS and MPC8572DS successfully converted t=
o FDT
> =A0=A0 =A0 =A0 =A0 =A0 =A0conventions
> =A0=A0 =A0 * ARM kernel (Marvell Orion, Kirkwood and Discovery SOC)
> =A0=A0 =A0 =A0 =A0 =A0+ Work in progress on integrating FDT infrastructur=
e with ARM
> =A0=A0 =A0 =A0 =A0 =A0 =A0platform code
> =A0=A0 Work on this project has been sponsored by the FreeBSD Foundation.
> Open tasks:
> =A0=A0 =A01. Complete missing pieces for PowerPC (PCI bridge driver conve=
rsion
> =A0=A0 =A0 =A0 to FDT).
> =A0=A0 =A02. Complete ARM support.
> =A0=A0 =A03. Merge to SVN.


--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

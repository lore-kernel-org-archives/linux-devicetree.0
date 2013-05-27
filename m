From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: microblaze device-tree description - pair intc/buses and timers
Date: Mon, 27 May 2013 15:23:57 +0200
Message-ID: <51A35E6D.5040706@monstr.eu>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8004484940384424605=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Peter Crosthwaite <pcrost-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8004484940384424605==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2HGSWHOFIEOGIHMVAWENB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2HGSWHOFIEOGIHMVAWENB
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi guys,

we have got a new configurations with iomodule which can be connected to =
the microblaze
cpu and I would like to have proper description for this system
+ more advance configuration below.

Buses:
Microblaze systems have in standard configuration two buses LMB and AXI(i=
n past PLB).
We didn't generate LMB even there is placed BRAM (block ram)
but Linux expects that there is any writeable memory at 0x0.
Currently because we can use iomodule which is connected to LMB and we ne=
ed to generate
this bus. I don't expect that there is any problem to have this configura=
tion.

cpus {
	...
	cpu@0 {
		...
	}
}
lmb@0 {
	...
	iomodule@X {
		...
	}
}
axi@X {
	...
	nodes
	...
}

Block ram:
When we generate lmb make sense to also add there this small bram memory
but I expect that is it ok just to added to bus and do not add it to the =
root.
Currently we have an option to use "mmio-sram" compatibility string for i=
t.

Interrupt controller:
Till now Microblaze uses only one interrupt controller on main bus (AXI o=
r PLB)
and we just find compatible string and we said that this is primary inter=
rupt controller.

Based on DTS in the kernel I see that "interrupt-parent" property
reflects which interrupt controller is master and which one is in cascade=
=2E

Timer:
System timer was also detected in this way that the first suitable timer =
was
taken and used. Others were just ignored.


Extend system configuration
We have also got an option to add one more CPU and I would like to have
an option to describe it correctly.

LMB is private cpu bus and two options I have for description is to use
specific names for it
cpus {
	...
	cpu@0 {
		...
	}
	cpu@1 {
		...
	}
}
lmb_cpu0@0 {
	...
	iomodule0@X {
		...
	}
}
lmb_cpu1@0 {
	...
	iomodule1@X {
		...
	}
}
axi@X {
	...
	shared nodes
	...
}


or use bus handles in cpu

cpus {
	...
	cpu@0 {
		...
		bus-lmb =3D <&lmb_cpu0> ;
		bus-handle =3D <&axi> ;
	}
	cpu@1 {
		...
		bus-lmb =3D <&lmb_cpu1> ;
		bus-handle =3D <&axi> ;
	}
}
lmb_cpu0@0 {
	...
	iomodule0@X {
		...
	}
}
lmb_cpu1@0 {
	...
	iomodule1@X {
		...
	}
}
axi@X {
	...
	shared nodes
	...
}


which is from my point of view better because it supports
options where one cpu doesn't need to have main axi bus
or lmb or both.

It has also connection to interrupt controller description
where is not clear for system with two cpus which interrupt controller
is primary for every cpu.
It can be illustrated on simple example where there are two interrupt
controllers on axi and both are primary for specific cpu
and we can't exchange them.

It means that I would like to have proper description which interrupt
controller is primary one for specific CPU.
I am not sure if make sense to use interrupt-parent also from
this primary interrupt controller which will point to cpu.

cpus {
	...
	cpu@0 {
		...
	}
}
axi@X {
	...
	io_intc: intc@C {
		interrupt-controller ;
		interrupt-parent =3D <&cpu@0> ;
	}
	...
}

or better to use interrupt-handle property directly in cpu node.

cpus {
	...
	cpu@0 {
		interrupt-handle =3D <&io_intc> ;
		...
	}
}
axi@X {
	...
	io_intc: intc@C {
		interrupt-controller ;
	}
	...
}

We don't have any ARM gic interrupt controller which will be always
primary controller.

Grant, Rob: Can you please comment my proposal for descriptions?

In general I want to have exact bus description + interrupt controller
which can be used by specific cpu. Primary timers can be handled
separately.
Is there any other platform description in the kernel which also requires=
 this?

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2HGSWHOFIEOGIHMVAWENB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlGjXm0ACgkQykllyylKDCFLjgCgk9WVxwBno/G8ArC3RX03k7N9
cNEAn2ZD2xw4+Lh/bwq0Y6D5/Dzzgeio
=d5my
-----END PGP SIGNATURE-----

------enig2HGSWHOFIEOGIHMVAWENB--

--===============8004484940384424605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8004484940384424605==--

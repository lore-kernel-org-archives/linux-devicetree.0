From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: microblaze device-tree description - pair intc/buses and timers
Date: Tue, 11 Jun 2013 16:08:11 +0200
Message-ID: <51B72F4B.9030700@monstr.eu>
References: <51A35E6D.5040706@monstr.eu> <20130611130236.D2ACA3E0A90@localhost>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7035250704551117680=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130611130236.D2ACA3E0A90@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Edgar Iglesias <edgari-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter Crosthwaite <pcrost-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7035250704551117680==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2RCAKTGJVUWAWGHORJKPI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2RCAKTGJVUWAWGHORJKPI
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Grant,

nice that you have found a time to look at this.

On 06/11/2013 03:02 PM, Grant Likely wrote:
> On Mon, 27 May 2013 15:23:57 +0200, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wro=
te:
>> Hi guys,
>>
>> we have got a new configurations with iomodule which can be connected =
to the microblaze
>> cpu and I would like to have proper description for this system
>> + more advance configuration below.
>>
>> Buses:
>> Microblaze systems have in standard configuration two buses LMB and AX=
I(in past PLB).
>> We didn't generate LMB even there is placed BRAM (block ram)
>> but Linux expects that there is any writeable memory at 0x0.
>> Currently because we can use iomodule which is connected to LMB and we=
 need to generate
>> this bus. I don't expect that there is any problem to have this config=
uration.
>>
>> cpus {
>> 	...
>> 	cpu@0 {
>> 		...
>> 	}
>> }
>> lmb@0 {
>> 	...
>> 	iomodule@X {
>> 		...
>> 	}
>> }
>> axi@X {
>> 	...
>> 	nodes
>> 	...
>> }
>>
>> Block ram:
>> When we generate lmb make sense to also add there this small bram memo=
ry
>> but I expect that is it ok just to added to bus and do not add it to t=
he root.
>> Currently we have an option to use "mmio-sram" compatibility string fo=
r it.
>>
>> Interrupt controller:
>> Till now Microblaze uses only one interrupt controller on main bus (AX=
I or PLB)
>> and we just find compatible string and we said that this is primary in=
terrupt controller.
>>
>> Based on DTS in the kernel I see that "interrupt-parent" property
>> reflects which interrupt controller is master and which one is in casc=
ade.
>=20
> Mostly correct; it is also possible for an interrupt controller to
> cascade to two different parent controllers, and in that case there
> would need to be an interrupt-map somewhere. That case is rare however.=


Any dts in the kernel which uses this?


>> Timer:
>> System timer was also detected in this way that the first suitable tim=
er was
>> taken and used. Others were just ignored.
>>
>>
>> Extend system configuration
>> We have also got an option to add one more CPU and I would like to hav=
e
>> an option to describe it correctly.
>=20
> Are you doing SMP in this case? I assume that you are not because we're=

> talking about microblaze here. Separate OSes on each CPU?

As you know on fpga we can do a lot of things. I am not talking about SMP=

case here because it should also cover non SMP cases.
But yeah, Microblaze can also do SMP.


> The DT design currently assumes that then whole tree is from the view o=
f
> the CPU that the code is running on. CPUs that aren't part of the 'core=
'
> system typically don't show up in the /cpus node. In your case however,=

> I can see the arguement for wanting a single tree that describes
> everything and each CPU needs to know how to filter the tree for only
> the devices that belong to it. Am I correct so far?

We can do SMP on Microblaze. We can do also AMP as we are doing on arm zy=
nq.
It means it is up to user what user wants to run.
That's why system must be fully described.

The second point here that we configure qemu based on DTS description
and if system is not fully described then we are not able to do it.

And yes, Parsing/filter devices should be up to system or communication m=
echanism
to decide which device is used by which core/OS.

>> LMB is private cpu bus and two options I have for description is to us=
e
>> specific names for it
>> cpus {
>> 	...
>> 	cpu@0 {
>> 		...
>> 	}
>> 	cpu@1 {
>> 		...
>> 	}
>> }
>> lmb_cpu0@0 {
>> 	...
>> 	iomodule0@X {
>> 		...
>> 	}
>> }
>> lmb_cpu1@0 {
>> 	...
>> 	iomodule1@X {
>> 		...
>> 	}
>> }
>> axi@X {
>> 	...
>> 	shared nodes
>> 	...
>> }
>>
>>
>> or use bus handles in cpu
>>
>> cpus {
>> 	...
>> 	cpu@0 {
>> 		...
>> 		bus-lmb =3D <&lmb_cpu0> ;
>> 		bus-handle =3D <&axi> ;
>> 	}
>> 	cpu@1 {
>> 		...
>> 		bus-lmb =3D <&lmb_cpu1> ;
>> 		bus-handle =3D <&axi> ;
>> 	}
>> }
>> lmb_cpu0@0 {
>> 	...
>> 	iomodule0@X {
>> 		...
>> 	}
>> }
>> lmb_cpu1@0 {
>> 	...
>> 	iomodule1@X {
>> 		...
>> 	}
>> }
>> axi@X {
>> 	...
>> 	shared nodes
>> 	...
>> }
>>
>>
>> which is from my point of view better because it supports
>> options where one cpu doesn't need to have main axi bus
>> or lmb or both.
>=20
> The bus handle approach makes perfect sense to me. It is local to the
> CPU and it can use those properties to decide which nodes in the rest o=
f
> the tree are important.

ok great.


>> It has also connection to interrupt controller description
>> where is not clear for system with two cpus which interrupt controller=

>> is primary for every cpu.
>> It can be illustrated on simple example where there are two interrupt
>> controllers on axi and both are primary for specific cpu
>> and we can't exchange them.
>>
>> It means that I would like to have proper description which interrupt
>> controller is primary one for specific CPU.
>> I am not sure if make sense to use interrupt-parent also from
>> this primary interrupt controller which will point to cpu.
>>
>> cpus {
>> 	...
>> 	cpu@0 {
>> 		...
>> 	}
>> }
>> axi@X {
>> 	...
>> 	io_intc: intc@C {
>> 		interrupt-controller ;
>> 		interrupt-parent =3D <&cpu@0> ;
>> 	}
>> 	...
>> }
>=20
> This makes a bit of sense if you think of CPUs as a very simple
> interrupt controller with only one input. However, it doesn't line up
> well since there really isn't much you can do with that controller, and=

> you don't want to have to add "interrupt-controller" and
> "#interrupt-cells" to the cpu node.

ok.


>> or better to use interrupt-handle property directly in cpu node.
>>
>> cpus {
>> 	...
>> 	cpu@0 {
>> 		interrupt-handle =3D <&io_intc> ;
>> 		...
>> 	}
>> }
>=20
> This makes more sense. The CPU needs to know which intc it should look
> at for its first level of interrupt handling. I assume you have a
> mechanism for the OS to determine which cpu node is its 'home' node.

Not yet but description should be first.

btw: is there any problem if there is no interrupt controller in the syst=
em at all?
I think we can setup system just with one timer which should be possible
to describe and run Linux on it.
Is this any requirement from Linux point of view?

And in this configuration let's say Microblaze with standard axi timer, t=
imer
node should use the same description as was before (because we don't want=
 to change
the driver).
Which IMHO points to this description where interrupt-parent is CPU itsel=
f.

		system_timer: system-timer@41c00000 {
			compatible =3D "xlnx,axi-timer-1.03.a", "xlnx,xps-timer-1.00.a";
			interrupt-parent =3D <&microblaze>;
			interrupts =3D < 0 >;
			reg =3D < 0x41c00000 0x10000 >;
		} ;

But as you have written above cpu is not interrupt controller but in this=

"single interrupt line in the system" cpu behaves like interrupt controll=
er
where you don't need to look for which irq caused interrupts but drivers
should be the same.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2RCAKTGJVUWAWGHORJKPI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlG3L1EACgkQykllyylKDCHXZACdHQFuRiiuK9Th2zyQ4pchrCsJ
bZsAn0P6fulzCrjI67h0fRKryQaNbZnY
=g2y2
-----END PGP SIGNATURE-----

------enig2RCAKTGJVUWAWGHORJKPI--

--===============7035250704551117680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7035250704551117680==--

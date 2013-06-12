From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: microblaze device-tree description - pair intc/buses and timers
Date: Wed, 12 Jun 2013 08:30:21 +0200
Message-ID: <51B8157D.5000407@monstr.eu>
References: <51A35E6D.5040706@monstr.eu>
 <20130611130236.D2ACA3E0A90@localhost> <51B72F4B.9030700@monstr.eu>
 <20130611222225.9753A3E0D8D@localhost>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0856393515506259270=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130611222225.9753A3E0D8D@localhost>
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
--===============0856393515506259270==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2VTKFMGOBRIEEQSLJOLPM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2VTKFMGOBRIEEQSLJOLPM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/12/2013 12:22 AM, Grant Likely wrote:
> On Tue, 11 Jun 2013 16:08:11 +0200, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wro=
te:
>> Hi Grant,
>>
>> nice that you have found a time to look at this.
>>
>> On 06/11/2013 03:02 PM, Grant Likely wrote:
>>> On Mon, 27 May 2013 15:23:57 +0200, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> w=
rote:
>>>> Hi guys,
>>>>
>>>> we have got a new configurations with iomodule which can be connecte=
d to the microblaze
>>>> cpu and I would like to have proper description for this system
>>>> + more advance configuration below.
>>>>
>>>> Buses:
>>>> Microblaze systems have in standard configuration two buses LMB and =
AXI(in past PLB).
>>>> We didn't generate LMB even there is placed BRAM (block ram)
>>>> but Linux expects that there is any writeable memory at 0x0.
>>>> Currently because we can use iomodule which is connected to LMB and =
we need to generate
>>>> this bus. I don't expect that there is any problem to have this conf=
iguration.
>>>>
>>>> cpus {
>>>> 	...
>>>> 	cpu@0 {
>>>> 		...
>>>> 	}
>>>> }
>>>> lmb@0 {
>>>> 	...
>>>> 	iomodule@X {
>>>> 		...
>>>> 	}
>>>> }
>>>> axi@X {
>>>> 	...
>>>> 	nodes
>>>> 	...
>>>> }
>>>>
>>>> Block ram:
>>>> When we generate lmb make sense to also add there this small bram me=
mory
>>>> but I expect that is it ok just to added to bus and do not add it to=
 the root.
>>>> Currently we have an option to use "mmio-sram" compatibility string =
for it.
>>>>
>>>> Interrupt controller:
>>>> Till now Microblaze uses only one interrupt controller on main bus (=
AXI or PLB)
>>>> and we just find compatible string and we said that this is primary =
interrupt controller.
>>>>
>>>> Based on DTS in the kernel I see that "interrupt-parent" property
>>>> reflects which interrupt controller is master and which one is in ca=
scade.
>>>
>>> Mostly correct; it is also possible for an interrupt controller to
>>> cascade to two different parent controllers, and in that case there
>>> would need to be an interrupt-map somewhere. That case is rare howeve=
r.
>>
>> Any dts in the kernel which uses this?
>=20
> You can find lots of examples of the interrupt-map property by doing
> git grep. Most of them are PCI interrupt controllers which is similar t=
o
> what you're asking, but not entirely the same. I have seen examples in
> the past, but I cannot remember off the top of my head.

ok.

I forget to mention one more thing related to buses.
As you mentioned bus-handle is fine.
Maybe worth for lmb and axi case to add them to one handler.

bus-handle =3D <&lmb &axi>

which also show priorities.



>>>> Timer:
>>>> System timer was also detected in this way that the first suitable t=
imer was
>>>> taken and used. Others were just ignored.
>>>>
>>>>
>>>> Extend system configuration
>>>> We have also got an option to add one more CPU and I would like to h=
ave
>>>> an option to describe it correctly.
>>>
>>> Are you doing SMP in this case? I assume that you are not because we'=
re
>>> talking about microblaze here. Separate OSes on each CPU?
>>
>> As you know on fpga we can do a lot of things. I am not talking about =
SMP
>> case here because it should also cover non SMP cases.
>> But yeah, Microblaze can also do SMP.
>=20
> Nice! I didn't expect that. I assumed that cache coherency would have
> been too expensive to be worth it on an FPGA soft core.

Not sure about that.


>> btw: is there any problem if there is no interrupt controller in the s=
ystem at all?
>> I think we can setup system just with one timer which should be possib=
le
>> to describe and run Linux on it.
>> Is this any requirement from Linux point of view?
>=20
> It would mean every device driver needs to be polled. As long as the
> polling frequency is high enough for the work load then it should be
> okay. I don't see a problem with there being no interrupt controller,
> unless there needs to be a dummy one just to keep the kernel happy.

Interesting. I have tried to compile the fragment below by dtc
and there is no warning. It also means that there is missing checking
in DTC for interrupt-cells.

What I am worried about is that request_irq in the driver will require
irq chip functions which there are not.
But if this is correct description for this type of system then I am ok w=
ith it.

/dts-v1/;
/ {
	#address-cells =3D <1>;
	#size-cells =3D <1>;
	compatible =3D "xlnx,microblaze";
	model =3D "Xilinx-SP605-AXI-full-14.5";
	cpus {
		#address-cells =3D <1>;
		#cpus =3D <0x1>;
		#size-cells =3D <0>;
		microblaze_0: cpu@0 {
			clock-frequency =3D <75000000>;
			compatible =3D "xlnx,microblaze-8.50.a";
			device_type =3D "cpu";
			interrupt-handle =3D <>; /* empty or not available */
		} ;
	} ;
	mcb_ddr3: memory@80000000 {
		device_type =3D "memory";
		reg =3D < 0x80000000 0x8000000 >;
	} ;
	axi4lite_0: axi@1 {
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		compatible =3D "xlnx,axi-interconnect-1.06.a", "simple-bus";
		ranges ;
		system_timer: system-timer@41c00000 {
			clock-frequency =3D <75000000>;
			compatible =3D "xlnx,axi-timer-1.03.a", "xlnx,xps-timer-1.00.a";
			interrupt-parent =3D <&microblaze_0>;
			interrupts =3D < 0 >;
			reg =3D < 0x41c00000 0x10000 >;
		} ;
	} ;
} ;


Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2VTKFMGOBRIEEQSLJOLPM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlG4FX0ACgkQykllyylKDCGZZACgg5K/QOS+hGC4jhGn+JJjld+B
5eAAn3+rQuiHlnRh/4W43051dCAHVfSR
=lJvy
-----END PGP SIGNATURE-----

------enig2VTKFMGOBRIEEQSLJOLPM--

--===============0856393515506259270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0856393515506259270==--

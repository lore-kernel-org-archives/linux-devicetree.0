From: Nicolas Lavocat <nicolas.lavocat-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
Subject: mapping a PCI bus
Date: Mon, 09 Mar 2009 11:42:04 +0100
Message-ID: <49B4F27C.7040007@fr.thalesgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hy everybody!

I=92m working on a project:

On a proprietary board, (with a PowerPC 7448), a minimal Linux has been =

embedded. My first aim consist in using a graphic chipset on the board, =

that is to say make work the PCI bus. For the address mapping, I try to =

write a dts, using the dts of the mpc7448hpc2 board as a model. My =

problem is that I don=92t understand how to fill the field =93range=94 of t=
he =

PCI. The =93width=94 used and the number of range is different from on boar=
d =

to an other where PCI is used. I read the PCI specification, and don=92t =

find anything about it.

Here is an extract of my dts, where the field in question is indicated =

thanks to commentaries:

pci@70000000 { compatible =3D "abac-pci";

device_type =3D "pci";

#size-cells =3D <2>;

#address-cells =3D <3>;

#interrupt-cells =3D <1>;

reg =3D <0x70000000 0x1000>;

bus-range =3D <0 0>;

/* how can I know how to chose the number of range and their width?*/

ranges =3D <0x2000000 0x0 0xe0000000 0xe0000000 0x0 0x1a000000

0x1000000 0x0 0x0 0xfa000000 0x0 0x10000>;

=85

};

Then, I have a second question: why PCI=92s addresses seem to be =

implemented on 96 bits, whereas the addressing is done on 32 bits?

Thanks for Your attention !

Nicolas Lavocat

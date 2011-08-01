From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/7] ARM: mmp: support DT on both dkb and brownstone
Date: Mon, 1 Aug 2011 10:48:54 +0800
Message-ID: <CAN1soZzh-bovcAy3bBN18=0EfXregYWFAKrAjxqWA_Ra9Rxvzw@mail.gmail.com>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-3-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-4-git-send-email-haojian.zhuang@marvell.com>
	<20110729164218.GL11164@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110729164218.GL11164-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 30, 2011 at 12:42 AM, Grant Likely
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Thu, Jul 28, 2011 at 02:41:29PM +0800, Haojian Zhuang wrote:
>> Add new boards.c to support both TTC-DKB and MMP2-BROWNSTONE. If CONFIG_=
OF
>> isn't selected, we continue to use original ttc_dkb.c and brownstone.c.
>>
>> While everything moving to DT in ARCH-MMP, ttc_dkb.c and brownstone.c
>> will be abandoned.
>>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> ---
>> =A0.../devicetree/bindings/arm/marvell/boards.txt =A0 =A0 | =A0 =A07 +
>> =A0arch/arm/boot/dts/mmp2-brownstone.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0216 ++++++++++++++++++++
>> =A0arch/arm/boot/dts/pxa910-dkb.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 81 ++++++++
>> =A0arch/arm/mach-mmp/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A01 +
>> =A0arch/arm/mach-mmp/boards.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0138 +++++++++++++
>> =A05 files changed, 443 insertions(+), 0 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/arm/marvell/boar=
ds.txt
>> =A0create mode 100644 arch/arm/boot/dts/mmp2-brownstone.dts
>> =A0create mode 100644 arch/arm/boot/dts/pxa910-dkb.dts
>> =A0create mode 100644 arch/arm/mach-mmp/boards.c
>>
>> diff --git a/Documentation/devicetree/bindings/arm/marvell/boards.txt b/=
Documentation/devicetree/bindings/arm/marvell/boards.txt
>> new file mode 100644
>> index 0000000..a031a26
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/marvell/boards.txt
>> @@ -0,0 +1,7 @@
>> +TTC(pxa910) "DKB" evalutation board
>> +Required root node properties:
>> + =A0 =A0 - compatible =3D "mrvl,pxa910-dkb", "mrvl,pxa910";
>> +
>> +mmp2(armada610) "Brownstone" evalutation board
>> +Required root node properties:
>> + =A0 =A0 - compatible =3D "mrvl,mmp2-brownstone", "mrvl,mmp2";
>> diff --git a/arch/arm/boot/dts/mmp2-brownstone.dts b/arch/arm/boot/dts/m=
mp2-brownstone.dts
>> new file mode 100644
>> index 0000000..2673282
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/mmp2-brownstone.dts
>> @@ -0,0 +1,216 @@
>> +/dts-v1/;
>> +
>> +/include/ "skeleton.dtsi"
>> +
>> +/ {
>> + =A0 =A0 model =3D "Marvell MMP2 Brownstone";
>> + =A0 =A0 compatible =3D "mrvl,mmp2-brownstone", "mrvl,mmp2";
>> + =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 interrupt-parent =3D <&mmp_intc>;
>> +
>> + =A0 =A0 memory {
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x00000000 0x20000000>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 chosen {
>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "console=3DttyS2,38400 root=3D/de=
v/nfs nfsroot=3D192.168.1.100:192.168.1.101::255.255.255.0::eth0:on";
>> + =A0 =A0 =A0 =A0 =A0 =A0 linux,stdout-path =3D &uart2;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 soc@d4000000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2", "mrvl,armada610", =
"simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mmp_intc: interrupt-controller@d4282000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa168-in=
tc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* reg: <offset & size> */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282000 0x400>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <64>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* priority bits in conf regis=
ter */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-priority =3D <0x20>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_intc4: interrupt-controller@d4282150 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2-mux-=
intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282150 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <4>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,status-offset =3D <0x150>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mask-offset =3D <0x168>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* mfp register & interrupt in=
dex */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mfp-edge =3D <0xd401e2c4 =
1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_intc5: interrupt-controller@d4282154 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2-mux-=
intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282154 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <5>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,status-offset =3D <0x154>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mask-offset =3D <0x16c>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_intc9: interrupt-controller@d4282180 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2-mux-=
intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282180 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <9>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <3>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,status-offset =3D <0x180>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mask-offset =3D <0x17c>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_intc17: interrupt-controller@d4282158 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2-mux-=
intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282158 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <17>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <5>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,status-offset =3D <0x158>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mask-offset =3D <0x170>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_intc35: interrupt-controller@d428215c {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2-mux-=
intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd428215c 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <35>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <15>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,status-offset =3D <0x15c>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mask-offset =3D <0x174>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_intc51: interrupt-controller@d4282160 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2-mux-=
intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282160 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <51>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,status-offset =3D <0x160>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mask-offset =3D <0x178>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_intc55: interrupt-controller@d4282188 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2-mux-=
intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282188 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <55>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,status-offset =3D <0x188>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mask-offset =3D <0x184>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mmp_timer: timer@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa168-ti=
mer";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <13>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,clk-conf =3D <0xd4000024 =
0x13>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c0: i2c@d4011000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa255-i2=
c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4011000 0x60>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <7>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,i2c-frequency =3D "fast";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c1: i2c@d4031000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa255-i2=
c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4031000 0x60>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mux_int=
c17>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,i2c-frequency =3D "fast";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c2: i2c@d4032000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa255-i2=
c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4032000 0x60>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mux_int=
c17>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,i2c-frequency =3D "fast";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c3: i2c@d4033000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa255-i2=
c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4033000 0x60>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mux_int=
c17>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,i2c-frequency =3D "fast";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c4: i2c@d4033800 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa255-i2=
c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4033800 0x60>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <3>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mux_int=
c17>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,i2c-frequency =3D "fast";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c5: i2c@d4034000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa255-i2=
c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4034000 0x60>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <4>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mux_int=
c17>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,i2c-frequency =3D "fast";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart0: uart@d4030000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa270-se=
rial";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4030000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <27>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <26000000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <115200>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart1: uart@d4017000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa270-se=
rial";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4017000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <28>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <26000000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <115200>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart2: uart@d4018000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa270-se=
rial";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4018000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <24>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <26000000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <38400>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart3: uart@d4016000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa270-se=
rial";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4016000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <46>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <26000000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <115200>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +};
>> diff --git a/arch/arm/boot/dts/pxa910-dkb.dts b/arch/arm/boot/dts/pxa910=
-dkb.dts
>> new file mode 100644
>> index 0000000..b9f75b7
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/pxa910-dkb.dts
>> @@ -0,0 +1,81 @@
>> +/dts-v1/;
>> +
>> +/include/ "skeleton.dtsi"
>> +
>> +/ {
>> + =A0 =A0 model =3D "Marvell TTC DKB";
>> + =A0 =A0 compatible =3D "mrvl,pxa910-dkb", "mrvl,pxa910";
>> + =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 interrupt-parent =3D <&mmp_intc>;
>> +
>> + =A0 =A0 memory {
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x00000000 0x20000000>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 chosen {
>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "console=3DttyS0,115200 root=3D/d=
ev/nfs nfsroot=3D192.168.1.100:192.168.1.101::255.255.255.0::eth0:on";
>> + =A0 =A0 =A0 =A0 =A0 =A0 linux,stdout-path =3D &uart0;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 soc@d4000000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa910", "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0xd4000000 0xd4000000 0x00200000 =
=A0 =A0 =A0/* APB */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xd4200000 0xd4200000 0x002000=
00>; =A0 =A0 =A0/* AXI */
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mmp_intc: interrupt-controller@d4282000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa168-in=
tc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* reg: <offset & size> */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282000 0x400>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <64>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* priority bits in conf regis=
ter */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-priority =3D <0x51>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mmp_timer: timer@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa168-ti=
mer";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <13>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,clk-conf =3D <0xd4000034 =
0x33>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c0: i2c@d4011000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa255-i2=
c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4011000 0x60>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <7>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,i2c-frequency =3D "fast";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c1: i2c@d4037000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa255-i2=
c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4037000 0x60>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <54>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrvl,i2c-frequency =3D "fast";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart0: uart@d4017000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa270-se=
rial";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4017000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <27>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <14745600>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <115200>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart1: uart@d4018000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa270-se=
rial";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4018000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <28>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <14745600>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <115200>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +};
>> diff --git a/arch/arm/mach-mmp/Makefile b/arch/arm/mach-mmp/Makefile
>> index e7862ea..bdf5b23 100644
>> --- a/arch/arm/mach-mmp/Makefile
>> +++ b/arch/arm/mach-mmp/Makefile
>> @@ -12,6 +12,7 @@ obj-$(CONFIG_CPU_PXA910) =A0 =A0+=3D pxa910.o irq-pxa1=
68.o
>> =A0obj-$(CONFIG_CPU_MMP2) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D mmp2.o irq-mm=
p2.o
>>
>> =A0# board support
>> +obj-$(CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0 +=3D boards.o
>> =A0obj-$(CONFIG_MACH_ASPENITE) =A0+=3D aspenite.o
>> =A0obj-$(CONFIG_MACH_ZYLONITE2) +=3D aspenite.o
>> =A0obj-$(CONFIG_MACH_AVENGERS_LITE)+=3D avengers_lite.o
>> diff --git a/arch/arm/mach-mmp/boards.c b/arch/arm/mach-mmp/boards.c
>> new file mode 100644
>> index 0000000..13e61fb
>> --- /dev/null
>> +++ b/arch/arm/mach-mmp/boards.c
>> @@ -0,0 +1,138 @@
>> +/*
>> + * =A0linux/arch/arm/mach-mmp/boards.c
>> + *
>> + * =A0Support for the Multiple Marvell Development Platforms.
>> + *
>> + * =A0Copyright (C) 2009-2011 Marvell International Ltd.
>> + *
>> + * =A0This program is free software; you can redistribute it and/or mod=
ify
>> + * =A0it under the terms of the GNU General Public License version 2 as
>> + * =A0publishhed by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +#include <linux/of_fdt.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/i2c/pxa-i2c.h>
>> +
>> +#include <asm/mach-types.h>
>> +#include <asm/mach/arch.h>
>> +
>> +#include <mach/pxa910.h>
>> +#include <mach/mmp2.h>
>> +#include <mach/mfp-mmp2.h>
>> +
>> +#include "common.h"
>> +
>> +static void __init ttc_dkb_init(void)
>> +{
>> + =A0 =A0 of_platform_populate(NULL, of_default_bus_match_table, NULL, N=
ULL);
>> +}
>> +
>> +static const char *ttc_dkb_dt_match[] __initdata =3D {
>> + =A0 =A0 "mrvl,pxa910-dkb",
>> + =A0 =A0 NULL,
>> +};
>> +
>> +DT_MACHINE_START(TTC_DKB, "PXA910-based TTC-DKB Development Platform")
>> + =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D mmp_map_io,
>> + =A0 =A0 .init_irq =A0 =A0 =A0 =3D mmp_init_intc,
>> + =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &mmp_timer,
>> + =A0 =A0 .init_machine =A0 =3D ttc_dkb_init,
>> + =A0 =A0 .dt_compat =A0 =A0 =A0=3D ttc_dkb_dt_match,
>> +MACHINE_END
>> +
>> +static unsigned long brownstone_pin_config[] __initdata =3D {
>> + =A0 =A0 /* UART1 */
>> + =A0 =A0 GPIO29_UART1_RXD,
>> + =A0 =A0 GPIO30_UART1_TXD,
>> +
>> + =A0 =A0 /* UART3 */
>> + =A0 =A0 GPIO51_UART3_RXD,
>> + =A0 =A0 GPIO52_UART3_TXD,
>> +
>> + =A0 =A0 /* DFI */
>> + =A0 =A0 GPIO168_DFI_D0,
>> + =A0 =A0 GPIO167_DFI_D1,
>> + =A0 =A0 GPIO166_DFI_D2,
>> + =A0 =A0 GPIO165_DFI_D3,
>> + =A0 =A0 GPIO107_DFI_D4,
>> + =A0 =A0 GPIO106_DFI_D5,
>> + =A0 =A0 GPIO105_DFI_D6,
>> + =A0 =A0 GPIO104_DFI_D7,
>> + =A0 =A0 GPIO111_DFI_D8,
>> + =A0 =A0 GPIO164_DFI_D9,
>> + =A0 =A0 GPIO163_DFI_D10,
>> + =A0 =A0 GPIO162_DFI_D11,
>> + =A0 =A0 GPIO161_DFI_D12,
>> + =A0 =A0 GPIO110_DFI_D13,
>> + =A0 =A0 GPIO109_DFI_D14,
>> + =A0 =A0 GPIO108_DFI_D15,
>> + =A0 =A0 GPIO143_ND_nCS0,
>> + =A0 =A0 GPIO144_ND_nCS1,
>> + =A0 =A0 GPIO147_ND_nWE,
>> + =A0 =A0 GPIO148_ND_nRE,
>> + =A0 =A0 GPIO150_ND_ALE,
>> + =A0 =A0 GPIO149_ND_CLE,
>> + =A0 =A0 GPIO112_ND_RDY0,
>> + =A0 =A0 GPIO160_ND_RDY1,
>> +
>> + =A0 =A0 /* PMIC */
>> + =A0 =A0 PMIC_PMIC_INT | MFP_LPM_EDGE_FALL,
>> +
>> + =A0 =A0 /* MMC0 */
>> + =A0 =A0 GPIO131_MMC1_DAT3 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO132_MMC1_DAT2 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO133_MMC1_DAT1 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO134_MMC1_DAT0 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO136_MMC1_CMD | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO139_MMC1_CLK,
>> + =A0 =A0 GPIO140_MMC1_CD | MFP_PULL_LOW,
>> + =A0 =A0 GPIO141_MMC1_WP | MFP_PULL_LOW,
>> +
>> + =A0 =A0 /* MMC1 */
>> + =A0 =A0 GPIO37_MMC2_DAT3 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO38_MMC2_DAT2 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO39_MMC2_DAT1 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO40_MMC2_DAT0 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO41_MMC2_CMD | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO42_MMC2_CLK,
>> +
>> + =A0 =A0 /* MMC2 */
>> + =A0 =A0 GPIO165_MMC3_DAT7 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO162_MMC3_DAT6 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO166_MMC3_DAT5 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO163_MMC3_DAT4 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO167_MMC3_DAT3 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO164_MMC3_DAT2 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO168_MMC3_DAT1 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO111_MMC3_DAT0 | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO112_MMC3_CMD | MFP_PULL_HIGH,
>> + =A0 =A0 GPIO151_MMC3_CLK,
>> +
>> + =A0 =A0 /* 5V regulator */
>> + =A0 =A0 GPIO89_GPIO,
>> +};
>
> This table is /already/ in brownstone.c. =A0Why duplicate it?
>
As I mentioned, brownstone.c will be abandoned later.

>> +
>> +static void __init brownstone_init(void)
>> +{
>> + =A0 =A0 mfp_config(ARRAY_AND_SIZE(brownstone_pin_config));
>> +
>> + =A0 =A0 of_platform_populate(NULL, of_default_bus_match_table, NULL, N=
ULL);
>> +}
>> +
>> +static const char *brownstone_dt_match[] __initdata =3D {
>> + =A0 =A0 "mrvl,mmp2-brownstone",
>> + =A0 =A0 NULL,
>> +};
>> +
>> +DT_MACHINE_START(BROWNSTONE, "Brownstone Development Platform")
>> + =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D mmp_map_io,
>> + =A0 =A0 .init_irq =A0 =A0 =A0 =3D mmp_init_intc,
>> + =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &mmp_timer,
>> + =A0 =A0 .init_machine =A0 =3D brownstone_init,
>> + =A0 =A0 .dt_compat =A0 =A0 =A0=3D brownstone_dt_match,
>> +MACHINE_END
>> --
>> 1.5.6.5
>>
>

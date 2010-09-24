From: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/7] Samsung: SMDKV210 Added Basic DTS file The DTS file
	which descibes the SMDKV210 board is introduced. Support for VIC,
	Tiner and Uart are enabled at present.
Date: Fri, 24 Sep 2010 10:21:09 +0530
Message-ID: <AANLkTimkak89swKYSyDyw7EvuR0C8X0Yx-APnrEPj5rh@mail.gmail.com>
References: <1284977950-30687-1-git-send-email-shaju.abraham@linaro.org>
	<20100923193906.GB17400@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100923193906.GB17400-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 24, 2010 at 1:09 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Mon, Sep 20, 2010 at 03:49:10PM +0530, Shaju Abraham wrote:
>
> Hi Shaju,
>
> Thanks for this series. =A0First of, as Jon mentioned, please format
> your patches so that the first line is a short one-line description of
> the patch, followed by a blank line, followed by the detailed
> description.
>
> Comments below.
>
>> Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> =A0arch/arm/boot/dts/v210.dts | =A0147 +++++++++++++++++++++++++++++++++=
+++++++++++
>> =A01 files changed, 147 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/boot/dts/v210.dts
>>
>> diff --git a/arch/arm/boot/dts/v210.dts b/arch/arm/boot/dts/v210.dts
>> new file mode 100644
>> index 0000000..7cd219f
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/v210.dts
>> @@ -0,0 +1,147 @@
>> +/dts-v1/;
>> +
>> +/ {
>> + =A0 =A0 model =3D "smdkv210";
>
> The manufacturer name should also appear in the 'model' property

OK.

>
>> + =A0 =A0 compatible =3D "samsung,smdkv210";
>> + =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 interrupt-parent =3D <&VIC0>;
>> +
>> + =A0 =A0 aliases{
>> + =A0 =A0 =A0 =A0 =A0 =A0 vic0=3D&VIC0;
>
> This alias isn't actually needed as far as I can see.

 Will remove it..


>
>> + =A0 =A0 };
>> +
>> +
>> + =A0 =A0 memory {
>> + =A0 =A0 =A0 =A0 =A0 =A0 name =3D "memory";
>> + =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x20000000 0x40000000>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 chosen {
>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "root=3D/dev/nfs rw nfsroot=3D192=
.168.0.10:/opt/ubuntu-taiwan/ ip=3D192.168.0.1:192.168.0.10:192.168.0.10:25=
5:255:255:0:eth0
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 console=3DttyS=
AC2,115200 init=3D/linuxrc";
>
> It's generally a bad idea to put default bootargs into the device tree
> source file. =A0It is okay for the moment, but will need to be removed
> later when the firmware starts passing the bootargs natively.
>
>> + =A0 =A0 };
>> +
>> + =A0 =A0 soc {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x00000000 0x00000000 0xFFFFFFFF>;
>
> A single range that translates the entire address range can be
> specified simply as an empty ranges property, like so:
>
> =A0 =A0 =A0 =A0ranges;
>
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 watchdog@0xE2700000{
>
> should be: 'watchdog@e2700000 {'. =A0In the node name the address should
> be lowercase and the '0x' prefix should not be used.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c241=
0-wdt";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xE2700000 0x2000>;
>
> Nitpick; use lowercase in addresses.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <27 >;
>
> Nitpick; inconsistent whitespace.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&VIC0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 VIC0:vic0@f2000000 {
>
> Node names should reflect what the device is for, not what the
> specific device is. =A0So this node name should be: "VIC0:
> interrupt-controller@f2000000 {"
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xf2000000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf4000000>;
>
> Don't specify virtual-reg unless firmware is setting it the MMU in a
> way that the kernel must reuse (which would be unusual). =A0You can
> probably drop this property.

OK. My intention was to retrieve the  virtual address for the
statically mapped  devices.
I can drop it and use existing macros to pass the virtual address.


>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,vic";
>
> The compatible property for SoC devices should also include the exact
> device in addition to the generic specification. =A0Something like
> "samsung,s3c2410-vic". =A0Also, arm,vic may be too generic a name. =A0The
> exact core name may is a better choice; ie: "arm,pl192". =A0So, for all
> the interrupt controller nodes, compatible should look like this:
>
> =A0 =A0 =A0 =A0compatible =3D "samsung,s3c2410-vic", "arm,pl192";
>
>
> Finally, documentation needs to be added to devicetree.org to document
> the "arm,vic" binding.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq-src =3D <0xffffffff>;
>
> What does irq-src mean?

That is the bitmask for the interrupts populated on each vic.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 VIC1:vic1@f2100000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xf2100000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf4010000>;
>
> ditto
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&VIC0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq-src =3D <0xffffffff>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,vic";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 VIC2:vic2@f2200000{
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xf2200000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf4020000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&VIC1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq-src =3D <0xffffffff>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,vic";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 VIC3:vic3@f2300000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xf2300000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf4030000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&VIC2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq-src =3D <0xffffffff>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,vic";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart@0xe2900000 {
>
> Use generic name 'serial' instead of 'uart'. =A0Drop the '0x'.
>
> So, this should be: serial@e2900000. =A0Ditto for the rest of the uart
> nodes.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2900000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf5000000>;
>
> remove virtual-reg
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <10>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&VIC1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ua=
rt","samsung,s5pv210-uart_sh";
>
> Use 's3c2410-uart' instead of 's3c-uart'. =A0Don't use the underscore
> '_' character in compatible values. =A0Only claim compatibility with an
> older part if there already is a binding documented for the older
> part. =A0Ditto for the rest of the uart nodes.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart@0xe2900400 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2900400 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf5000400>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <11>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&VIC1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ua=
rt","samsung,s5pv210-uart_sh";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart@0xe2900800 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2900800 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf5000800>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <12>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&VIC1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ua=
rt","samsung,s5pv210-uart_sh";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart@0xe2900c00 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2900c00 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf5000c00>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <13>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&VIC1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ua=
rt","samsung,s5pv210-uart_sh";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 timer0@e2500000 {
>
> Should be simply 'timer@e2500000'. =A0It should not be called 'timer0'.
> Same goes for timers 1 through 4.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2500000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf0300000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <21 11>;
>
> Just to double check; this property says that the timer has two
> interrupt output lines. =A0Correct?

No . Thats a mistake . Timer has only one irq line. Will modify.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ti=
mer","samsung,s5p-timer";
>
> Same comments for timers as made for uart compatible property.
>
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 timer1@e2500000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2500000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf0300000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <22 12>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ti=
mer","samsung,s5p-timer";
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 timer2@e2500000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2500000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf0300000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <23 13>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ti=
mer","samsung,s5p-timer";
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 timer3@e2500000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2500000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf0300000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <24 14>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ti=
mer","samsung,s5p-timer";
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 timer4@e2600000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe2600000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf5200000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <25 15>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-ti=
mer","samsung,s5p-timer";
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 SROM@e2600000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe8000000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 virtual-reg =3D <0xf5100000>;
>
> What is 'SROM'? =A0This node is missing a compatible property.

SROM is the controller for NOR Flash,SRAM,PROM memory. The physical-virtual
address mapping  are statically setup by the kernel during initial
bootup. This is done
in the devicemaps_init() called from paging_init().

The device tree is flattened later in the bootup sequence. So it is
not possible to retrieve
properties for statically mapped devices from the device tree.


Regards
Shaju



>
> g.
>

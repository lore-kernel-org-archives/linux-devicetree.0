From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: s5pv310-dt: Add a basic dts file for SMDKV310
	machine
Date: Thu, 17 Feb 2011 09:54:20 -0700
Message-ID: <AANLkTim6jfnscgbuL33ae3x_NSsVchXXkK7=DmpefMhD@mail.gmail.com>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
	<1297514825-10345-3-git-send-email-thomas.abraham@linaro.org>
	<20110217003434.GE14124@angua.secretlab.ca>
	<AANLkTim2N75+=OWOdNMYKh5pnHNEms28G75PDvgqDW6p@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <AANLkTim2N75+=OWOdNMYKh5pnHNEms28G75PDvgqDW6p-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas, replies below...

On Thu, Feb 17, 2011 at 6:55 AM, Thomas Abraham
<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Grant,
>
> On 17 February 2011 06:04, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> On Sat, Feb 12, 2011 at 06:17:00PM +0530, Thomas Abraham wrote:
>>> This patch adds a basic dts file for Samsung's SMDKV310 board which
>>> is based on the s5pv310 machine.
>>>
>>> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Structure looks good. =A0Some comments below, but it is getting close.
>>
>>> ---
>>> =A0arch/arm/mach-s5pv310/mach-smdkv310.dts | =A0 78 +++++++++++++++++++=
++++++++++++
>>> =A01 files changed, 78 insertions(+), 0 deletions(-)
>>> =A0create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts
>>>
>>> diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.dts b/arch/arm/mach-s5=
pv310/mach-smdkv310.dts
>>> new file mode 100755
>>> index 0000000..75aa76d
>>> --- /dev/null
>>> +++ b/arch/arm/mach-s5pv310/mach-smdkv310.dts
>>> @@ -0,0 +1,78 @@
>>> +/dts-v1/;
>>> +
>>> +/ {
>>> + =A0 =A0 model =3D "smdkv310";
>
> <snip>
>
>>> +
>>> + =A0 =A0 chosen {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "root=3D/dev/ram0 rw ramdisk=3D8=
192 initrd=3D0x41000000,8M console=3DttySAC1,115200 init=3D/linuxrc";
>>
>> initrd address should be passed via the linux,initrd-start and
>> linux,initrd-end properties. =A0U-Boot already knows how to do this so
>> it shouldn't be encoded in the kernel parameters list.
>
> Ok. "linux,initrd-start" and "linux,initrd-end" properties will be
> added in chosen node and initrd parameters from bootargs removed as
> below.
>
> chosen {
> =A0 =A0 =A0 =A0bootargs =3D "root=3D/dev/ram0 console=3DttySAC1,115200 in=
it=3D/linuxrc";
> =A0 =A0 =A0 =A0linux,initrd-start=3D<0x41000000>;
> =A0 =A0 =A0 =A0linux,initrd-end=3D<0x40800000>;
> =A0 =A0} ;

If you're using u-boot, you shouldn't need to add these properties at
all.  U-Boot will add them for you when you use the command "bootm
<kernel-addr> <initrd-addr> <dtb-addr>"

>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 console-defaults =3D <0x3c5 0x3 0x111>;
>>
>> Drop console-defaults. =A0The configuration should be encoded in the
>> uart's device tree node.
>
> The stage at which console_init is called, the code that initializes
> the uart module for console operation does not have access to the uart
> device tree node. Hence, the console-default register values are put
> into the chosen node which is easier to access. If this not the right
> approach, maybe the uart device tree node will have to be looked up by
> using "for_each_compatible_node" or similar. Would you suggest using
> for_each_compatible_node in this case.

Yes, you need to look up the node.  It actually isn't very hard to do.
 for_each_compatible_node() is a fine approach.

>
>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 xtal-frequency =3D <24000000>;
>>
>> It looks like this is misplaced. =A0If this is the primary frequency for
>> the system, then it should go either in the root node, =A0the soc node,
>> or the cpu nodes.
>
> This is the frequency of the crystal clock from which all the SoC
> internal clocks are derived. The crystal clock frequency depends on
> the board. So it was put into the chosen node. Since this is board
> specific, this is added in the chosen node.

The chosen node is for reflecting software configuration (kernel
parameters, handle to console node, initrd, etc), not hardware
configuration.  System clock definitely falls in the category of
hardware configuration.  The SoC or the root node would be an okay
place to put it.  The chosen node is definitely the wrong place.

g.

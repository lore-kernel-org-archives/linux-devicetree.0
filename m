From: York Sun <york.sun@nxp.com>
Subject: Re: [PATCH RFC 1/2] drivers/edac: Add L1 and L2 error detection for
 A53 and A57
Date: Thu, 15 Mar 2018 15:15:20 +0000
Message-ID: <VI1PR04MB20780A707157E71922BD72BA9AD00@VI1PR04MB2078.eurprd04.prod.outlook.com>
References: <1521073067-24348-1-git-send-email-york.sun@nxp.com>
 <5AAA7640.3010506@arm.com>
Reply-To: York Sun <york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 03/15/2018 06:36 AM, James Morse wrote:=0A=
> Hi York,=0A=
> =0A=
> You have a DT binding in here, please CC the devicetree list. You're touc=
hing=0A=
> code under arch/arm64, so you need the arm list too. get_maintainer.pl wi=
ll take=0A=
> your patch and give you the list of which lists and maintainers to CC.=0A=
> =0A=
> (I've added those lists, the full patch is here:=0A=
=0A=
Thanks for doing this.=0A=
=0A=
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatc=
hwork.kernel.org%2Fpatch%2F10283783%2F&data=3D02%7C01%7Cyork.sun%40nxp.com%=
7C794bff898fae4046bb9d08d58a79c482%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7=
C0%7C636567177956904165&sdata=3DxWmuUtS9dk7PSq1R11L%2F4vpoztnXATAPgtmiqytpn=
As%3D&reserved=3D0=0A=
> )=0A=
> =0A=
> Some comments below, I haven't looked in to edac or the manuals for A53/A=
57.=0A=
> =0A=
> On 15/03/18 00:17, York Sun wrote:=0A=
>> Add error detection for A53 and A57 cores. Hardware error injection=0A=
>> is supported on A53. Software error injection is supported on both.=0A=
>> For hardware error injection on A53 to work, proper access to=0A=
>> L2ACTLR_EL1, CPUACTLR_EL1 needs to be granted by EL3 firmware. This=0A=
>> is done by making an SMC call in the driver. Failure to enable access=0A=
>> disables hardware error injection. For error interrupt to work,=0A=
>> another SMC call enables access to L2ECTLR_EL1. Failure to enable=0A=
>> access disables interrupt for error reporting.=0A=
> =0A=
> This is tricky as there are shipped systems out there without these SMC c=
alls.=0A=
> They need to be discovered in some way. We can't even assume firmware has=
 PSCI,=0A=
> it has to be discovered via APCI/DT.=0A=
=0A=
Using the return values from SMC calls, we can detect if such calls=0A=
exist. Without these SMC calls, hardware error injection is removed from=0A=
/sys interface for A53. A57 doesn't have this feature anyway. Similarly,=0A=
without these SMC calls, interrupt is not used so the driver only works=0A=
in polling mode.=0A=
=0A=
> =0A=
> I think it will be cleaner for the presence of this device/compatible to=
=0A=
> indicate that the registers are enabled for the normal-world, instead of =
having=0A=
> the OS try to call into firmware to enable it.=0A=
=0A=
I don't disagree. Doing this requires updating device tree. For my case=0A=
using U-Boot, this needs to sync with U-Boot. I would prefer not to. I=0A=
can imaging this would be the same for UEFI.=0A=
=0A=
> =0A=
> =0A=
>> Signed-off-by: York Sun <york.sun@nxp.com>=0A=
>> ---=0A=
>>  .../devicetree/bindings/edac/cortex-arm64-edac.txt |  37 +=0A=
>>  arch/arm64/include/asm/cacheflush.h                |   1 +=0A=
>>  arch/arm64/mm/cache.S                              |  35 +=0A=
>>  drivers/edac/Kconfig                               |   6 +=0A=
>>  drivers/edac/Makefile                              |   1 +=0A=
>>  drivers/edac/cortex_arm64_l1_l2.c                  | 741 ++++++++++++++=
+++++++=0A=
>>  drivers/edac/cortex_arm64_l1_l2.h                  |  55 ++=0A=
>>  7 files changed, 876 insertions(+)=0A=
>>  create mode 100644 Documentation/devicetree/bindings/edac/cortex-arm64-=
edac.txt=0A=
>>  create mode 100644 drivers/edac/cortex_arm64_l1_l2.c=0A=
>>  create mode 100644 drivers/edac/cortex_arm64_l1_l2.h=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/edac/cortex-arm64-edac.tx=
t b/Documentation/devicetree/bindings/edac/cortex-arm64-edac.txt=0A=
>> new file mode 100644=0A=
>> index 0000000..74a1c2f=0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/edac/cortex-arm64-edac.txt=0A=
>> @@ -0,0 +1,37 @@=0A=
>> +ARM Cortex A57 and A53 L1/L2 cache error reporting=0A=
>> +=0A=
>> +CPU Memory Error Syndrome and L2 Memory Error Syndrome registers can be=
 used=0A=
>> +for checking L1 and L2 memory errors. However, only A53 supports double=
-bit=0A=
>> +error injection to L1 and L2 memory. This driver uses the hardware erro=
r=0A=
>> +injection when available, but also provides a way to inject errors by=
=0A=
>> +software. Both A53 and A57 supports interrupt when multi-bit errors hap=
pen.=0A=
> =0A=
>> +To use hardware error injection and the interrupt, proper access needs =
to be=0A=
>> +granted in ACTLR_EL3 (and/or ACTLR_EL2) register by EL3 firmware SMC ca=
ll.=0A=
> =0A=
> How can Linux know whether firmware toggled these bits? How can it know i=
f it=0A=
> needs to make an SMC call to do the work?=0A=
=0A=
It is done in probe function in this driver.=0A=
=0A=
> =0A=
> This looks like platform policy, I'm not sure how this gets described...=
=0A=
> =0A=
> =0A=
>> +Correctable errors do not trigger such interrupt. This driver uses dyna=
mic=0A=
>> +polling internal to check for errors. The more errors detected, the mor=
e=0A=
>> +frequently it polls. Combining with interrupt, this driver can detect=
=0A=
>> +correctable and uncorrectable errors. However, if the uncorrectable err=
ors=0A=
>> +cause system abort exception, this drivr is not able to report errors i=
n time.=0A=
>> +=0A=
>> +The following section describes the Cortex A57/A53 EDAC DT node binding=
.=0A=
>> +=0A=
>> +Required properties:=0A=
>> +- compatible: Should be "arm,cortex-a57-edac" or "arm,cortex-a53-edac"=
=0A=
>> +- cpus: Should be a list of compatible cores=0A=
>> +=0A=
>> +Optional properties:=0A=
>> +- interrupts: Interrupt number if supported=0A=
>> +=0A=
>> +Example:=0A=
>> +	edac {=0A=
>> +		compatible =3D "arm,cortex-a53-edac";=0A=
>> +		cpus =3D <&cpu0>,=0A=
>> +		       <&cpu1>,=0A=
>> +		       <&cpu2>,=0A=
>> +		       <&cpu3>;=0A=
>> +		interrupts =3D <0 108 0x4>;=0A=
>> +=0A=
>> +	};=0A=
>> +=0A=
> =0A=
>> diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/as=
m/cacheflush.h=0A=
>> index 76d1cc8..f1cd090 100644=0A=
>> --- a/arch/arm64/include/asm/cacheflush.h=0A=
>> +++ b/arch/arm64/include/asm/cacheflush.h=0A=
>> @@ -73,6 +73,7 @@ extern void __clean_dcache_area_pop(void *addr, size_t=
 len);=0A=
>>  extern void __clean_dcache_area_pou(void *addr, size_t len);=0A=
>>  extern long __flush_cache_user_range(unsigned long start, unsigned long=
 end);=0A=
>>  extern void sync_icache_aliases(void *kaddr, unsigned long len);=0A=
>> +extern void __flush_l1_dcache_way(phys_addr_t ptr);=0A=
>>  =0A=
>>  static inline void flush_cache_mm(struct mm_struct *mm)=0A=
>>  {=0A=
> =0A=
>> diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S=0A=
>> index 7f1dbe9..5e65c20 100644=0A=
>> --- a/arch/arm64/mm/cache.S=0A=
>> +++ b/arch/arm64/mm/cache.S=0A=
>> @@ -221,3 +221,38 @@ ENTRY(__dma_unmap_area)=0A=
>>  	b.ne	__dma_inv_area=0A=
>>  	ret=0A=
>>  ENDPIPROC(__dma_unmap_area)=0A=
>> +=0A=
>> +/*=0A=
>> + *	Flush L1 dcache by way, using physical address to find sets=0A=
>> + *=0A=
>> + *	__flush_l1_dcache_way(ptr)=0A=
>> + *	- ptr	- physical address to be flushed=0A=
>> + */=0A=
> =0A=
> We don't have set/way maintenance in the kernel because its impossible to=
 do=0A=
> correctly outside EL3's CPU power-on code.=0A=
> =0A=
> The ARM-ARM has a half page 'note' explaining the issues, under 'Performi=
ng=0A=
> cache maintenance instructions' in section "D3.4.8 A64 Cache maintenance=
=0A=
> instructions". If you have DDI0487B.b, its on Page D3-2020.=0A=
> =0A=
> These may also help:=0A=
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkml=
.org%2Flkml%2F2016%2F3%2F21%2F190&data=3D02%7C01%7Cyork.sun%40nxp.com%7C794=
bff898fae4046bb9d08d58a79c482%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C=
636567177956904165&sdata=3DcGfumC%2BDk6y5XVnkH3orgVYovhT1KHPmsXfkKo6veIE%3D=
&reserved=3D0=0A=
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Feven=
ts.static.linuxfound.org%2Fsites%2Fevents%2Ffiles%2Fslides%2Fslides_17.pdf&=
data=3D02%7C01%7Cyork.sun%40nxp.com%7C794bff898fae4046bb9d08d58a79c482%7C68=
6ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636567177956904165&sdata=3Dz0HTGOf=
ZeuhY9YtFFAm4rBB9v%2BsapRHOZX2TPPZEjus%3D&reserved=3D0=0A=
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
linux.com%2Fnews%2Ftaming-chaos-modern-caches&data=3D02%7C01%7Cyork.sun%40n=
xp.com%7C794bff898fae4046bb9d08d58a79c482%7C686ea1d3bc2b4c6fa92cd99c5c30163=
5%7C0%7C0%7C636567177956904165&sdata=3DKZOY2ESFrl55ojinzG7eiPzwFHLTBx1VJvGZ=
3hdchiE%3D&reserved=3D0=0A=
> =0A=
> Why do you need to do this? There is no way to guarantee an address isn't=
 in the=0A=
> cache.=0A=
> =0A=
=0A=
It was suggested by ARM support. The purpose is to flush L1 cache with=0A=
concerned address and cause a write to L2 cache, which in turn injects=0A=
the error. The whole idea is to safely inject uncorrectable error(s)=0A=
without corrupt the system.=0A=
=0A=
I am going to stop here since I received Mark's comment in another=0A=
email. Your comments are very valuable and very much appreciated.=0A=
=0A=
York=0A=

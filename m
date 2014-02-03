Return-Path: <linaro-kernel-bounces@lists.linaro.org>
Date: Mon, 3 Feb 2014 13:21:46 -0600
From: kodiak furr <boxerapp@aol.com>
Message-ID: <DB8F56A9-FD63-4361-A17E-2B3AF55ECCB3@aol.com>
In-Reply-To: <20140203191837.GC4889@e106497-lin.cambridge.arm.com>
References: <20140203191837.GC4889@e106497-lin.cambridge.arm.com>
Subject: Re: [PATCH] arm64: Add architecture support for PCI
MIME-Version: 1.0
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-kernel>,
 <mailto:linaro-kernel-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-kernel>
List-Post: <mailto:linaro-kernel@lists.linaro.org>
List-Help: <mailto:linaro-kernel-request@lists.linaro.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-kernel>,
 <mailto:linaro-kernel-request@lists.linaro.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7143198835380267376=="
Errors-To: linaro-kernel-bounces@lists.linaro.org
Sender: linaro-kernel-bounces@lists.linaro.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--===============7143198835380267376==
Content-Type: multipart/alternative; boundary="52efec4a_327b23c6_a1"

--52efec4a_327b23c6_a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

kodiak furr liked your message with Boxer. On =46ebruary 3, 2014 at 1:18:=
38 PM CST, Liviu Dudau  wrote:On Mon, =46eb 03, 2014 at 06:58:56PM +0000,=
 Arnd Bergmann wrote:> On Monday 03 =46ebruary 2014 18:43:48 Liviu Dudau =
wrote:> > diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/a=
sm/io.h> > index 4cc813e..ce5bad2 100644> > --- a/arch/arm64/include/asm/=
io.h> > +++ b/arch/arm64/include/asm/io.h> > =40=40 -120,9 +120,13 =40=40=
 static inline u64 =5F=5Fraw=5Freadq(const volatile void =5F=5Fiomem *add=
r)> > /*> > * I/O port access primitives.> > */> > +=23define arch=5Fhas=5F=
dev=5Fport() (0)> > Why not=3FMaybe I got it the wrong way around, but th=
e comment in include/linux/io.h says:/* * Some systems do not have legacy=
 ISA devices. * /dev/port is not a valid interface on these systems. * So=
 for those archs,  should define the following symbol. */So ... defining =
it should mean no legacy ISA devices, right=3F> > > =23define IO=5FSPACE=5F=
LIMIT 0xffff> > You probably want to increase this a bit, to allow multip=
le host bridges> to have their own I/O space.OK, but to what size=3F> > >=
 =23define PCI=5FIOBASE ((void =5F=5Fiomem *)(MODULES=5FVADDR - SZ=5F2M))=
> > And modify this location: There is no particular reason to have the I=
/O space> mapped exactly 2MB below the loadable modules, as virtual addre=
ss space is> essentially free.Will talk with Catalin about where to place=
 this.> > > +=23define ioport=5Fmap(port, nr) (PCI=5FIOBASE + ((port) & I=
O=5FSPACE=5FLIMIT))> > +=23define ioport=5Funmap(addr)> > inline function=
s=3FWill do, thanks=21> > > static inline u8 inb(unsigned long addr)> > =7B=
> > return readb(addr + PCI=5FIOBASE);> > diff --git a/arch/arm64/include=
/asm/pci.h b/arch/arm64/include/asm/pci.h> > new file mode 100644> > inde=
x 0000000..dd084a3> > --- /dev/null> > +++ b/arch/arm64/include/asm/pci.h=
> > =40=40 -0,0 +1,35 =40=40> > +=23ifndef =5F=5FASM=5FPCI=5FH> > +=23def=
ine =5F=5FASM=5FPCI=5FH> > +=23ifdef =5F=5FKERNEL=5F=5F> > +> > +=23inclu=
de > > +=23include > > +=23include > > +> > +=23include > > +=23include >=
 > +=23include > > +> > +=23define PCIBIOS=5FMIN=5FIO 0> > +=23define PCI=
BIOS=5FMIN=5FMEM 0> > PCIBIOS=5FMIN=5FIO is normally set to 0x1000, to st=
ay out of the ISA range.:) No ISA support=21 (Die ISA, die=21=21) > > > d=
iff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c> > new file=
 mode 100644> > index 0000000..7b652cf> > --- /dev/null> > +++ b/arch/arm=
64/kernel/pci.c> > =40=40 -0,0 +1,112 =40=40> > None of this looks really=
 arm64 specific, nor should it be. I think> we should try a little harder=
 to move this as a default implementation> into common code, even if we s=
tart out by having all architectures> override it.Agree. This is the R=46=
C version. I didn't dare to post a patch with fixesfor all architectures.=
 :)> > > +int pci=5Fioremap=5Fio(unsigned int offset, phys=5Faddr=5Ft phy=
s=5Faddr)> > +=7B> > + BUG=5FON(offset + SZ=5F64K - 1 > IO=5FSPACE=5FLIMI=
T);> > +> > + return ioremap=5Fpage=5Frange((unsigned long)PCI=5FIOBASE +=
 offset,> > + (unsigned long)PCI=5FIOBASE + offset + SZ=5F64K,> > + phys=5F=
addr,> > + =5F=5Fpgprot(PROT=5FDEVICE=5FnGnRE));> > +=7D> > Not sure if w=
e want to treat this one as architecture specific though.> It certainly w=
on't be portable to x86, but it could be shared with> a couple of others.=
 We may also want to redesign the interface.> I've been thinking we could=
 make this function allocate space in the> Linux virtual I/O space apertu=
re, and pass two resources into it> (physical I/O aperture and bus I/O ra=
nge), and get the actual> io=5Foffset as the return value, or a negative =
error number.Not sure I completely follow your idea.> > That way, you cou=
ld have an arbitrary number of host bridges in the> system and each one g=
ets a share of the virtual aperture until> it's full.One still needs to f=
ix the pci=5Frequest=5Fregion use that checks againstioport=5Fresource. B=
ut it is an interesting idea.> > Arnd> > Thanks for reviewing this patch=21=
Liviu--      
--52efec4a_327b23c6_a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body><div>kodiak furr liked your message with <a href=3D=22http://=
ad.apps.fm/x3NHJParL2cT9cQ9WcgT1xM8G1T=5FLUvoWYXredpuoYBLq62ptJqsuhqD23uA=
mN=5FARL=5FcKzXIyDOjqo=5F2b16qX20uaphn=46WU7uPwUiYWuOAT=46UAGQB7Cox3TWT3Z=
KjzWyP=46IlhepnEZcRklQejqpibw=22>Boxer</a>.</div><br/><br/><div><div clas=
s=3D=22quote=22>On =46ebruary 3, 2014 at 1:18:38 PM CST, Liviu Dudau <Liv=
iu.Dudau=40arm.com> wrote:<br/><blockquote type=3D=22cite=22 style=3D=22b=
order-left-style:solid;border-width:1px;margin-left:0px;padding-left:10px=
;=22>On Mon, =46eb 03, 2014 at 06:58:56PM +0000, Arnd Bergmann wrote:<br =
/>> On Monday 03 =46ebruary 2014 18:43:48 Liviu Dudau wrote:<br />> > dif=
f --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h<br />=
> > index 4cc813e..ce5bad2 100644<br />> > --- a/arch/arm64/include/asm/i=
o.h<br />> > +++ b/arch/arm64/include/asm/io.h<br />> > =40=40 -120,9 +12=
0,13 =40=40 static inline u64 =5F=5Fraw=5Freadq(const volatile void =5F=5F=
iomem *addr)<br />> >  /*<br />> >   *  I/O port access primitives.<br />=
> >   */<br />> > +=23define arch=5Fhas=5Fdev=5Fport()	(0)<br />> <br />>=
 Why not=3F<br /><br />Maybe I got it the wrong way around, but the comme=
nt in include/linux/io.h says:<br /><br />/*<br /> * Some systems do not =
have legacy ISA devices.<br /> * /dev/port is not a valid interface on th=
ese systems.<br /> * So for those archs, <asm/io.h> should define the fol=
lowing symbol.<br /> */<br /><br />So ... defining it should mean no lega=
cy ISA devices, right=3F<br /><br />> <br />> >  =23define IO=5FSPACE=5FL=
IMIT		0xffff<br />> <br />> You probably want to increase this a bit, to =
allow multiple host bridges<br />> to have their own I/O space.<br /><br =
/>OK, but to what size=3F<br /><br />> <br />> >  =23define PCI=5FIOBASE	=
	((void =5F=5Fiomem *)(MODULES=5FVADDR - SZ=5F2M))<br />> <br />> And mod=
ify this location: There is no particular reason to have the I/O space<br=
 />> mapped exactly 2MB below the loadable modules, as virtual address sp=
ace is<br />> essentially free.<br /><br />Will talk with Catalin about w=
here to place this.<br /><br />> <br />> > +=23define ioport=5Fmap(port, =
nr)	(PCI=5FIOBASE + ((port) & IO=5FSPACE=5FLIMIT))<br />> > +=23define io=
port=5Funmap(addr)<br />> <br />> inline functions=3F<br /><br />Will do,=
 thanks=21<br /><br />> <br />> >  static inline u8 inb(unsigned long add=
r)<br />> >  =7B<br />> >  	return readb(addr + PCI=5FIOBASE);<br />> > d=
iff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h<b=
r />> > new file mode 100644<br />> > index 0000000..dd084a3<br />> > ---=
 /dev/null<br />> > +++ b/arch/arm64/include/asm/pci.h<br />> > =40=40 -0=
,0 +1,35 =40=40<br />> > +=23ifndef =5F=5FASM=5FPCI=5FH<br />> > +=23defi=
ne =5F=5FASM=5FPCI=5FH<br />> > +=23ifdef =5F=5FKERNEL=5F=5F<br />> > +<b=
r />> > +=23include <linux/types.h><br />> > +=23include <linux/slab.h><b=
r />> > +=23include <linux/dma-mapping.h><br />> > +<br />> > +=23include=
 <asm/io.h><br />> > +=23include <asm-generic/pci-bridge.h><br />> > +=23=
include <asm-generic/pci-dma-compat.h><br />> > +<br />> > +=23define PCI=
BIOS=5FMIN=5FIO		0<br />> > +=23define PCIBIOS=5FMIN=5FMEM		0<br />> <br =
/>> PCIBIOS=5FMIN=5FIO is normally set to 0x1000, to stay out of the ISA =
range.<br /><br />:) No ISA support=21 (Die ISA, die=21=21) <br /><br />>=
 <br />> > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c=
<br />> > new file mode 100644<br />> > index 0000000..7b652cf<br />> > -=
-- /dev/null<br />> > +++ b/arch/arm64/kernel/pci.c<br />> > =40=40 -0,0 =
+1,112 =40=40<br />> <br />> None of this looks really arm64 specific, no=
r should it be. I think<br />> we should try a little harder to move this=
 as a default implementation<br />> into common code, even if we start ou=
t by having all architectures<br />> override it.<br /><br />Agree. This =
is the R=46C version. I didn't dare to post a patch with fixes<br />for a=
ll architectures. :)<br /><br />> <br />> > +int pci=5Fioremap=5Fio(unsig=
ned int offset, phys=5Faddr=5Ft phys=5Faddr)<br />> > +=7B<br />> > +	BUG=
=5FON(offset + SZ=5F64K - 1 > IO=5FSPACE=5FLIMIT);<br />> > +<br />> > +	=
return ioremap=5Fpage=5Frange((unsigned long)PCI=5FIOBASE + offset,<br />=
> > +				(unsigned long)PCI=5FIOBASE + offset + SZ=5F64K,<br />> > +				p=
hys=5Faddr,<br />> > +				=5F=5Fpgprot(PROT=5FDEVICE=5FnGnRE));<br />> > =
+=7D<br />> <br />> Not sure if we want to treat this one as architecture=
 specific though.<br />> It certainly won't be portable to x86, but it co=
uld be shared with<br />> a couple of others. We may also want to redesig=
n the interface.<br />> I've been thinking we could make this function al=
locate space in the<br />> Linux virtual I/O space aperture, and pass two=
 resources into it<br />> (physical I/O aperture and bus I/O range), and =
get the actual<br />> io=5Foffset as the return value, or a negative erro=
r number.<br /><br />Not sure I completely follow your idea.<br /><br />>=
 <br />> That way, you could have an arbitrary number of host bridges in =
the<br />> system and each one gets a share of the virtual aperture until=
<br />> it's full.<br /><br />One still needs to fix the pci=5Frequest=5F=
region use that checks against<br />ioport=5Fresource. But it is an inter=
esting idea.<br /><br />> <br />> 	Arnd<br />> <br />> <br /><br />Thanks=
 for reviewing this patch=21<br /><br />Liviu<br /><br />-- <br /></block=
quote></div></div></body></html>
--52efec4a_327b23c6_a1--



--===============7143198835380267376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-kernel mailing list
linaro-kernel@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-kernel

--===============7143198835380267376==--

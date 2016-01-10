From: Rolland Chau <zourongrong@gmail.com>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Sun, 10 Jan 2016 17:29:58 +0800
Message-ID: <56922496.3080402@gmail.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <6384244.Uhpjfgly6O@wuerfel> <568BB035.1050801@huawei.com>
 <2550495.K9prJVsVEi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2550495.K9prJVsVEi@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Rongrong Zou <zourongrong@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Corey Minyard <minyard@acm.org>, gregkh@linuxfoundation.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linuxarm@huawei.com, benh@kernel.crashing.org, liviu.dudau@arm.com
List-Id: devicetree@vger.kernel.org

On 2016/1/5 20:19, Arnd Bergmann wrote:
> On Tuesday 05 January 2016 19:59:49 Rongrong Zou wrote:
>> =E5=9C=A8 2016/1/5 0:34, Arnd Bergmann =E5=86=99=E9=81=93:
>>> On Tuesday 05 January 2016 00:04:19 Rongrong Zou wrote:
>>>> =E5=9C=A8 2016/1/4 19:13, Arnd Bergmann =E5=86=99=E9=81=93:
>>>>> On Sunday 03 January 2016 20:24:14 Rongrong Zou wrote:
>>>>>> =E5=9C=A8 2015/12/31 23:00, Rongrong Zou =E5=86=99=E9=81=93:
>>>> Ranges property can set empty, but this means 1:1 translation. the=
 I/O
>>>> port range is translated to MMIO address 0x00000001 00000000 to
>>>> 0x00000001 00000004, it looks wrong else. I wonder if anyone get l=
egacy
>>>> I/O port resource from dts.
>>>
>>> As I said, nothing should really require the ranges property here, =
unless
>>> you have a valid IORESOURCE_MEM translation. The code that requires
>>> the ranges to be present is wrong.
>>>
>>
>> I think the openfirmware(DT) do not support for those unmapped I/O p=
orts, because I
>> must get resource by calling of_address_to_resource(), which have to=
 call
>> pci_address_to_pio() when resource type is IORESOURCE_IO. I'm sorry =
I have no
>> better idea for this now. Maybe liviu can give me some opinions.
>
> I think on x86 it works (or used to work, few people use open firmwar=
e on
> x86 these days, and it may be broken), and the pci_address_to_pio() c=
all
> behaves differently when PCI_IOBASE is set. x86 never maps I/O ports =
into
> memory mapped I/O addresses, they have their own way of accessing the=
m
> just like your platform.
>
>> /**
>>    * of_address_to_resource - Translate device tree address and retu=
rn as resource
>>    *
>>    * Note that if your address is a PIO address, the conversion will=
 fail if
>>    * the physical address can't be internally converted to an IO tok=
en with
>>    * pci_address_to_pio(), that is because it's either called to ear=
ly or it
>>    * can't be matched to any host bridge IO space
>>    */
>> int of_address_to_resource(struct device_node *dev, int index,
>> 			   struct resource *r)
>
> The problem here seems to be that the code assumes that either the I/=
O ports
> are always mapped or they are never mapped (no PCI_IOBASE). We need t=
o extend
> it because now we can have the combination of the two.


Arnd , please take a look at the new solution when you have a moment,th=
anks.
I modify the "drivers/of/address.c" to address the problem above.

There are some assumptions:

1) ISA(LPC) Like bus must be scanned before PCI.
2) a property "unmapped-size" is introduced to ISA bus DT config, it me=
ans the address
  range of the bus. if bus-A have a port range(0-99), bus-B have a port=
 range(0-199), then
the cpu port range (0-99) is reserved for bus-A and cpu port range is r=
eserved for bus-B.
3) It it
---
  drivers/of/address.c | 76 +++++++++++++++++++++++++++++++++++++++++++=
++++-----
  1 file changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 9582c57..d3c71e5 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -682,8 +682,16 @@ struct io_range {

  static LIST_HEAD(io_range_list);
  static DEFINE_SPINLOCK(io_range_lock);
+phy_addr_t pci_pio_start =3D 0;
+EXPORT_SYMBOL(pci_pio_start)
  #endif

+int isa_register_unmapped_io_range(resource_size_t size)
+{
+       pci_pio_start +=3D size;
+}
+
+
  /*
   * Record the PCI IO range (expressed as CPU physical address + size)=
=2E
   * Return a negative value if an error has occured, zero otherwise
@@ -694,7 +702,7 @@ int __weak pci_register_io_range(phys_addr_t addr, =
resource_size_t size)

  #ifdef PCI_IOBASE
         struct io_range *range;
-       resource_size_t allocated_size =3D 0;
+       resource_size_t allocated_size =3D pci_pio_start;

         /* check if the range hasn't been previously recorded */
         spin_lock(&io_range_lock);
@@ -743,7 +751,7 @@ phys_addr_t pci_pio_to_address(unsigned long pio)

  #ifdef PCI_IOBASE
         struct io_range *range;
-       resource_size_t allocated_size =3D 0;
+       resource_size_t allocated_size =3D pci_pio_start;

         if (pio > IO_SPACE_LIMIT)
                 return address;
@@ -766,7 +774,7 @@ unsigned long __weak pci_address_to_pio(phys_addr_t=
 address)
  {
  #ifdef PCI_IOBASE
         struct io_range *res;
-       resource_size_t offset =3D 0;
+       resource_size_t offset =3D pci_pio_start;
         unsigned long addr =3D -1;

         spin_lock(&io_range_lock);
@@ -788,21 +796,77 @@ unsigned long __weak pci_address_to_pio(phys_addr=
_t address)
  #endif
  }

+static u64 of_get_unmapped_pio(struct device_node *dev, const __be32 *=
inaddr)
+{
+       struct device_node *np, *parent =3D NULL;
+       struct of_bus * bus, *pbus;
+       struct property *p_property;
+       int rlen;
+       u32 size =3D 0;
+       u32 port_base =3D 0;
+
+       /*IF NOT I/O port*/
+       if(*(in_addr) !=3D 0x01)
+               return OF_BAD_ADDR;
+       else
+               *in_addr =3D 0;
+
+       parent =3D of_get_parent(dev);
+       if(parent =3D=3D NULL)
+               return result;
+       bus =3D of_match_bus(parent);
+       if(!strcmp(bus->name, "isa")) {
+               p_property =3D of_find_property(parent, "ranges", &rlen=
);
+               /*no ranges property, this is a non-bridged isa bus, an=
d the port on it is unmapped*/
+               if(p_property =3D=3D NULL) {
+                       for_each_node_by_name(np, "isa") {
+                               if((np !=3D parent) &&
+                                  !of_find_property(parent, "ranges", =
&rlen) &&
+                                  !of_property_read_u32(parent, "unmap=
ped-size", &size)) {
+                                       port_base +=3D size;
+                               }
+                               else if (np =3D=3D parent) {
+                                       of_bus_default_translate(in_add=
r + 1, port_base, 1);
+                                       break;
+                               }
+                               else {
+                                       continue;
+                               }
+                       }
+                       return of_read_number(in_addr, 2);
+
+               }
+
+       }
+       return OF_BAD_ADDR;
+}
+
  static int __of_address_to_resource(struct device_node *dev,
                 const __be32 *addrp, u64 size, unsigned int flags,
                 const char *name, struct resource *r)
  {
         u64 taddr;
+       u8 addr_type =3D 0;

         if ((flags & (IORESOURCE_IO | IORESOURCE_MEM)) =3D=3D 0)
                 return -EINVAL;
         taddr =3D of_translate_address(dev, addrp);
-       if (taddr =3D=3D OF_BAD_ADDR)
-               return -EINVAL;
+       if (taddr =3D=3D OF_BAD_ADDR) {
+
+               taddr =3D=3D of_get_unmapped_pio(dev, addrp);
+               if(taddr =3D=3D OF_BAD_ADDR)
+                       return -EINVAL
+               else    /*we get unmapped I/O port successfully*/
+                       addr_type =3D 1;
+       }
+
         memset(r, 0, sizeof(struct resource));
         if (flags & IORESOURCE_IO) {
                 unsigned long port;
-               port =3D pci_address_to_pio(taddr);
+               if(!addr_type)
+                       port =3D pci_address_to_pio(taddr);
+               else
+                       port =3D (unsigned long)taddr;
                 if (port =3D=3D (unsigned long)-1)
                         return -EINVAL;
                 r->start =3D port;
--=20


In bus device probe code
static int lpc_probe(struct platform_device *pdev)
{
	...
	if(ret =3D of_property_read_u32((pdev->dev).of_node, "unmapped-size", =
&io_ranges))
		return ret;
=09
	lpc_dev->bus_size =3D io_ranges;
	isa_register_io_range(io_ranges);
	ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev=
);
	...
=09
	return 0;
}

>
>>>> For ipmi driver, I can get I/O port resource by DMI rather than dt=
s.
>>>
>>> No, the ipmi driver uses the resource that belongs to the platform
>>> device already, you can't rely on DMI data to be present there.
>>
>> Ipmi has a lot of way to be discovered(ACPI, DMI, hardcoded, hot-add=
,
>> openfirmware and a few other), I think we just use one of them, not =
all of them.
>> It depend on vendor's hardware solution actually.
>
> I don't think we should mix multiple methods here: if the bus is desc=
ribed
> in DT, all its children should be there as well. Otherwise you get in=
to problems
> e.g. if you have multiple instances of the LPC bus and the Linux I/O =
addresses
> for one or more of them have an offset to the bus specific addresses.
>
> The bus probe code decides what the Linux I/O port numbers are, but D=
MI
> and other methods have no idea of the mapping. As long as there is on=
ly
> one instance, using the first 0x1000 addresses with a 1:1 mapping sav=
es
> us a bit of trouble, but I'd be worried about relying on that assumpt=
ion
> too much.
>
> 	Arnd
>

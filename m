From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9] arch/powerpc/kernel: Drop unnecessary null test
Date: Tue, 3 Aug 2010 16:00:25 -0600
Message-ID: <AANLkTi=yOJ0Zfsn_h_xWai5O=OPkccMb-hDwKK+dWZwf__30622.8300127716$1280872890$gmane$org@mail.gmail.com>
References: <Pine.LNX.4.64.1008032334420.20393@ask.diku.dk>
	<20100803215137.GU26313@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100803215137.GU26313@bicker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Grant Likely <grant.likely@sec>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 3, 2010 at 3:51 PM, Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Aug 03, 2010 at 11:35:17PM +0200, Julia Lawall wrote:
>> diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci=
_of_scan.c
>> index 6ddb795..62dd363 100644
>> --- a/arch/powerpc/kernel/pci_of_scan.c
>> +++ b/arch/powerpc/kernel/pci_of_scan.c
>> @@ -336,8 +336,7 @@ static void __devinit __of_scan_bus(struct device_no=
de *node,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dev->hdr_type =3D=3D PCI_HEADER_TYPE_BRI=
DGE ||
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev->hdr_type =3D=3D PCI_HEADER_TYPE=
_CARDBUS) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *child =
=3D pci_device_to_OF_node(dev);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dev)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_scan_pci_br=
idge(child, dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_scan_pci_bridge(child, dev);
>
> The intention was probably to check "child" instead of "dev".
> pci_device_to_OF_node() can return NULL. =A0On the other hand the code
> has been this way for a year and no one has complained...

Still, it should be fixed.  It is likely that I'll be generalizing
this code for other architectures in the near future.  I'll spin a
patch.

g.

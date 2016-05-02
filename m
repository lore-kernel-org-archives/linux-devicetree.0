From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH v8 40/45] drivers/of: Split unflatten_dt_node()
Date: Mon, 2 May 2016 12:02:21 +1000
Message-ID: <20160502020221.GA16612@gwshan>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-41-git-send-email-gwshan@linux.vnet.ibm.com>
 <CAL_Jsq++L-D=RD6ZYK=CPnhqcZbhEbxsKk3xT-vK2R=Qe9Z_pg@mail.gmail.com>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq++L-D=RD6ZYK=CPnhqcZbhEbxsKk3xT-vK2R=Qe9Z_pg@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, aik@ozlabs.ru, dja@axtens.net, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 08:30:42AM -0600, Rob Herring wrote:
>On Tue, Feb 16, 2016 at 9:44 PM, Gavin Shan <gwshan@linux.vnet.ibm.com=
> wrote:
>> The function unflatten_dt_node() is called recursively to unflatten
>> device nodes and properties in the FDT blob. It looks complicated
>> and hard to be understood.
>>
>> This splits the function into 3 functions: populate_properties(),
>> populate_node() and unflatten_dt_node(). populate_properties(),
>> which is called by populate_node(), creates properties for the
>> indicated device node. The later one creates the device nodes
>> from FDT blob. populate_node() gets the offset in FDT blob for
>> next device nodes and then calls populate_node(). No logical
>> changes introduced.
>>
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> ---
>>  drivers/of/fdt.c | 249 ++++++++++++++++++++++++++++++++------------=
-----------
>>  1 file changed, 147 insertions(+), 102 deletions(-)
>
>One nit, otherwise:
>
>Acked-by: Rob Herring <robh@kernel.org>
>
>[...]
>
>> +               /* And we process the "ibm,phandle" property
>> +                * used in pSeries dynamic device tree
>> +                * stuff
>> +                */
>> +               if (!strcmp(pname, "ibm,phandle"))
>> +                       np->phandle =3D be32_to_cpup(val);
>> +
>> +               pp->name   =3D (char *)pname;
>> +               pp->length =3D sz;
>> +               pp->value  =3D (__be32 *)val;
>
>This cast should not be needed.
>

It's needed. Otherwise, we will have warning. So I will keep it. I just
went through this one for next revision and sorry for late response.

drivers/of/fdt.c:225:14: warning: assignment discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type
   pp->value  =3D val;
              ^

Thanks,
Gavin

>> +               *pprev     =3D pp;
>> +               pprev      =3D &pp->next;
>> +       }
>

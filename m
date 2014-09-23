From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Documentation regarding attaching OF Selftest testdata
Date: Mon, 22 Sep 2014 18:09:38 -0700
Message-ID: <5420C852.5010905@gmail.com>
References: <1409728589-9019-1-git-send-email-gaurav.minocha.os@gmail.com> <20140908132007.02837C40AE5@trevor.secretlab.ca>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140908132007.02837C40AE5-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/8/2014 6:20 AM, Grant Likely wrote:
> On Wed,  3 Sep 2014 00:16:29 -0700, Gaurav Minocha <gaurav.minocha.os=
@gmail.com> wrote:
>> This patch add a document that explains how the selftest test data
>>  is dynamically attached into the live device tree irrespective
>>  of the machine's architecture.
>>
>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Applied, thanks.
>=20
> Watch out for trailing whitespace. I had to tidy up many lines.

Is it ok to use UTF-8 characters outside the ascii range in Documentati=
on .txt
files?  If not, there are a few below (I'll point out at least a few in=
line).

The characters are all various forms of a quote or apostrophe.

I do not know what the characters in this reply will look like in anyon=
e else's email
client.  In thunderbird, the non-ascii UTF-8 characters in the original=
 patch displayed
properly.  In thunderbird, the same text in Grant's reply, prefixed wit=
h '> ' to indicate
an email reply the non-ascii UTF-8 is mangled.  In thunderbird, if I re=
ply to Grant's
reply, the same mangling occurs.

-Frank


>=20
> g.
>=20
>> ---
>>  Documentation/devicetree/of_selftest.txt |  204 +++++++++++++++++++=
+++++++++++
>>  1 file changed, 204 insertions(+)
>>  create mode 100644 Documentation/devicetree/of_selftest.txt
>>
>> diff --git a/Documentation/devicetree/of_selftest.txt b/Documentatio=
n/devicetree/of_selftest.txt
>> new file mode 100644
>> index 0000000..b1d9250
>> --- /dev/null
>> +++ b/Documentation/devicetree/of_selftest.txt
>> @@ -0,0 +1,204 @@
>> +=EF=BB=BFOpen Firmware Device Tree Selftest
>> +-----------------------------------
>> +
>> +Author: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> +
>> +1. Introduction
>> +
>> +This document explains how the test data required for executing OF =
selftest=20
>> +is attached to the live tree dynamically, independent of the machin=
e's
>> +architecture.=20
>> +
>> +It is recommended to read the following documents before moving ahe=
ad.
>> +
>> +[1] Documentation/devicetree/usage-model.txt
>> +[2] http://www.devicetree.org/Device_Tree_Usage
>> +
>> +OF Selftest has been designed to test the interface (include/linux/=
of.h)=20
>> +provided to device driver developers to fetch the device informatio=
n..etc.=20
>> +from the unflattened device tree data structure. This interface is =
used by=20
>> +most of the device drivers in various use cases.
>> +
>> +
>> +2. Test-data
>> +
>> +The Device Tree Source file (drivers/of/testcase-data/testcases.dts=
) contains=20
>> +the test data required for executing the unit tests automated in=20
>> +drivers/of/selftests.c. Currently, following Device Tree Source Inc=
lude files=20
>> +(.dtsi) are included in testcase.dts:
>> +
>> +drivers/of/testcase-data/tests-interrupts.dtsi
>> +drivers/of/testcase-data/tests-platform.dtsi
>> +drivers/of/testcase-data/tests-phandle.dtsi
>> +drivers/of/testcase-data/tests-match.dtsi
>> +
>> +When the kernel is build with OF_SELFTEST enabled, then the followi=
ng make rule
>> +
>> +$(obj)/%.dtb: $(src)/%.dts FORCE
>> +	$(call if_changed_dep, dtc)
>> +
>> +is used to compile the DT source file (testcase.dts) into a binary =
blob=20
>> +(testcase.dtb), also referred as flattened DT.
>> +
>> +After that, using the following rule the binary blob above is wrapp=
ed as an
>> +assembly file (testcase.dtb.S).
>> +
>> +$(obj)/%.dtb.S: $(obj)/%.dtb
>> +	$(call cmd, dt_S_dtb)
>> +
>> +The assembly file is compiled into an object file (testcase.dtb.o),=
 and is
>> +linked into the kernel image.
>> +
>> +
>> +2.1. Adding the test data
>> +
>> +Un-flattened device tree structure:
>> +
>> +Un-flattened device tree consists of connected device_node(s) in fo=
rm of a tree=20
>> +structure described below.
>> +
>> +// following struct members are used to construct the tree
>> +struct device_node {
>> +    ...
>> +    struct  device_node *parent;
>> +    struct  device_node *child;
>> +    struct  device_node *sibling;
>> +    struct  device_node *allnext;   /* next in list of all nodes */
>> +    ...
>> + };
>> +
>> +Figure 1, describes a generic structure of machine=E2=80=99s un-fla=
ttened device tree=20
>> +considering only child and sibling pointers. There exists another p=
ointer,=20
>> +*parent, that is used to traverse the tree in the reverse direction=
=2E So, at
>> +a particular level the child node and all the sibling nodes will ha=
ve a parent=20
>> +pointer pointing to a common node (e.g. child1, sibling2, sibling3,=
 sibling4=E2=80=99s=20

                                                                       =
         ^^^
                                                                    non=
-ascii UTF-8

>> +parent points to root node) =20
>> +
>> +root (=E2=80=98/=E2=80=99)
          ^^^ ^^^
  non-ascii UTF-8

>> +   |
>> +child1 -> sibling2 -> sibling3 -> sibling4 -> null
>> +   |         |           |           |
>> +   |         |           |          null
>> +   |         |        child31 -> sibling32 -> null
>> +   |         |           |          |
>> +   |         |          null       null
>> +   |      child21 -> sibling22 -> sibling23 -> null
>> +   |         |          |            |
>> +   |        null       null         null
>> +child11 -> sibling12 -> sibling13 -> sibling14 -> null
>> +   |           |           |            |
>> +   |           |           |           null
>> +  null        null       child131 -> null
>> +                           |
>> +                          null
>> +
>> +Figure 1: Generic structure of un-flattened device tree
>> +
>> +
>> +*allnext: it is used to link all the nodes of DT into a list. So, f=
or the
>> + above tree the list would be as follows:
>> +
>> +root->child1->child11->sibling12->sibling13->child131->sibling14->s=
ibling2->
>> +child21->sibling22->sibling23->sibling3->child31->sibling32->siblin=
g4->null
>> +
>> +Before executing OF selftest, it is required to attach the test dat=
a to=20
>> +machine's device tree (if present). So, when selftest_data_add() is=
 called,
>> +at first it reads the flattened device tree data linked into the ke=
rnel image
>> +via the following kernel symbols:
>> +
>> +__dtb_testcases_begin - address marking the start of test data blob=
 =20
>> +__dtb_testcases_end   - address marking the end of test data blob
>> +
>> +Secondly, it calls of_fdt_unflatten_device_tree() to unflatten the =
flattened=20
>> +blob. And finally, if the machine=E2=80=99s device tree (i.e live t=
ree) is present,=20
>> +then it attaches the unflattened test data tree to the live tree, e=
lse it=20
>> +attaches itself as a live device tree.
>> +
>> +attach_node_and_children() uses of_attach_node() to attach the node=
s into the=20
>> +live tree as explained below. To explain the same, the test data tr=
ee described
>> + in Figure 2 is attached to the live tree described in Figure 1.
>> +
>> +root (=E2=80=98/=E2=80=99)
          ^^^ ^^^
  non-ascii UTF-8

>> +    |
>> + testcase-data
>> +    |
>> + test-child0 -> test-sibling1 -> test-sibling2 -> test-sibling3 -> =
null
>> +    |               |                |                |
>> + test-child01      null             null             null
>> +
>> +
>> +allnext list:
>> +
>> +root->testcase-data->test-child0->test-child01->test-sibling1->test=
-sibling2
>> +->test-sibling3->null
>> +=20
>> +Figure 2: Example test data tree to be attached to live tree.
>> +
>> +According to the scenario above, the live tree is already present s=
o it isn=E2=80=99t=20
>> +required to attach the root(=E2=80=98/=E2=80=99) node. All other no=
des are attached by calling
>> +of_attach_node() on each node.
>> +
>> +In the function of_attach_node(), the new node is attached as the c=
hild of the=20
>> +given parent in live tree. But, if parent already has a child then =
the new node
>> +replaces the current child and turns it into its sibling. So, when =
the testcase
>> +data node is attached to the live tree above (Figure 1), the final =
structure is
>> + as shown in Figure 3. =20
>> +
>> +root (=E2=80=98/=E2=80=99)
          ^^^ ^^^
  non-ascii UTF-8

>> +   |
>> +testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
>> +   |               |          |           |           |
>> + (...)             |          |           |          null
>> +                   |          |         child31 -> sibling32 -> nul=
l
>> +                   |          |           |           |
>> +                   |          |          null        null
>> +                   |        child21 -> sibling22 -> sibling23 -> nu=
ll
>> +                   |          |           |            |
>> +                   |         null        null         null
>> +                child11 -> sibling12 -> sibling13 -> sibling14 -> n=
ull
>> +                   |          |            |            |
>> +                  null       null          |           null
>> +                                        child131 -> null
>> +                                           |
>> +                                          null
>> +-------------------------------------------------------------------=
----
>> +
>> +root (=E2=80=98/=E2=80=99)
          ^^^ ^^^
  non-ascii UTF-8

>> +   |
>> +testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
>> +   |               |          |           |           |
>> +   |             (...)      (...)       (...)        null=20
>> +   |
>> +test-sibling3 -> test-sibling2 -> test-sibling1 -> test-child0 -> n=
ull
>> +   |                |                   |                |
>> +  null             null                null         test-child01
>> +
>> +
>> +Figure 3: Live device tree structure after attaching the testcase-d=
ata.
>> +
>> +
>> +Astute readers would have noticed that test-child0 node becomes the=
 last=20
>> +sibling compared to the earlier structure (Figure 2). After attachi=
ng first=20
>> +test-child0 the test-sibling1 is attached that pushes the child nod=
e=20
>> +(i.e. test-child0) to become a sibling and makes itself a child nod=
e,
>> + as mentioned above.=20
>> +
>> +If a duplicate node is found (i.e. if a node with same full_name pr=
operty is=20
>> +already present in the live tree), then the node isn=E2=80=99t atta=
ched rather its=20
                                                        ^^^
                                            non-ascii UTF-8

>> +properties are updated to the live tree=E2=80=99s node by calling t=
he function=20
                                           ^^^
                               non-ascii UTF-8

>> +update_node_properties().
>> +
>> +
>> +2.2. Removing the test data
>> +
>> +Once the test case execution is complete, selftest_data_remove is c=
alled in=20
>> +order to remove the device nodes attached initially (first the leaf=
 nodes are=20
>> +detached and then moving up the parent nodes are removed, and event=
ually the=20
>> +whole tree). selftest_data_remove() calls detach_node_and_children(=
) that uses=20
>> +of_detach_node() to detach the nodes from the live device tree.
>> +
>> +To detach a node, of_detach_node() first updates all_next linked li=
st, by=20
>> +attaching the previous node=E2=80=99s allnext to current node=E2=80=
=99s allnext pointer. And=20
                               ^^^                         ^^^
                   non-ascii UTF-8             non-ascii UTF-8

>> +then, it either updates the child pointer of given node=E2=80=99s p=
arent to its=20
                                                           ^^^
                                               non-ascii UTF-8

>> +sibling or attaches the previous sibling to the given node=E2=80=99=
s sibling, as=20
                                                              ^^^
                                                  non-ascii UTF-8

>> +appropriate. That is it :)
>> --=20
>> 1.7.9.5
>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

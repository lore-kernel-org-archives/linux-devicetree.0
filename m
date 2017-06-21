From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/4] of: remove *phandle properties from expanded
 device tree
Date: Wed, 21 Jun 2017 16:56:45 -0700
Message-ID: <594B07BD.5020003@gmail.com>
References: <1497996172-821-1-git-send-email-frowand.list@gmail.com>
 <1497996172-821-2-git-send-email-frowand.list@gmail.com>
 <87mv92szsw.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87mv92szsw.fsf-W0DJWXSxmBNbyGPkN3NxC2scP1bn1w/D@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

adding Ben and Paul.

Hi Michael,

On 06/20/17 21:57, Michael Ellerman wrote:
> Hi Frank,
> 
> frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org writes:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Remove "phandle", "linux,phandle", and "ibm,phandle" properties from
>> the internal device tree.  The phandle will still be in the struct
>> device_node phandle field and will still be displayed as if it is
>> a property in /proc/device_tree.
>>
>> This is to resolve the issue found by Stephen Boyd [1] when he changed
>> the type of struct property.value from void * to const void *.  As
>> a result of the type change, the overlay code had compile errors
>> where the resolver updates phandle values.
>>
>>   [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html
>>
>> - Add sysfs infrastructure to report np->phandle, as if it was a property.
>> - Do not create "phandle" "ibm,phandle", and "linux,phandle" properties
>>   in the expanded device tree.
>> - Remove phandle properties in of_attach_node(), for nodes dynamically
>>   attached to the live tree.  Add the phandle sysfs entry for these nodes.
>> - When creating an overlay changeset, duplicate the node phandle in
>>   __of_node_dup().
>> - Remove no longer needed checks to exclude "phandle" and "linux,phandle"
>>   properties in several locations.
>> - A side effect of these changes is that the obsolete "linux,phandle" and
>>   "ibm,phandle" properties will no longer appear in /proc/device-tree (they
>>   will appear as "phandle").
> 
> Sorry but I don't think that can work for us.
> 
> Our DLPAR (ie. CPU/memory/device hotplug) stuff on PowerVM uses
> "ibm,phandle", and it's not the same thing as "phandle" /
> "linux,phandle".
> 
> I don't know the code well myself, but the spec (PAPR) says:

This is the LoPAPR, section 2.1.4, R1-2.1.4-3

   https://members.openpowerfoundation.org/document/dl/469


>   Note: If the “ibm,phandle” property exists, there are two “phandle”
>   namespaces which must be kept separate. One is that actually used by
>   the OF client interface, the other is properties in the device tree
>   making reference to device tree nodes. These requirements are written
>   to maintain backward compatibility with older FW versions predating
>   these requirements; if the “ibm,phandle” property is not present, the
>   OS may assume that any device tree properties which refer to this node
>   will have a phandle value matching that returned by client interface
>   services.
> 
> I have systems here that still use "ibm,phandle". I also see at least
> some of the userspace code that looks for "ibm,phandle", and nothing
> else.
> 
> The note above actually implies that the current Linux code is wrong,
> when it uses "ibm,phandle" as the value of np->phandle.

My interpretation of the LoPAPR R1-2.1.4-1 and R1-2.1.4-2 is that the
ibm-phandle property it the node's phandle value that other nodes may
refer to.  Thus this is the value that should be placed in np->phandle,
which is the value that will be used to find a node based on its
phandle value.  Which is the way the drivers/of/fdt.c currently works:

                /* We accept flattened tree phandles either in
                 * ePAPR-style "phandle" properties, or the
                 * legacy "linux,phandle" properties.  If both
                 * appear and have different values, things
                 * will get weird. Don't do that.
                 */
                if (!strcmp(pname, "phandle") ||
                    !strcmp(pname, "linux,phandle")) {
                        if (!np->phandle)
                                np->phandle = be32_to_cpup(val);
                }

                /* And we process the "ibm,phandle" property
                 * used in pSeries dynamic device tree
                 * stuff
                 */
                if (!strcmp(pname, "ibm,phandle"))
                        np->phandle = be32_to_cpup(val);

My interpratation of R1-2.1.4-1 through R1-2.1.4-3 is that the
"ibm,phandle" property is relevant to the contents of the Linux
kernel device tree and that the "phandle returned by a client
interface service" is not relevant to the Linux kernel device
tree.  I would not expect the powerpc code to expose the
device tree code to a "phandle returned by a client
interface service".  Is that correct?

The current code which chooses which value potentially ends up in
np->phandle seems to involve a little bit of cargo cult coding.
This code has been adapted and combined from several locations,
see commits:

   dfbd4c6eff35f1b1065cca046003cc9d7ff27222

then earlier:

   04b954a673dd02f585a2769c4945a43880faa989
   6016a363f6b56b46b24655bcfc0499b715851cf3
   e6a6928c3ea1d0195ed75a091e345696b916c09b
   bbd33931a08362f78266a4016211a35947b91041

I would like for the code that sets the value of np->phandle
to simply say:

   if name is "phandle", "linux,phandle", or "ibm,phandle" then
      np->phandle = the value

Does anyone know if the additional logic in the current code is
needed?

Beyond the issue of the value of np->phandle, there is the issue of
exposing the unflattened properties to user space in
/proc/device-tree.  Michael reports that there are user space
programs that access "ibm,phandle" specifically, so that property
name must continue to be exposed under /proc/device-tree.  Rob
was hoping that we could collapse the properties "linux,phandle"
and "phandle" to be the single property "phandle" under
/proc/device-tree.  Are there any problems with this plan?


> So sorry that's a big mess, but we can't just rip out those properties.
> 
> I think the minimal change would be to treat "ibm,phandle" like a normal
> property, I think that would allow our tools to keep working?

Rob was hoping that we could collapse the properties "linux,phandle"
and "phandle" to be the single property "phandle" under
/proc/device-tree.  The next step after my current patch would be
to modify the Linux kernel build system to use the dtc command line
option to not generate both the "phandle" and the "linux,phandle"
properties, but instead just generate the "phandle" property.
This would result in slightly smaller FDT files.

Michael is a little worried about collapsing "phandle" and
"linux,phandle" to be just "phandle" (see below).
Does anyone else have an opinion on this?


> The other thing that worries me is that by renaming (effectively)
> "linux,phandle" to "phandle", we lose the ability to accurately
> regenerate the device tree from /proc/device-tree. In theory it
> shouldn't matter, but I worry that in practice something will break.
> 
> What if we just kept a single bit flag somewhere indicating if the name of
> the phandle property we found was "phandle" or "linux,phandle", and
> create the sysfs phandle using that name?

Another nit with my current patch is that if a node has an "ibm,phandle"
but no "linux,phandle" and no "phandle" then a "phandle" property is
created for the node under /proc/device-tree.  Is this a potential
issue?  My feeling is that it should not be harmful.

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

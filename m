From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: OF_DYNAMIC node lifecycle
Date: Tue, 15 Jul 2014 23:33:20 -0600
Message-ID: <CACxGe6u5bVwYZjux9F2xzZSxZOSe37DGemCgcYtmiTP-xenQfg@mail.gmail.com>
References: <CACxGe6tsXuLZT=h8S0yRPRPy6Hqz1xkX8G+ViY0cxEUuxZ1dsw@mail.gmail.com>
 <53A30117.3010100@austin.ibm.com> <20140623144806.1348EC40A60@trevor.secretlab.ca>
 <53A9DB4F.9060708@austin.ibm.com> <20140625202446.77687C40AE6@trevor.secretlab.ca>
 <53AC7C2D.3040604@austin.ibm.com> <20140627124101.367F7C40E5E@trevor.secretlab.ca>
 <53AD8296.6040702@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53AD8296.6040702-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Cc: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I've got another question about powerpc reconfiguration. I was looking
at the dlpar_configure_connector() function in dlpar.c. I see that the
function has the ability to process multiple nodes with additional
sibling and child nodes. It appears to link them into a detached tree
structure, and the function returns a pointer to the first node.

All of the callers of that function then call dlpar_attach_node(),
which calls of_attach_node(). However, of_attach_node() only handles a
single node. It doesn't handle siblings or children. Is this a bug?
Does the configure connector ever actually receive more than one node
at once?

g.

On Fri, Jun 27, 2014 at 8:41 AM, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org> wrote:
> On 06/27/2014 07:41 AM, Grant Likely wrote:
>> On Thu, 26 Jun 2014 15:01:49 -0500, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org> wrote:
>>> On 06/25/2014 03:24 PM, Grant Likely wrote:
>>>> On Tue, 24 Jun 2014 15:10:55 -0500, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org> wrote:
>>>>>>> heh! I have often thought about adding reference counting to device tree
>>>>>>> properties.
>>>>>>
>>>>>> You horrible, horrible man.
>>>>>
>>>>> Yes. I are evil :)
>>>>>
>>>>> After looking again the work needed to add reference counts to properties
>>>>> would be huge. The few properties I am concerned with are specific to powerpc
>>>>> so perhaps just adding an arch specific lock around updating those
>>>>> properties would work.
>>>>
>>>> Which code/properties? I'd like to have a look myself.
>>>
>>> /ibm,dynamic-reconfiguration-memory/ibm,dynamic-memory
>>>
>>> The property is updated in
>>> arch/powerpc/platforms/pseries/hotplug-memory.c:pseries_update_drconf_memory()
>>
>> Specifically, what do you need for the locking? Are you wanting to hold
>> off additional changes while that function is executing? Pantelis is
>> adding a mutex for device tree writers. Holding that mutex would prevent
>> any changes from happening in the tree without affecting readers. Would
>> that be sufficient?
>
> That would work.
>
> -Nathan
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

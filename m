From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: OF_DYNAMIC node lifecycle
Date: Wed, 16 Jul 2014 14:57:42 -0600
Message-ID: <CACxGe6v8BgEcTRB-ftPVkR6Tqs3GPw_0fVuwFgff_VqawoocGA@mail.gmail.com>
References: <CACxGe6tsXuLZT=h8S0yRPRPy6Hqz1xkX8G+ViY0cxEUuxZ1dsw@mail.gmail.com>
 <53A30117.3010100@austin.ibm.com> <20140623144806.1348EC40A60@trevor.secretlab.ca>
 <53A9DB4F.9060708@austin.ibm.com> <20140625202446.77687C40AE6@trevor.secretlab.ca>
 <53AC7C2D.3040604@austin.ibm.com> <20140627124101.367F7C40E5E@trevor.secretlab.ca>
 <53AD8296.6040702@austin.ibm.com> <CACxGe6u5bVwYZjux9F2xzZSxZOSe37DGemCgcYtmiTP-xenQfg@mail.gmail.com>
 <53C6C4BE.6010301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53C6C4BE.6010301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 16, 2014 at 12:30 PM, Tyrel Datwyler
<turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 07/15/2014 10:33 PM, Grant Likely wrote:
>> I've got another question about powerpc reconfiguration. I was looking
>> at the dlpar_configure_connector() function in dlpar.c. I see that the
>> function has the ability to process multiple nodes with additional
>> sibling and child nodes. It appears to link them into a detached tree
>> structure, and the function returns a pointer to the first node.
>>
>> All of the callers of that function then call dlpar_attach_node(),
>> which calls of_attach_node(). However, of_attach_node() only handles a
>> single node. It doesn't handle siblings or children. Is this a bug?
>> Does the configure connector ever actually receive more than one node
>> at once?
>
> Yes, it is sometimes the case we will get a tree structure back of more
> than one node. Under the proc interface implementation this just worked.
> With the move to sysfs it appears we have a regression here. What makes
> more sense here, for us to walk the tree calling of_attach_node, or to
> move such tree walking logic into of_attach_node? From what I can tell
> we are the only consumers of of_attach_node.

That is very shortly going to change. The overlay code also uses
of_attach_node(). I can make of_attach_node() recurse over
descendants, but I'm also considering moving the powerpc code over to
the of_changeset series that Panto and I are working on.

Either way, the handling of multiple nodes should be common code. I
think the easiest is to put the recursion into of_attach_node(), at
least for fixing the bug. It can be reworked later.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

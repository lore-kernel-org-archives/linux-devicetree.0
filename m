From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 22 Feb 2010 16:52:23 -0600
Message-ID: <4B830AA7.2060701@freescale.com>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<fa686aa41002221359m4d857e4cn3a1c56c32a24d21d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41002221359m4d857e4cn3a1c56c32a24d21d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Mon, Feb 22, 2010 at 9:13 AM, Yoder Stuart-B08248
>> We had a similar problem in the Freescale Embedded Hypervisor
>> to control the generation of guest device trees.   We defined
>> several 'magic' properties that had special meaning in
>> the context of a node update.
> 
> heh, so the functionality is definitely needed, but boy is that ugly!
> :-)

And we haven't even mentioned node-update-phandle yet. :-)

> I really do think there needs to be a syntactically distinct
> method of deleting nodes and properties.  Magic property names that
> look like normal properties worry me.

The problem in our case is that the updates have to be done at runtime 
(modifications contained in a config tree are applied to a hardware 
devtree node (or hv-generated node) to produce a guest devtree node), so 
to use something that doesn't look like a normal property would require 
dtb format changes.

The whole node-update subtree in such a case could be considered magic.

The problem domain of this thread has no such requirement, of course.

> What about something like this:  Right now nodes are defined by <name>
> { [<property>|<node>]; ... }; and properties are defined by <name>; or
> <name> = <value>;  To differentiate a command from either a node or
> property definition, perhaps round braces could be used:
> 
> so for the definition:
> a-node {
>         property-1;
>         property-2 = "blah";
>         child-1 {
>                 ...
>         };
> };
> 
> you could delete property-2 and node-1 with:
> a-node {
>         delete-node(child-1);
>         delete-property(property-2);
> };
> 
>> We also had the need to prepend to a <stringlist> so that
>> compatible properties could be updated.
>>
>>   prepend-stringlist  <stringlist> The value is a string list that
>>                                    specifies on or more property name/value
>>                                    pairs.
> 
> This is a bit of a harder problem.  I've go no ideas on how to handle
> this in a syntactically elegant way.

As long as we're talking about dts-level static manipulation (i.e. not 
magic properties), we're not limited to one instance of each command 
name, so we could just do:

prepend-stringlist("compatible", "foo,bar");
prepend-stringlist("compatible", "foo,bar-X.Y");
prepend-stringlist("something-else", "aoeuhtns");

We need the quotes around node/property names since comma is a legal 
character in them.

-Scott

From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: PCI example for device tree
Date: Sat, 19 Jun 2010 07:12:24 -0600
Message-ID: <AANLkTik-TbdrIdr9YjeJGSlGH7-DUG_i1qK-X-aFVK4K@mail.gmail.com>
References: <4C1C9CEA.8050904@gatzka.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4C1C9CEA.8050904-tNItQxeJkt8dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: stephan-tNItQxeJkt8dnm+yROfE0A@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[cc'ing mailing list]

On Sat, Jun 19, 2010 at 4:33 AM, Stephan Gatzka <stephan-tNItQxeJkt8dnm+yROfE0A@public.gmane.org> wrote:
> Hi Grant,
>
> I complete the first version of the PCI bus mapping example. It is in the
> draft section of your wiki. Maybe you can just look into it and if you like
> it, put it into the main wiki page.

Hi Stephan,

Thanks for this work.  That is useful.  Before I take it out of draft,
I'd like some changes to be made so that it better fits with the rest
of the documents.  I talked about it in an earlier email, but I don't
know if you got it or not.  Here's what I wrote:

On Sun, Jun 13, 2010 at 11:54 PM, Grant Likely
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Sat, Jun 12, 2010 at 11:33 AM, Stephan Gatzka <stephan-tNItQxeJkt8dnm+yROfE0A@public.gmane.org> wrote:
>> Hi Grant,
>>
>>> I've been doing a bit of work on some introductory level documentation
>>> of the flattened device tree.  I've got a rough copy up on the
>>> devicetree.org wiki, and I could use some feedback.  If anyone has
>>> some time to look at it, you can find it here:
>>>
>>> http://devicetree.org/Device_Tree_Usage
>>>
>>> Thanks,
>>> g.
>>>
>>
>> this looks good. Maybe an example of a complete host/PCI bridge might be
>> helpful. Probably I can write something during the next week.
>
> Hi Stephan,
>
> I see that you started drafting some of this on the wiki.  Thanks for
> the draft you've done so far.  Some comments:
>
> - Instead, of using an MPC5200 example, add a pci bus to the sample
> Coyote's Revenge system used in the rest of the page and describe
> that.  The goal of this document is to lead a user step-by-step how
> each part of the device tree works.  So, instead of plopping down the
> complete PCI bus node, the document should gradually build it up, and
> talk about each element as it is added.  Focus on how it all works
> together.
>
> - It would be useful to also show a PCI-to-PCI bridge, and maybe a
> fixed PCI device as children of the host bridge node.
>
> - The current PCI nodes on all powerpc boards depend on a device_type
> = "PCI" property, but I'd like to look at moving away from that for
> new PCI controllers (device_type describes facilities in real open
> firmware.  It shouldn't have any meaning in the flattened device
> tree).  I need to look into the details though to see if it is
> feasible or not.
>
> - Describing the interrupt-map property will be particularly fiddly.
> It could have a section all to itself before you even get to talking
> about PCI irq swizzling.
>
> Thanks again for the help!
> g.

The most important bit I think it to break up the adding of the PCI
node so that it is built up piece by piece.  For each element being
discussed, I want a reader to be able to focus on just the properties
that are involved.

Thanks,
g.

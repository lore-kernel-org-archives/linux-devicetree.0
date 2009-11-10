From: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: Re: PCI bus node location
Date: Tue, 10 Nov 2009 17:26:47 +0100
Message-ID: <A3A4CAD4-BE74-4CD4-BFFA-FE616DF38811@semihalf.com>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1076)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa40911091836s2a6b763aq14ece296cd7368db-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 2009-11-10, at 03:36, Grant Likely wrote:

> On Mon, Nov 9, 2009 at 12:20 PM, Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>  
> wrote:
>> Hi,
>> I have a couple of questions regarding host/PCI bridges nodes  
>> location:
>>
>> - What is the reason most of the DTS definitions have the host/PCI  
>> bridges
>> hanging off the root node, even though they are most often really  
>> part of
>> the soc?
>> - Is this is some OF heritage (I couldn't find anything explicit  
>> about it in
>> the original PCI bindings docs)?
>> - Is this convention enforced in FDT, or could PCI bus nodes be  
>> children of
>> the soc node as well?
>
> It was a solution to an engineering problem.  The PCI control
> registers are indeed within the IMMR region, and when we first started
> doing PowerPC FDT board ports, the PCI node was a child of the SoC
> node.  However, since PCI is also bridge with its own address space
> translation, having it live in the SoC node causes difficulties.
> Specifically, all of the entries in the PCI node ranges property would
> need similar counterparts in the SoC node ranges property; a scheme
> that doesn't reflect well the actual behaviour of the IMMR region.
>
> Two alternate solutions were proposed.  One was to split the PCI node
> into a PCI bridge node which describes the translations, and a PCI
> control node which describes how to access the PCI bridge registers.
> Some sort of linkage (probably a phandle) would be needed to relate
> the two.  The second was to simply move the PCI node out to be a
> parent of the root.  The second option was the one chosen because it
> was the path of least resistance.  It may not be the most 'correct'
> solution, but it has worked out quite well in practice.  There is
> nothing in the PCI or FDT infrastructure code that enforces this
> convention.  In fact, if the appropriate ranges properties were added
> back to the IMMR node, then the PCI node could become a child of the
> IMMR node without any code changes (but it still wouldn't be a 100%
> 'correct' description of the hardware).

Thanks a lot for the historic perspective and explanations. My concern  
with integrating this model into FreeBSD device scheme abstraction was  
that I could not reflect the hierarchy of DT resources directly,  
because two peer bus entities at the same level (soc, pci) would ask  
for overlapping areas to manage (which shouldn't happen); but I  
believe I got an idea how to resolve this.

The current approach seems a bit of a maintenance problem: the PCI  
bridges control reg need to specify the whole address instead of just  
an offset, which is more error prone in case of changes (when a number  
of places need to be adjusted etc.). What would need to be done/ 
extended for the ranges prop you mention to allow for better handling  
cases like this?

Rafal

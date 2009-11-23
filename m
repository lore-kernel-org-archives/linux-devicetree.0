From: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: [microblaze-uclinux] Re: [PATCH 0/4 v2] Merge OF dynamic patches
Date: Mon, 23 Nov 2009 14:27:13 +0100
Message-ID: <4B0A8DB1.9050501@petalogix.com>
References: <4B06AF33.1000400@austin.ibm.com>
	<fa686aa40911201340i77bc4098ud866d103acaefd30@mail.gmail.com>
Reply-To: michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa40911201340i77bc4098ud866d103acaefd30-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Fri, Nov 20, 2009 at 8:01 AM, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org> wrote:
>> This set of patches merges the common dynamic device tree
>> updating routines of_attach_node() and of_detach_node() to
>> drivers/of/of_dynamic.c.
>>
>> Built and tested on powerpc, I have no access to build/test
>> this on microblaze.
> 
> Heh.  Actually, I've got a patch in my tree that does the same thing
> (except to a different location).  I could pick up your version and
> drop mine, but you need to rework it to be bi-sectable.  As the series
> exists right now, the build will fail if only part of the series is
> applied.  This change is simple enough that you can do the whole thing
> in a single patch.  Or, fix the Kconfig and include stuff in the first
> patch with the merge of of_attach_node, and then move of_detach_node
> in the second.
> 
> But I'm really close to posting my 3rd series, so it may be better to
> wait until that is published and build a patch on top of that to move
> them into of_dynamic.c

ACK.
Michal

> 
> Cheers,
> g.
> 
>> ---
>>
>> 1/4 - Merge of_attach_node
>> 2/4 - Merge of_detach_node
>> 3/4 - Makefile/Kconfig updates
>> 4/4 - Update powerpc/pseries to include of_dynamic.h
>>
>> arch/microblaze/Kconfig                   |    1
>> arch/microblaze/include/asm/prom.h        |    4 -
>> arch/microblaze/kernel/prom.c             |   59 -----------------------
>> arch/powerpc/Kconfig                      |    1
>> arch/powerpc/include/asm/prom.h           |    4 -
>> arch/powerpc/kernel/prom.c                |   59 -----------------------
>> arch/powerpc/platforms/pseries/reconfig.c |    1 drivers/of/Kconfig
>>                |    4 +
>> drivers/of/Makefile                       |    1 drivers/of/of_dynamic.c
>>               |   75 ++++++++++++++++++++++++++++++
>> include/linux/of_dynamic.h                |   27 ++++++++++
>> 11 files changed, 110 insertions(+), 126 deletions(-)
>>
> 
> 
> 


-- 
Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663

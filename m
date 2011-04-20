From: Kristoffer Glembo <kristoffer-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 7/7] OF: set dma_mask for ARM
Date: Wed, 20 Apr 2011 10:11:44 +0200
Message-ID: <4DAE9540.8040006@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Have you gotten any feedback on this? I am facing the same decision on SPARC32. I need to add dma_mask to get USB working on non-PCI buses and I'm currently thinking about doing it either the PowerPC way or going with the dma_mask = &coherent_dma_mask route. It would be nice if we could get some community agreement on which is the proper way of doing this.

Best regards,
Kristoffer Glembo


On 11/16/2010 11:24 PM, Grant Likely wrote:
>> On Tue, Nov 16, 2010 at 02:33:55PM -0600, Rob Herring wrote:
>>> From: Rob Herring<rob.herring at calxeda.com>
>>>
>>> Various drivers require dma_mask to be valid, so it needs to be setup
>>> when doing OF probing on ARM.
>>>
>>> Signed-off-by: Rob Herring<rob.herring at calxeda.com>
>>
>> I'll let patches 6&  7 lay fallow for the moment.  I'm not hugely fond
>> of the powerpc approach (which microblaze copies), but I haven't had a
>> chance to look for a better solution.
>>
>
>Looking at this some more, there's a couple of options I see.
>
>Other buses (ISA, PCI, EISA) have a dma_mask in their struct. So perhaps 
>platform_device should just have a dma_mask field.
>
>There are several examples of setting dma_mask = &coherent_dma_mask. I'm 
>not sure if this is considered correct. At least on ARM, I don't think 
>these would need to be different.
>
>Another option would be using bus notifiers to set the dma_mask like 
>platform_data. But that doesn't seem like a good long term solution.
>
>Rob

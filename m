From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 7/7] OF: set dma_mask for ARM
Date: Mon, 07 Feb 2011 21:24:20 -0600
Message-ID: <4D50B764.1080405@gmail.com>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
	<1289939635-30742-8-git-send-email-robherring2@gmail.com>
	<20101117052448.GC12813@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101117052448.GC12813-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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

Grant,

On 11/16/2010 11:24 PM, Grant Likely wrote:
> On Tue, Nov 16, 2010 at 02:33:55PM -0600, Rob Herring wrote:
>> From: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> Various drivers require dma_mask to be valid, so it needs to be setup
>> when doing OF probing on ARM.
>>
>> Signed-off-by: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>
> I'll let patches 6&  7 lay fallow for the moment.  I'm not hugely fond
> of the powerpc approach (which microblaze copies), but I haven't had a
> chance to look for a better solution.
>

Looking at this some more, there's a couple of options I see.

Other buses (ISA, PCI, EISA) have a dma_mask in their struct. So perhaps 
platform_device should just have a dma_mask field.

There are several examples of setting dma_mask = &coherent_dma_mask. I'm 
not sure if this is considered correct. At least on ARM, I don't think 
these would need to be different.

Another option would be using bus notifiers to set the dma_mask like 
platform_data. But that doesn't seem like a good long term solution.

Rob

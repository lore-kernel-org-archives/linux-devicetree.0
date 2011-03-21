From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM:boot:device tree: Allow the device tree binary to
	be appended to zImage
Date: Mon, 21 Mar 2011 11:36:56 -0700
Message-ID: <4D879AC8.9080901@secretlab.ca>
References: <20110309215800.26377.43925.stgit@riker>
	<alpine.LFD.2.00.1103171422500.26889@xanadu.home>
	<4D878C63.6080205@secretlab.ca>
	<alpine.LFD.2.00.1103211413560.11889@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1103211413560.11889-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Comments below.

- John

On 03/21/2011 11:22 AM, Nicolas Pitre wrote:
> On Mon, 21 Mar 2011, John Bonesio wrote:
> 
>> Hi Nicolas,
>>
>> Thanks for the comments. I have a question (below).
>>
> [...]

[snip]

>>>
>>> Now if no dtb was found, or if that code is not configured, then lr 
>>> contains garbage and that may have random consequences with the code 
>>> that follows, which would explain the reported bad behaviors with this 
>>> patch applied even if not configured in the kernel.
>>
>> I'm probably not understanding something here. When I look at the code
>> prior to my patch, it looks like lr is not initialized by head.S.
> 
> Exact.
> 
>> It also looks like this code makes use of lr when it relocates the 
>> code and leaves it uninitialized when it jumps back to 'restart'.
> 
> Exact.
> 
>> Is this a bug in the previous code too?
> 
> No.
> 
>> What should lr be initialized to, or should we just be preserving it's
>> value?
> 
> No.  The problem is that you do use lr further down in your patch when 
> adjusting GOT entries, assuming it contains the size of the dtb.  If no 
> DTB is found then lr contains random stuff that will mess up the GOT for 
> .bss references.

Oh! Good catch. Thanks.

> 
>> I saw the comment about the performance is different with this patch -
>> something about a pause between 'Uncompressing Linux...' and the kernel
>> boot output. I'm not sure what's going on here. By the time
>> 'Uncompressing Linux...' comes out all relocations and dtb discovery is
>> complete. Do you really think having lr uninitialized would cause this?
> 
> Certainly.  See above.
> 
> 
> Nicolas

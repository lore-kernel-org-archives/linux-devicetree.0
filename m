From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM:boot:device tree: Allow the device tree binary
	to be appended to zImage
Date: Mon, 21 Mar 2011 16:42:24 -0700
Message-ID: <4D87E260.6050902@secretlab.ca>
References: <20110321221930.19756.36549.stgit@riker>
	<alpine.LFD.2.00.1103211844500.11889@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1103211844500.11889-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
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

Hi Nicolas,

Is this addhi instruction the only one, or do I need to go through and
find other instructions to update as well?

Thanks for being patient as I learn.

- John

On 03/21/2011 03:49 PM, Nicolas Pitre wrote:
> On Mon, 21 Mar 2011, John Bonesio wrote:
> 
>> This patch provides the ability to boot using a device tree that is appended
>> to the raw binary zImage (e.g. cat zImage <filename>.dtb > zImage_w_dtb).
>>
>> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> 
> One minor glitch still...  ;-)
> 
>> @@ -288,12 +344,28 @@ wont_overwrite:
>>  
>>  		/*
>>  		 * Relocate all entries in the GOT table.
>> +		 * Bump bss entries to _edata + dtb size
>>  		 */
>>  1:		ldr	r1, [r11, #0]		@ relocate entries in the GOT
>> -		add	r1, r1, r0		@ table.  This fixes up the
>> -		str	r1, [r11], #4		@ C references.
>> +		add	r1, r1, r0		@ This fixes up C references
>> +		cmp	r1, r2			@ if entry >= bss_start &&
>> +		cmphs	r3, r1			@       bss_end > entry
>> +		addhi	r1, lr			@    entry += dtb size
> 
> Some toolchains won't accept this shortened version unless you compile 
> for Thumb.  You should instead use:
> 
> 		addhi	r1, r1, lr
> 
> Otherwise...
> 
> Reviewed-by: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> 
> Nicolas

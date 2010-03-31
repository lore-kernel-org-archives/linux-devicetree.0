From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: RFC: ARM Boot standard for passing device tree blob
Date: Wed, 31 Mar 2010 02:10:02 +0100
Message-ID: <20100331011002.GL31126@trinity.fluff.org>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
	<20100325210409.GH24984@n2100.arm.linux.org.uk>
	<1269610665.807.51.camel@e102109-lin.cambridge.arm.com>
	<4BACF238.3040405@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4BACF238.3040405@firmworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mitch Bradley <wmb@firmworks.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Philippe Robin <Philippe.Robin@arm.com>, David Rusling <David.Rusling@arm.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, Dave P Martin <Dave.Martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 26, 2010 at 07:43:20AM -1000, Mitch Bradley wrote:
> Catalin Marinas wrote:
>> On Thu, 2010-03-25 at 21:04 +0000, Russell King - ARM Linux wrote:
>>   
>>> On Wed, Mar 24, 2010 at 09:11:56AM -0600, Grant Likely wrote:
>>>     
>>>> ===Required System State===
>>>>       
>> [...]
>>   
>>>> *IRQs disabled
>>>> *MMU off
>>>> *Instruction cache either on or off
>>>> *Data cache turned off
>>>>       
>>> Would recommend saying "Data cache(s) turned off" so that L2 cache is
>>> included.
>>>     
>>
>> There are platforms where the L2 cache is turned on by the boot monitor
>> (secure monitor) and Linux has no control over it (I think OMAP).
>>   
>
> What is the reason for turning off the data caches?  Leaving all caches  
> turned on and coherent with one another has always worked well for me at  
> the interface from firmware to a booted program.

Dealing with cache maintainace early in the kernel is difficult, you
end up with piles of ASM replicated from the arm mm to deal with
coherency, code modification due to decompression, etc.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

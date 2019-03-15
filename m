From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCHv2 2/5] Documentation: dt: edac: Add Stratix10 Peripheral
 bindings
Date: Fri, 15 Mar 2019 11:24:29 -0500
Message-ID: <58583ae5-2a8c-97ab-9a82-fef8d4077169@linux.intel.com>
References: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
 <1551288445-22335-3-git-send-email-thor.thayer@linux.intel.com>
 <20190312160445.GA8802@bogus>
 <8b671f75-8488-1e06-a020-5f7d95166918@linux.intel.com>
 <CAL_JsqJHKwOBcHLwfHfB407XkU4SFDymbWR05fN+Zft1ki+b=w@mail.gmail.com>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJHKwOBcHLwfHfB407XkU4SFDymbWR05fN+Zft1ki+b=w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Dinh Nguyen <dinguyen@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 3/13/19 2:20 PM, Rob Herring wrote:
> On Tue, Mar 12, 2019 at 2:28 PM Thor Thayer <thor.thayer@linux.intel.com> wrote:
>>
>> Hi Rob,
>>
>> On 3/12/19 11:04 AM, Rob Herring wrote:
>>> On Wed, Feb 27, 2019 at 11:27:22AM -0600, thor.thayer@linux.intel.com wrote:
>>>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>>>
>>>> Add peripheral bindings for Stratix10 EDAC to capture
>>>> the differences between the ARM64 and ARM32 architecture.
>>>
>>> What's the difference? Sounds like 2 different chips, so Stratix10 or
>>> s10 is not specific enough perhaps.
>>>
>>
>> Yes, our ARM32 chips are the Cyclone5 and Arria10. The Stratix10 is
>> ARM64 and I'm using S10 as shorthand for the Stratix10.
> 
> So it's really just differences between one chip and another... ARM32
> vs 64 really has nothing to do with that.
> 
>>
>> The ECC blocks are very similar between Arria10 and Stratix10 but there
>> are differences as a result of the ARM32 vs ARM64 architecture
>> differences. The major difference is how Double Bit Errors are handled.
>> In the ARM32, the DBE is mapped to an IRQ. On ARM64, the DBE is mapped
>> to a SError.
> 
> Okay, I guess that's why arm64 matters...
> 
>> I had started out re-using the Arria10 bindings for Stratix10 since they
>> were very similar. Dinh pointed out that having separate bindings for
>> ARM64 would allow separation between the architectures and make future
>> changes easier.
>>
>> I'm unclear on the comment about being specific enough. Are you
>> suggesting that I use arm64 in the binding name instead of s10? Or is
>> there a better naming convention I should follow?
> 
> NM, it was me that was confused. It was that Stratix10 was already
> mentioned in the doc that confused me.
> 
> Rob

I can reword this to make it clearer. Do you have any additional 
suggestions for clarification aside from ARM64 vs ARM32 IRQ handling as 
we discuss above that you would need to ack this patch?

Thanks,

Thor

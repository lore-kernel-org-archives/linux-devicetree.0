From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe
 ordering
Date: Fri, 24 May 2019 17:25:26 -0700
Message-ID: <0634ea45-2941-73fb-f8d8-b536e929a4a8@gmail.com>
References: <20190524010117.225219-1-saravanak@google.com>
 <06b479e2-e8a0-b3e8-567c-7fa0f1c5bdf6@gmail.com>
 <CAGETcx-21GEoBKhpzcsrDt3sEo-vUpwqnr3To7VbSPd8aW86Nw@mail.gmail.com>
 <6d3995c1-e1e7-35ff-d091-501822c97ecd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6d3995c1-e1e7-35ff-d091-501822c97ecd@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On 5/24/19 5:22 PM, Frank Rowand wrote:
> On 5/24/19 2:53 PM, Saravana Kannan wrote:
>> On Fri, May 24, 2019 at 10:49 AM Frank Rowand <frowand.list@gmail.com> wrote:
>>>
>>> On 5/23/19 6:01 PM, Saravana Kannan wrote:
> 
> < snip >
> 
>>> Another flaw with this method is that existing device trees
>>> will be broken after the kernel is modified, because existing
>>> device trees do not have the depends-on property.  This breaks
>>> the devicetree compatibility rules.
>>
>> This is 100% not true with the current implementation. I actually
>> tested this. This is fully backwards compatible. That's another reason
>> for adding depends-on and going by just what it says. The existing
>> bindings were never meant to describe only mandatory dependencies. So
>> using them as such is what would break backwards compatibility.
> 
> Are you saying that an existing, already compiled, devicetree (an FDT)
> can be used to boot a new kernel that has implemented this patch set?
> 
> The new kernel will boot with the existing FDT that does not have
> any depends-on properties?

I overlooked something you said in the email I replied to.  You said:

   "that depends-on becomes the source of truth if it exists and falls
   back to existing common bindings if "depends-on" isn't present"

Let me go back to look at the patch series to see how it falls back
to the existing bindings.

> 
> -Frank
> 

From: Laura Abbott <laura@labbott.name>
Subject: Re: [PATCHv2 0/3] Devicetree bindings for Ion
Date: Tue, 17 Nov 2015 11:02:35 -0800
Message-ID: <564B79CB.3040004@labbott.name>
References: <1447721855-7574-1-git-send-email-laura@labbott.name>
 <8990901.B0bMvlhTJH@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8990901.B0bMvlhTJH@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, arve@android.com
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Riley Andrews <riandrews@android.com>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Gall <tom.gall@linaro.org>, Colin Cross <ccross@google.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, romlem@google.com, mitchelh@codeaurora.org, linux-arm-kernel@lists.infradead.org, Feng Tang <feng.tang@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On 11/17/15 7:15 AM, Arnd Bergmann wrote:
> On Monday 16 November 2015 16:57:32 Laura Abbott wrote:
>> Hi,
>>
>> This is another attempt at devicetree bindings for Ion. The big complaint from
>> v1 was that too much unnecessary data was being pushed into devicetree.
>> v2 takes a different approach of using just compatbile strings for the heaps.
>> This gets closer to the devicetree philosophy of describing just the hardware.
>> Each heap ultimately represents some kind of memory that exists in the system.
>> The compatible string indicates the match for how to handle the type of memory
>> on this system. The details like heap-id, name etc. are now pushed out to C
>> files. This makes Ion heaps look closer to something like a quirks framework.
>> (I'd argue this isn't a complete mischaracterization given the type of setup
>> Ion gets used for...) The one downside here is that this leads to more new
>> bindings for each board that gets added.
>>
>> This version also includes a sample C file which shows what the structure
>> might look like. As always, your comments and reviews are appreciated.
>
> I'm still a bit unsure about the concept of hardwiring ion in the DT
> bindings. It's not just Linux-specific, it's specific to the implementation
> of one or two GPU drivers, and if we fix the bindings for Ion, we might
> never be able to migrate them away from this framework.
>

Ion isn't just for GPU drivers. It certainly started out that way but
it still fills some gaps in APIs (e.g. the use cases mentioned by
Andrew Andrianov). The goal here was get those who are using Ion
standardized on something and possibly treat those bindings as unstable.
Devicetree bindings are probably going to be very low on the list of
things that will keep drivers from migrating away from Ion. There's
still an implicit assumption there that drivers will be migrating away
from Ion though. I think part of the problem here may be the lack of
direction right now for moving Ion forward. Progress has been slow.
The thought was to at least enable those who are using Ion now and
then revisit whatever we come up with later. If this isn't a good
approach, I'd rather hear consensus now to know where to put effort
and tell people to keep doing whatever outside the mainline kernel.

Thanks,
Laura

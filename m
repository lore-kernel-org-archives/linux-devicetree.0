From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/sequoia: fix NAND partitions not to overlap
Date: Fri, 19 May 2017 20:04:29 +1000
Message-ID: <87zie95fiq.fsf@concordia.ellerman.id.au>
References: <20170402100535.GA18340@amd> <20170517120613.GA583@amd> <20170517143717.ad818a2282378fc7a38af1ff@linux-foundation.org> <20170518094813.GA12038@amd> <87efvl75ts.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87efvl75ts.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, trivial@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, paulus@samba.org, Andrew Morton <akpm@osdl.org>, jwboyer@linux.vnet.ibm.com, sr@denx.de, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Michael Ellerman <mpe@ellerman.id.au> writes:

> Pavel Machek <pavel@denx.de> writes:
>
>> On Wed 2017-05-17 14:37:17, Andrew Morton wrote:
>>> On Wed, 17 May 2017 14:06:13 +0200 Pavel Machek <pavel@denx.de> wrote:
>>> 
>>> > On Sun 2017-04-02 12:05:36, Pavel Machek wrote:
>>> > > Fix overlapping NAND partitions.
>>> > > 
>>> > > Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>> > 
>>> > Ping? Two partitions at same place are bad news...
>>> 
>>> Please expand on "bad news"?  What are the runtime effects of this
>>> change?  Decisions about which kernel(s) to patch depend on this info.
>>
>> Well... two partitions at same place. If you use one, you will corrupt
>> information on the other one.
>>
>> OTOH this moves partition around (so that they don't overlap) so it is
>> probably not stable candidate.
>>
>> I guess this is not huge issue; people using these boards probably
>> have custom dts changes, anyway...
>
> Or no one's even using it anymore.
>
> I can take this via powerpc, I won't mark it for stable etc.

It became:

    Author:     Pavel Machek <pavel@denx.de>

    powerpc/sequoia: Fix NAND partitions not to overlap
    
    Currently the DTS defines two partitions at the same addresses, if you
    use one, you will corrupt information on the other one. Fix it by
    shifting the second partition.
    
    Signed-off-by: Pavel Machek <pavel@ucw.cz>
    [mpe: Reconstruct change log from email thread]
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>


Minor nit, your From: address doesn't match your Signed-off-by: address,
which trips my "check patch is signed-off-by author" script. I can
just ignore it, but I think it's preferable if they match.

cheers

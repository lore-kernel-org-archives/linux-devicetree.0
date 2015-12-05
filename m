From: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] of: Fix comparison of reserved memory regions
Date: Sat, 05 Dec 2015 22:43:57 +1100
Message-ID: <5CD6EBAA-D0D6-434A-B9EA-B144C05711BC@ellerman.id.au>
References: <1447843598-9355-1-git-send-email-mpe@ellerman.id.au> <vnkwk2oum9b8.fsf@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <vnkwk2oum9b8.fsf-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 5 December 2015 04:07:39 GMT+11:00, Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>On Wed, Nov 18 2015 at 09:46:38 PM, Michael Ellerman
><mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:
>> In order to check for overlapping reserved memory regions, we first
>need
>> to sort the array of memory regions. This is implemented using
>sort(),
>> and a custom comparison function __rmem_cmp().
>>
>> Unfortunatley __rmem_cmp() doesn't work in all cases. Because the two
>> base values are phys_addr_t, they may be u64 on some platforms, in
>which
>> case subtracting one from the other and then (implicitly) casting to
>int
>> does not give us the -ve/0/+ve value we need.
>>
>> This leads to incorrect reports about overlaps, eg:
>>
>>   ibm,slw-image@1ffe600000 (0x0000001ffe600000--0x0000001ffe700000)
>overlaps with
>>   ibm,firmware-allocs-memory@1000000000
>(0x0000001000000000--0x0000001000dc0200)
>>
>> Fix it by just doing the standard double if and return 0 logic.
>>
>> Fixes: ae1add247bf8 ("of: Check for overlap in reserved memory
>regions")
>> Signed-off-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
>> ---
>>  drivers/of/of_reserved_mem.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>
>Woops, thanks.
>
>Tested-by: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Thanks for testing.

Rob, can we get this merged for 4.4 please?

cheers 

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

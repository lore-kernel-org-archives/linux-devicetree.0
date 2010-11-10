From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [sodaville] [RFC] [PATCH V3 0/2] Adding DTB to architecture
	independent vmlinux
Date: Wed, 10 Nov 2010 13:33:11 -0800
Message-ID: <4CDB0F97.4040105@gmail.com>
References: <cover.1289411770.git.dirk.brandewie@gmail.com>
	<4CDAE874.1000707@linux.intel.com> <4CDAED3C.6010304@gmail.com>
	<4CDAEA26.6040206@linux.intel.com>
	<AANLkTimgLO0vAQiF4uwHkHnz7SHxiq+KD2iUYV_Y8-Fk@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTimgLO0vAQiF4uwHkHnz7SHxiq+KD2iUYV_Y8-Fk-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/10/2010 10:55 AM, Grant Likely wrote:
> On Wed, Nov 10, 2010 at 11:53 AM, H. Peter Anvin<hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>  wrote:
>> On 11/10/2010 11:06 AM, Dirk Brandewie wrote:
>>> On 11/10/2010 10:46 AM, H. Peter Anvin wrote:
>>>> On 11/10/2010 10:52 AM, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>>>
>>>>> The DTB's have been moved into the .init.data section.
>>>>
>>>> Writeable?  (As opposed to .init.rodata)?
>>>>
>>>
>>> That is what I remember from the conversation with Grant but I could be
>>> mistaken.  It is simple enough to move as long as the interested parties agree :-)
>>>
>>
>> Obviously.  I'd like to see it readonly unless there is an explicit
>> reason not to, of course.
>
> Definitely it should be ro
>

So I am a little confused (no big surprise :-)

objdump -h vmlinux shows in part:
3 .rodata       000d61b8  c1358000  01358000  00359000  2**5
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
10 __init_rodata 00003a90  c1450be0  01450be0  00451be0  2**5
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
13 .init.text    0002b297  c1488000  01488000  00489000  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
14 .init.data    0001e5e0  c14b32a0  014b32a0  004b42a0  2**5
                   CONTENTS, ALLOC, LOAD, DATA

There is no .init.rodata section that I can find.

It seems like correct place to park the DTB with the other init data in 
.init.data. section by adding the KERNEL_DTB macro to the INIT_DATA macro in 
vmlinux.lds.h.  This picks up the largest number of architectures that use 
vmlinux.lds.h. INIT_DATA gets picked up by

#define INIT_DATA_SECTION(initsetup_align)				\
	.init.data : AT(ADDR(.init.data) - LOAD_OFFSET) {		\
		INIT_DATA						\
		INIT_SETUP(initsetup_align)				\
		INIT_CALLS						\
		CON_INITCALL						\
		SECURITY_INITCALL					\
		INIT_RAM_FS						\
	}



We could go into the INIT_TEXT macro to get the blobs into a RO section but that 
seems kind of wrong.

IMHO if someone starts modifying things in .init.data and expect the changes to 
stick they deserve what they get.

Comments/Suggestions?

--Dirk

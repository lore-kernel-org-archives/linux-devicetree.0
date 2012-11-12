From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH Resend V2] dt: add helper function to read u8 & u16
	variables & arrays
Date: Mon, 12 Nov 2012 09:03:39 +0530
Message-ID: <CAKohponUFABC397w=dq7j+1f5QeiOX4BCOXv=OZSNOaOTmt9oQ@mail.gmail.com>
References: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar@linaro.org>
	<50991C41.50705@gmail.com>
	<CAOh2x==LNuSFftB1r8cyJ6TOqOVJfExMTUVxKZnS16wL4B8eBA@mail.gmail.com>
	<509FB25F.3030307@gmail.com>
	<CAKohpoksQ4ShO_QFAQORO2_oEgNtOeENFnX1C3gN_5POQSGexg@mail.gmail.com>
	<509FFF8B.3010707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <509FFF8B.3010707-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12 November 2012 01:12, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 11/11/2012 11:27 AM, Viresh Kumar wrote:
>> On 11 November 2012 19:42, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 11/06/2012 10:22 PM, viresh kumar wrote:
>>
>>>>                 cluster0: cluster@0 {
>>>> +                       data1 = <0x50 0x60 0x70>;
>>>> +                       data2 = <0x5000 0x6000 0x7000>;
>>>> +                       data3 = <0x50000000 0x60000000 0x70000000>;
>>>
>>> So there is a mismatch in our assumptions. You are just truncating
>>> 32-bit values. I assumed you were using the 8 and 16 bit sizes that are
>>> now supported in dts. I don't think we should just truncate values
>>> blindly. We have support for specifying 8 and 16 values now so you
>>> should use that and define that as part of a binding.
>>
>> Sorry couldn't get your point at all :(
>> What did you mean by "truncating 32 bit values" and how should we
>> tell via DT, that the value passed is 8 bit, 16 bit or 32 bit?
>>
>
> You are trying to retrieve an array of 8 or 16-bit values which are
> stored as 32-bit values in dtb. Why not define them in the binding as 8
> or 16 bit to begin with. Then there is never any ambiguity about their size.
>
> I don't think the size is stored in the dtb. It is only in the dts. You
> need to define the size in the binding definitions and use '/bits/'
> annotation. With this the data is packed. Then the array function used
> should match what the binding defines.

Aha, and in that case incrementing address by 4 in my patch will fail. Right?
Will fix it. Thanks for increasing my knowledge on this :)

--
viresh

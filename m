From: Aida Mynzhasova <aida.mynzhasova-Fmhy8gsqeTEvJsYlp49lxw@public.gmane.org>
Subject: Re: "powerpc/83xx: gianfar_ptp: select 1588 clock source through
 dts file" was added twice
Date: Mon, 14 Oct 2013 09:52:13 +0400
Message-ID: <525B868D.9080806@skitlab.ru>
References: <525962B2.8010100@skitlab.ru> <20131012.171110.246440214474931440.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131012.171110.246440214474931440.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13.10.2013 01:11, David Miller wrote:
> From: Aida Mynzhasova <aida.mynzhasova-Fmhy8gsqeTEvJsYlp49lxw@public.gmane.org>
> Date: Sat, 12 Oct 2013 18:54:42 +0400
>
>> Hi,
>>
>> recently I looked through commits in kernel/git/torvalds/linux.git and
>> I noticed that my patch (old and new version) was added twice (by
>> David S. Miller):
>>
>> e58f6f4fb4eada7867014bfaec898f03afbce5c2
>> 894116bd0e9b7749a0c4b6c62dec13c2a0ccef68
>>
>> I think this is not good, and only
>> e58f6f4fb4eada7867014bfaec898f03afbce5c2 should be added.
>
> Read the code history properly.
>
> First 894116bd0e9b7749a0c4b6c62dec13c2a0ccef68 got applied, as you say
> accidently.  Then I reverted it, see commit
> 3f3f0960aff951c5df6e42ce292d1593a2520646.
>
> Then I applied the correct version which is commit
> e58f6f4fb4eada7867014bfaec898f03afbce5c2.
>
> I didn't respond at all the first time you pointed this out hoping
> you would figure it out on your own.
>

Oh...right...
Please accept my apology.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

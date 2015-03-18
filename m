From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Tue, 17 Mar 2015 19:52:12 -0600
Message-ID: <5508DA4C.6050800@wwwdotorg.org>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-2-git-send-email-eric@anholt.net> <20150303080550.GF6976@x1> <87vbih98za.fsf@eliezer.anholt.net> <54F66FDD.2040409@wwwdotorg.org> <87egothkaf.fsf@eliezer.anholt.net> <55079AA0.5090904@wwwdotorg.org> <87vbhzl9t1.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vbhzl9t1.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/17/2015 01:10 PM, Eric Anholt wrote:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
> 
>> On 03/12/2015 05:23 PM, Eric Anholt wrote:
>>> Device base maintainers weren't excited about my patch for 
>>> -EPROBE_DEFER, because then a new DT would mean we start
>>> failing to probe the USB driver in an older kernel, which
>>> whould be a regression in the case that the user had U-Boot
>>> setting up USB for them.
>> 
>> The main ABI issue is that old DTs should work with new kernels.
>> The other way around is nice, but certainly not as strict a
>> requirement. I don't think that should block a change. Do you
>> have a link to the thread; I don't think I noticed it.
> 
> http://comments.gmane.org/gmane.linux.kernel/1906119

Hmm. I think that in general, the Linux kernel has already chosen
deferred probe as the ordering mechanism over fixed init levels, which
have demonstrably been unable to solve all ordering problems in the
past. As Kevin pointed out, new DT with old kernel isn't the most
important use-case. The only other objection I saw was Ulf not wanting
to introduce another "probe scenario", but I guess he changed his mind
since he outlines the steps to make deferred probe work in a later email.

I guess/hope the way forward is to either wait for PM domains to work
with deferred probe, or push that work forward (i.e. implement part
(1) mentioned in Ulf's Mar 16 email).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: next/master build: 214 builds: 26 failed, 188 passed, 28 errors,
 6333 warnings (next-20171107)
Date: Tue, 7 Nov 2017 09:52:36 -0800
Message-ID: <2a051ef8-d383-ffd9-e79b-34a2701e44c9@caviumnetworks.com>
References: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com>
 <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "kernelci.org bot" <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
Cc: Kernel Build Reports Mailman List <kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/07/2017 04:15 AM, Arnd Bergmann wrote:
> On Tue, Nov 7, 2017 at 7:59 AM, kernelci.org bot <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org> wrote:
> 
>> Errors summary:
>> 20 arch/mips/include/asm/smp.h:32:29: error: 'CONFIG_MIPS_NR_CPU_NR_MAP' undeclared here (not in a function)
> 
> I have reported this before, as did 0day, but I don't know if anyone
> is fixing this:
> 
>

Yes, Steven sent a patch to fix this back on Oct. 2:

https://patchwork.linux-mips.org/patch/17400/

Ralf seems AWOL with respect to this issue.

Perhaps the alternate MIPS maintainer James Hogan can try to get the fix 
merged.

David Daney

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

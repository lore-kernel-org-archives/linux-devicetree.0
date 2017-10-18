From: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
Date: Wed, 18 Oct 2017 16:11:33 +1100
Message-ID: <87k1zt82gq.fsf@linux.vnet.ibm.com>
References: <20170905202339.20732-1-wak@google.com> <20170921095930.4b473f91@bbrezillon> <CAPnigKmBujCoKdtXwnK6YsU=YvXM+MaDvDvKpUXEVgHzOC-VEw@mail.gmail.com> <8760cbv090.fsf@concordia.ellerman.id.au> <20171016175517.264e710a@bbrezillon> <CAL_JsqLBkU9habdOhoQ8ZiM=x87eLmuLrS6ujx32UOv8LHc=EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLBkU9habdOhoQ8ZiM=x87eLmuLrS6ujx32UOv8LHc=EA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, William Kennington <wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd@lists.infradead.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> I'd prefer they be documented in the kernel especially if they are
> used by the kernel. Of course, there's IBM bindings covered by various
> ?PAPR specs which wouldn't make sense to duplicate, but I'm guessing
> what's documented in skiboot are not covered by those specs.

Correct.

I don't have an objection to docs being in both places, as long as we
could keep both in sync. Would suitable comments in the RST doc files
pointing to the skiboot repo as the canonical copy work?

I'd like to be able to just diff a subtree of kernel and skiboot to see
if the docs have diverged.

We may also need to think of a way to ensure that any of that moving
back/forth of edits is done in a way that makes licensing sense too
(skiboot is Apache 2.0)

-- 
Stewart Smith
OPAL Architect, IBM.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

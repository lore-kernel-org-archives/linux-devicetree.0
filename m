From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [0/10] dtc: Assorted parsing and error reporting cleanups
Date: Fri, 03 Jan 2014 13:51:25 -0600
Message-ID: <E1VzAmD-0001xi-DA@jdl.com>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> This series consists of a number of small fixes and cleanups, mostly
> to error reporting in the lexer and parser.  I hit these as minor
> annoyances while experimenting with improved expression and schema
> support.
> 
> I'm sending these out for some review, before committing them to the
> main branch.
> 
> These patches are also in the 'errors' branch on the repository - note
> that I'm treating that as an experimental branch, and therefore
> subject to rebasing at whim.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

With one typo correction, s/strong/string/, in patch 07/10's
commit message, please:

Acked-by: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>

for the whole series.

Thanks,
jdl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [0/10] dtc: Assorted parsing and error reporting cleanups
Date: Sat,  4 Jan 2014 00:24:33 +1100
Message-ID: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series consists of a number of small fixes and cleanups, mostly
to error reporting in the lexer and parser.  I hit these as minor
annoyances while experimenting with improved expression and schema
support.

I'm sending these out for some review, before committing them to the
main branch.

These patches are also in the 'errors' branch on the repository - note
that I'm treating that as an experimental branch, and therefore
subject to rebasing at whim.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

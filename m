From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [0/10] RFC: A new start on richer dtc expression support [REPOST]
Date: Thu, 27 Feb 2014 22:21:29 +1100
Message-ID: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I previously sent these patches to the new devicetree-compiler, but I
suspect not many people had subscribed so I'm resending to the
devicetree list.

So, we've been talking about richer expression / constant / function /
macro support for dtc since forever.  So far attempts to start on that
haven't gotten very far (in large part because of my pickiness about
new syntax).

Anyway, I've started having a new crack at this.  This patch series
implements the infrastructure for "runtime" evaluated expressions.
For now they're just constructed and immediately evaluated, so they're
not quite usable for user-defined functions yet, but it's a big step
towards that.

10/10 is the only patch in this series which implements new
user-visible functionality, the rest are just internal reworking.
10/10 experiments with the new mechanisms to implement string append
and repeat operators - I'm not 100% sure if I'm happy with the syntax
used for this yet (overloaded + and *, like Python).  Suggestions
welcome.

This is indirectly relevant to the schema checking concepts current
much discused.  Any schema language is likely to want richer
expression support than we currently have to be useful.  In addition,
I expect we'll need data structures very similar to the expression
trees implemented here to keep track of schema "patterns" or other
pieces.

These patches can also be found in the 'expressions' branch at
git://git.kernel.org/pub/scm/utils/dtc/dtc.git.  [NOTE: I'm
considering this an experimental branch for now, which will be rebased
at whim].
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

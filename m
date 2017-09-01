From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: still unclear on a couple DT questions from my initial post
Date: Fri, 1 Sep 2017 01:29:31 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1709010121140.20957@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


  again, more nitpicky pedantry, but from my initial post, i'm still
unclear on a couple things.

  first, a number of powerpc .dts files contain the line:

    dcr-parent = <&{/cpus/cpu@0}>;

and it's not clear to me why there are curly braces there. that is the
only example of that, but i see no mention of that in the spec. is it
meaningful? or are they superfluous?

  also, the spec states that status could be set to "okay", but a pile
of .dts files in the current kernel have the shorter form:

  status = "ok";

and the current kernel code in drivers/of explicitly accepts both
forms. is that a formal spec property, or is the kernel code simply
allowing people to be sloppy?

  i think that's it for now, thanks for your patience.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

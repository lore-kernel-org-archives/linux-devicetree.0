From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: is there any value in unreferenced <linux,phandle> assignments?
Date: Tue, 24 May 2016 06:49:40 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1605240643210.31752@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


  apologies for what i'm sure is a trivial question, but is there any
point in a .dts file having "linux,phandle" assignments that are
unreferenced from anywhere in the final source file?

  i ask only because i've been handed a .dts file that admittedly
works just fine, but it contains a number of lines of the form:

  linux,phandle = <some-number>;

where none of those numeric phandles are referenced from anywhere else
in the source file (even after processing any .dtsi files).

  one possibility is that those are leftovers before someone started
adding labels to nodes, and referring to them like that, but in my
case, the nodes defining those phandles don't even have labels, so
that seems fairly pointless.

  is there any other explanation for them? thanks.

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

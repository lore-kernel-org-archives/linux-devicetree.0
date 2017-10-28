From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: DT best practices for defining multiple closely-related boards
Date: Sat, 28 Oct 2017 05:19:23 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1710280514300.8772@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


  much shorter followup to previous note -- if we extend all that to
defining, say, two very closely-related boards, the acme "coyote1" and
"coyote2", then all i should end up needing (at most) is two new .dts
files:

  coyote1.dts
  coyote2.dts

both of which could include (among other things) common coyote content
in:

  coyote.dtsi

and that's it. unless there's something really novel about these
boards, all other content should come from kernel-supplied .dtsi
files, yes? and, once again, i'm asking since the design i was handed
again copies kernel-supplied .dtsi files and modifies them, apparently
for no other reason than to remove properties, which should have been
done with /delete-property/.

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

From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: aesthetic standard for /delete-node/ and /delete-property/?
Date: Sat, 28 Oct 2017 15:02:03 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1710281501490.14260@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


  wildly nitpicky pedantry ... what is the preferred spacing for stuff
like:

/delete-node/ cpu@1;
/delete-node/ cpu@1;
/delete-node/&ipu1_di0_hdmi;
/delete-node/&hdmi_mux_0;
/delete-node/&ipu1_di1_hdmi;
/delete-node/&hdmi_mux_1;

and

/delete-property/turbo-mode;
/delete-property/interrupts-extended;
/delete-property/ mmc1;
/delete-property/ mmc1;

  space after the second slash, or no? obviously, both work but i'm a
stickler for uniformity.

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

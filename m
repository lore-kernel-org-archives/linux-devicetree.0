From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: [OT?] basic question about proper .dts file design
Date: Sat, 28 Oct 2017 05:12:52 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1710280440350.7672@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


  (apologies if this is such a basic question that it doesn't belong
here, but i want to make sure i'm using DT best practices in what i'm
about to do.)

  i've been handed a project that defined a couple new
(closely-related) boards similar to imx6dl sabresd where someone else
created the defining .dts files, and they were created in a weird way,
so i just want to confirm what the *correct* way would be.

  first, let's say i am the acme corp, and i want to define a single
new board called the "coyote" (yes, i know there's a coyote board out
there, but i can't resist.) if the basis of this board is the imx6dl,
then all i should need to do is create a single new .dts file, say,
"coyote.dts", and that's it. i should not have to create any
*additional* files -- my .dts file should contain only that which is
specific to my new board and, from that point on, i should be able to
include the standard .dtsi files that come with the linux kernel
related to imx6dl.

  for example, in the case of the existing "imx6dl-sabresd.dts",
here's the entire file:

  #include "imx6dl.dtsi"
  #include "imx6qdl-sabresd.dtsi"

  / {
        model = "Freescale i.MX6 DualLite SABRE Smart Device Board";
        compatible = "fsl,imx6dl-sabresd", "fsl,imx6dl";
  };

  &ipu1_csi1_from_ipu1_csi1_mux {
        clock-lanes = <0>;
        data-lanes = <1 2>;
  };

which corresponds to what i just said -- file should contain only that
content which distinguishes this board, and *all* *else* should be
taken from the relevant kernel-supplied .dtsi files.

further, the content of the defining .dts file can contain three basic
types of content:

  - adding new stuff
  - modifying existing stuff
  - deleting included stuff

i'm asking this since, in the project i was handed, there is a short,
top-level defining .dts (so far, so good), but it goes on to include a
*local* file named "baseqdl.dtsi", and i didn't understand why one
would need to define an underlying .dtsi file that would be equivalent
to something already supplied by the kernel, until i saw it included
this:

  / {
        aliases {
                ethernet0 = &fec;
                can0 = &can1;
                can1 = &can2;
               ... snip...
               //mmc0 = &usdhc3;    <---- AHA!

obviously(?), the original author wanted to delete that node from the
final generated device tree, but was unaware of the /delete-property/
directive (this project goes back at least a couple years), so that
author simply duplicated one of the underlying .dtsi files, for the
sole purpose of removing that node. does anything else make sense?

  as i read it, the proper approach would have been to do what is done
in, say, "imx6ul-tx6ul-0010.dts":

  #include "imx6ul.dtsi"
  #include "imx6ul-tx6ul.dtsi"

  / {
        model = "Ka-Ro electronics TXUL-0010 Module";
        compatible = "karo,imx6ul-tx6ul", "fsl,imx6ul";

        aliases {
                /delete-property/ mmc1;
        };
  };

am i understanding this correctly? i realize i took the long way to
get here, i just want to confirm that defining a new board should
require nothing more than a single .dts file, and the only reason the
aforementioned author did it that way was simply being uanware of the
existence of /delete-property/.

  another short note coming soon, since i think i've blathered on
sufficiently here.

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

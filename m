From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: puzzled by online explanation as to how to "overwrite" DT node
Date: Wed, 18 Oct 2017 12:40:46 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1710180612160.4201@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


  (WARNING: sort of newbie alert, but you know that, right? :-)

  was perusing online tutorial on customizing device trees here:

    http://developer.toradex.com/device-tree-customization

and got a bit confused about the part describing how to (as i read it)
"overwrite" entire nodes.

  first, part on "overwriting properties" makes perfect sense --
here's an example in that piece about overwriting default USB mode:

  &usb0 {
      dr_mode = "host";
  };

so, as i've always understood it, the above will do one of two things:

  1) if that property is not set in the node referenced by that label,
     it will be *added* to what is already there, or

  2) if that property is already set (to whatever), it will be
     overwritten

so far, so good?

  as a special example of that right below that, there's a short
paragraph called "Activating/Deactivating Devices" that uses this
example:

  &uart4 {
      status = "okay";
  };

but, really, that's just a special case of the first example so
there's nothing new here. but it's the next section called
"Overwriting nodes" that seems confusing:

  "Whole nodes can be overwritten by simply redefining them. Like
  overwriting properties, latter definitions overwrite earlier
  definitions."

wait, what? entire nodes can be overwritten by redefining them? the
example given looks like this:

  "E.g. to overwrite the pin configuration of Vybrids UART2 (UART_B)
  overwrite the uart2grp node by simply redefining it in your device
  tree ..."

with the device tree content

  &iomuxc {
      vf610-colibri {
          pinctrl_uart2: uart2grp {
              fsl,pins = <
                  VF610_PAD_PTD0__UART2_TX        0x21a2
                  VF610_PAD_PTD1__UART2_RX        0x21a1
              >;
          };
          ...
      };
  };

hang on ... isn't "vf610-colibri" also a "node" in this device tree?
does the above mean that the *entire* vf610-colibri node is being
overwritten? and that i would have to supply the entire new content of
that node, including simply duplicating the rest of the content that
is already there that i want to keep? (is that what the "..."
represents?)

  that seems bizarre, but it's what that wording seems to suggest. can
someone clarify what would happen in the above, and give perhaps a
link to the part of the DTspec that covers this? i'm sure i must be
misreading this.

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

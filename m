From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Lots of "Warning (unit_address_vs_reg): Node /blah/blah/blah has a
 unit name, but no reg property"
Date: Mon, 30 Jan 2017 09:55:01 +0000
Message-ID: <1485770101.2451.40.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I recently updated the device-tree-compiler package on the system which
builds the split device tree repo[0] from 1.4.0+dfsg-2 to 1.4.2-1
(debian package versions) and now during the test build I see many
(over 1,000) of these:

    Warning (unit_address_vs_reg): Node /soc@ff700000/ethernet@b0000 has a unit name, but no reg property

Is this something which is known? Maybe Linux hasn't pulled in the
newer dtc yet so you aren't hitting it yet, or maybe you've done what I
did as a quick fix and added:
    DTC_FLAGS="-W no-unit_address_vs_reg"
?

(a second issue is the lack of the offending filename in the
warning message, I'll figure out the right venue for that next)

Ian.

[0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

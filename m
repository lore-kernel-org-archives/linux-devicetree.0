From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Overlays and boolean properties
Date: Tue, 29 Nov 2016 13:06:16 +0000
Message-ID: <a02487bb-6f79-fe4d-8180-86375b9413b9@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Boolean properties are defined as being properties with no content, that
are true if present and false if absent. They pose a problem for DT
overlays, since the proposed (and widely used) overlay mechanism does
not allow for properties (or nodes) to be deleted; overlays can only
make a false property true, so boolean properties are effectively
monostable - once true they become immutable.

The standard DT syntax includes /delete-property/ and /delete-node/
directives that do what you would expect from their names, but that
facility is not available to overlays. There is no FDT node that
represents the deletion - the directives are acted on immediately - so
we would need some extra markup - say __delete_property__ and
__delete_node__ - to hold the names of items to be deleted.

Before I take this further, does anybody have any thoughts on the idea?

Phil

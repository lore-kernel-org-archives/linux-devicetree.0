Return-Path: <SRS0=QZ+J=IY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:43518 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751900AbeFFVgx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Jun 2018 17:36:53 -0400
From: Mats Karrman <mats.dev.list@gmail.com>
Subject: USB role switches, usb-connector, typec and device trees
Message-ID: <6c379a23-5c63-9b49-9444-e16d6a8082a6@gmail.com>
Date: Wed, 6 Jun 2018 23:36:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello Gentlemen,

I'm trying to get my head around USB role switches in connection with Type-C ports
and device-trees. So far I have not found much documentation, e.g. there are no
device-tree bindings documented and really no good examples in existing device
trees, although there has been some attempts, e.g. [1] and [2]. Anyway, so I send
you a couple of questions instead:

1) tcpm uses the port device struct to find a single usb_role_switch but there is
room for three USB busses in the Type-C connector; one high speed and two (?) super-
speed. These would not all come from the same controller (there might even be
separate controllers for host and device mode for each bus).
The case I am working on now only have a single USB2 otg controller so it should
be possible to make that driver register a role switch but for other cases?
I imagine it would be possible to create a composite driver as a proxy for all role
switches but that would probably be different for every platform/product - not
very elegant. Could the role switch infrastructure be extended to handle arbitrary
sets of coordinated switches?

2) How should the connection between the Type-C port and the switches best be
expressed in a device tree? Using graph I presume, but should it be mixed into the
existing "usb-connector" or should this be a separate block?
I think it is unfortunate that the graph use numeric addresses that need to be
fixed by documentation and already I see problems with the current assignment
(0=HS, 1=SS, 2=SBU), e.g. if the host and device mode are handled by different
controllers. Graph do support multiple endpoints for one port but then we have
another level of magic numbers which does not exactly make things easier
(e.g. 0=dual or host controller, 1=device controller, 2=mode switch).

What are your thoughts on this? Please tell me I missed something and that there is
a simple solution :-)

BR // Mats

[1] https://www.spinics.net/lists/linux-usb/msg168071.html
[2] https://www.spinics.net/lists/linux-usb/msg168072.html


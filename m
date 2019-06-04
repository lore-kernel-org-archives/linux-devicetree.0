From: Phil Elwell <phil@raspberrypi.org>
Subject: Dynamic overlay failure in 4.19 & 4.20
Date: Tue, 4 Jun 2019 13:15:26 +0100
Message-ID: <c5af11eb-afe5-08c4-8597-3195c25ba1d5@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

In the downstream Raspberry Pi kernel we are using configfs to apply overlays at
runtime, using a patchset from Pantelis that hasn't been accepted upstream yet.
Apart from the occasional need to adapt to upstream changes, this has been working
well for us.

A Raspberry Pi user recently noticed that this mechanism was failing for an overlay in
4.19. Although the overlay appeared to be applied successfully, pinctrl was reporting
that one of the two fragments contained an invalid phandle, and an examination of the
live DT agreed - the target of the reference, which was in the other fragment, was
missing the phandle property.

5.0 added two patches - [1] to stop blindly copying properties from the overlay fragments
into the live tree, and [2] to explicitly copy across the name and phandle properties.
These two commits should be treated as a pair; the former requires the properties that
are legitimately defined by an overlay to be added via a changeset, but this mechanism
deliberately skips the name and phandle; the latter addresses this shortcoming. However,
[1] was back-ported to 4.19 and 4.20 but [2] wasn't, hence the problem.

The effect can be seen in the "overlay" overlay in the unittest data. Although the
overlay appears to apply correctly, the hvac-large-1 node is lacking the phandle it
should have as a result of the hvac_2 label, and that leaves the hvac-provider property
of ride@200 with an unresolved phandle.

The obvious fix is to also back-port [2] to 4.19, but that leaves open the question of
whether either the overlay application mechanism or the unit test framework should have
detected the missing phandle.

Phil

[1] 8814dc46bd9e ("of: overlay: do not duplicate properties from overlay for new nodes")
[2] f96278810150 ("of: overlay: set node fields from properties when add new overlay node")

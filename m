From: Saravana Kannan <saravanak@google.com>
Subject: Adding depends-on DT binding to break cyclic dependencies
Date: Wed, 21 Aug 2019 23:54:55 -0700
Message-ID: <CAGETcx_pSnC_2D7ufLRyfE3b8uRc814XEf8zu+SpNtT7_Z8NLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Frank, Greg and I got together during ELC and had an extensive and
very productive discussion about my "postboot supplier state cleanup"
patch series [1]. The three of us are on the same page now -- the
series as it stands is the direction we want to go in, with some minor
refactoring, documentation and naming changes.

However, one of the things Frank is concerned about (and Greg and I
agree) in the current patch series is that the "cyclic dependency
breaking" logic has been pushed off to individual drivers using the
edit_links() callback.

The concern being, there are going to be multiple device specific ad
hoc implementations to break a cyclic dependency. Also, if a device
can be part of a cyclic dependency, the driver for that device has to
check for specific system/products in which the device is part of a
cyclic dependency (because it might not always be part of a cycle),
and then potentially have cycle/product specific code to break the
cycle (since the cycle can be different on each system/product).

One way to avoid all of the device/driver specific code and simplify
my patch series by a non-trivial amount would be by adding a
"depends-on" DT binding that can ONLY be used to break cycles. We can
document it as such and reject any attempts to use it for other
purposes. When a depends-on property is present in a device node, that
specific device's supplier list will be parsed ONLY from the
depends-on property and the other properties won't be parsed for
deriving dependency information for that device.

Frank, Greg and I like this usage model for a new depends-on DT
binding. Is this something you'd be willing to accept?

Thanks,
Saravana

[1] - https://lore.kernel.org/lkml/20190731221721.187713-1-saravanak@google.com/

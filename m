From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 0/3] usb: usb251xb: Add upstream port lanes polarity inversion
Date: Thu, 25 Apr 2019 00:12:04 +0300
Message-ID: <20190424211208.17499-1-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Serge Semin <Sergey.Semin@t-platforms.ru>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A while ago I created an original patchset with functionality of any ports
inversion setting implemented. But while I was busy with another work,
Marco' version of the similar code has already been upstreamed.
So I decided to at least refactor my patchset extracting alterations,
which I think might be useful in the driver.

Even though the Marco' implementation was correct in general, it lacked a
small specific detail. The polarity inversion property might be setup for
downstream and upstream ports. Both of these cases are covered by current
'swap-dx-lanes' property implementation, but there is no any mentioning
about number 0 being considered as Upstream port of the hub. This might be
confusing seeing the rest of the port-related properties accept
only the ports starting from 1 (which is starting number of downstream
ports) and don't support number 0. So in order to unify the 'swap-dx-lanes'
property with the rest port-related ones, I'd suggest to make it being
responsible for downstream ports only, while upstream port lanes inversion
would be enabled by setting a new 'swap-us-lanes' boolean property. Current
property names mnemonic also fits quiet well for this update.

In addition the usb251xb_get_ofdata() method is getting to be too
complicated with obvious identical peaces of code. In particular it
concerns the ports-related properties like 'non-removable-ports',
'sp-disabled-ports' and 'bp-disabled-ports'. We can simplify the code
responsible for the properties handling by moving a common part into
a dedicated method. Needless to say that in case if the suggestion made
above regarding the 'swap-dx-lanes' property alteration is accepted,
the same could be done for parsing it' code as well.

So all of these updates are implemented in the patches of this small
series.


Serge Semin (3):
  usb: usb251xb: Add US lanes inversion dts-bindings
  usb: usb251xb: Create a ports field collector method
  usb: usb251xb: Add US port lanes inversion property

 .../devicetree/bindings/usb/usb251xb.txt      |  6 +-
 drivers/usb/misc/usb251xb.c                   | 73 +++++++------------
 2 files changed, 32 insertions(+), 47 deletions(-)

-- 
2.21.0

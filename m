From: =?UTF-8?B?5byg5rOi?= <zbsdta@gmail.com>
Subject: How delete node or property in overlayd dts?
Date: Tue, 14 Aug 2018 22:46:50 +0800
Message-ID: <CADUUTHBZ---U7YNYYry7qJY=vt_QpXpytymqJQc9xLFE_NjsAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

/delete-node/ /delete-prop/ could be used in dtsi files without device
tree overlay.

but with device tree overlay,  /delete-node/ and  /delete-prop/ are not work.
How to delete property and node in overlay dts?

for example,
in basel.dts have following node
node1 {
    property1;
    property3;
    node2 {
        property2;
    }
}

in overlay.dts as following
 node1 {
    /delete-property/ property1;
    /delete-node/ node2;
}

after overlay, property1 and node2 is not deleted.

From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH RFC 0/4] Adding DT functionality to w1 busses
Date: Tue, 19 Jun 2018 23:27:40 +0200
Message-ID: <20180619212744.794-1-daniel@zonque.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: zbr@ioremap.net, robh+dt@kernel.org, mark.rutland@arm.com, szabolcs.gyurko@tlt.hu
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

In order to fully move battery-supplied devices over to devicetree, the
onewire subsystem must get some updates.

Currently, the w1 bus system works like this. Device families, such as
battery controllers etc, are registered to the w1 core. Once a master
device is probed, it starts scanning the bus. Slave devices that are
revealed through this scan and that match previously registered
families are then registered, and their .add_slave() callback is
invoked.

Some devices, such as the ds2760, use that callback to call
platform_device_alloc() at runtime with a fixed device name to
instanciate their only user. That user does the actual work, while the
slave device merely functions as an I/O proxy. In the user
implementation, the w1 slave device is accessible through
dev->parent.

Now, for devicetree environments, this has to change a bit. First, slave
devices need to have a matching table so they can be listed as sub-nodes
of their master bus controller. Second, the core needs to match the
entries in these tables against the sub-nodes of the master node.
These two are trivial to do.

The next question is how the w1 slave device and its user(s) are linked
together. I'm proposing a DT layout with the following example:

	onewire {
		compatible = "w1-gpio";

		w1_slave: slave@0 {
			compatible = "maxim,w1-ds2760";
		};
	};

	battery-supply {
		compatible = "maxim,ds2760-supply";
		w1-slave = <&w1_slave>;
	};

Another option would be to place the supply user as another nested node
under the slave device, but I'm not sure if that's beneficial. I'm open
to discussions though.

This patch set implements the changes for the above in the w1 core.
Changing the supply users is left for later when the basics have
settlerd, but a helper to reference slave devices through phandles is
already provided.


Thanks,
Daniel


Daniel Mack (4):
  dt-bindings: w1: document sub-node bindings for DS2760
  w1: core: match sub-nodes of bus masters in devicetree
  w1: core: provide helper to look up w1 slaves through devicetree nodes
  w1: ds2760: add devicetree matching glue

 .../devicetree/bindings/w1/w1-ds2760.txt      |  9 +++++
 .../devicetree/bindings/w1/w1-gpio.txt        |  6 +++
 Documentation/devicetree/bindings/w1/w1.txt   | 17 ++++++++
 drivers/w1/slaves/w1_ds2760.c                 | 15 ++++++-
 drivers/w1/w1.c                               | 40 +++++++++++++++++++
 include/linux/w1.h                            | 13 ++++++
 6 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/w1/w1-ds2760.txt
 create mode 100644 Documentation/devicetree/bindings/w1/w1.txt

-- 
2.17.1

From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 0/3] mailbox: arm: introduce smc triggered mailbox
Date: Mon, 24 Jul 2017 00:23:23 +0100
Message-ID: <1500852206-28771-1-git-send-email-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBOPB2TFQKGQEQPZIKAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alex Graf <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a reworked version of my previous post. It addresses Jassi's
comments on the driver and also tries to cover Rob's and Mark's comments
on the binding documentation.
I dropped the more example-like DT changes from v1, as they are actually
not meant to be merged into the Linux tree, but instead are provided as
part of some firmware actually implementing this functionality.

Please let me know what you think.

Cheers,
Andre.

P.S. Leaving for holidays in a few hours, so don't expect timely answers.
-------------------

The traditional Linux mailbox mechanism uses some kind of dedicated hardware
IP to signal a condition to some other processing unit, typically a dedicated
management processor.
This mailbox feature is used for instance by the SCPI protocol to signal a
request for some action to be taken by the management processor.
And while it seems useful to have a dedicated management core to provide
those services offered via the SCPI protocol, a separate and independent
execution unit is not always required, for instance for just setting up
a clock or enabling a device power supply. Those services could be as well
provided by firmware code running on the very same application processor
cores as the OS, using the ARM TrustZone mechanism to protect and abstract
those services. And while the existing SCPI implementation uses a rather
flexible shared memory region to communicate commands and their parameters,
it still requires a mailbox to actually trigger the action.

This patch series provides a Linux mailbox compatible service which uses
smc calls to invoke firmware code, for instance taking care of SCPI requests.
The actual requests are still communicated using the standard SCPI way of
shared memory regions, but a dedicated mailbox hardware IP can be replaced via
this new driver, which not only serves as a trigger for the request, but also
transfers execution to the firmware code in a safe and architected way.

This simple driver uses the architected SMC calling convention to trigger
firmware services, also allows for using "HVC" calls to call into hypervisors
or firmware layers running in the EL2 exception level.

Patch 1 contains the device tree binding documentation, patch 2 introduces
the actual mailbox driver, and patch 3 enables the driver in Kconfig.

Please note that this driver just provides a generic mailbox mechanism,
though this is synchronous and one-way only (triggered by the OS only,
without providing an asynchronous way of triggering request from the
firmware).
And while providing SCPI services was the reason for this exercise, this
driver is in no way bound to this use case, but can be used generically
where the OS wants to signal a mailbox condition to firmware or a
hypervisor.
Also the driver is in no way meant to replace any existing firmware
interface, but actually to complement existing interfaces.

Please have a look and comment whether this sounds like a useful addition
to the kernel.

Cheers,
Andre.

[1] https://github.com/apritzel/arm-trusted-firmware/commits/allwinner-scpi-wip

Andre Przywara (3):
  DT: mailbox: add binding doc for the ARM SMC mailbox
  mailbox: introduce ARM SMC based mailbox
  mailbox: Kconfig: enable ARM SMC mailbox on 64-bit Allwinner SoCs

 .../devicetree/bindings/mailbox/arm-smc.txt        |  76 ++++++++++
 drivers/mailbox/Kconfig                            |   9 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/arm-smc-mailbox.c                  | 155 +++++++++++++++++++++
 4 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/arm-smc.txt
 create mode 100644 drivers/mailbox/arm-smc-mailbox.c

-- 
2.8.2

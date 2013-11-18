From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: device tree cpu node 'compatible' string when using
 KVM_ARM_PREFERRED_TARGET vcpu
Date: Mon, 18 Nov 2013 19:40:22 +0000
Message-ID: <CAFEAcA9nmruvf52A4whSTbZFRBhtcCAxvdn5PCJjRGF0ouUWWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "kvmarm-FPEHb7Xf0XXUo1n7N8X6UoWGPAHP3yOg@public.gmane.org" <kvmarm-FPEHb7Xf0XXUo1n7N8X6UoWGPAHP3yOg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The KVM API has an ioctl KVM_ARM_PREFERRED_TARGET which we can use
to create virtual CPUs of whatever the host CPU's "preferred" type
is (typically "same as host"). This allows userspace to create a
VCPU for best performance without having to have specific knowledge
about that CPU.

However there's a slight wrinkle when userspace comes to create the
device tree to pass to the guest kernel. The device tree binding
for v7 says that the cpu nodes in the device tree must have a
"compatible" string, and the only valid values it lists all nail
things down to an exact CPU model. Requiring userspace to have
an explicit mapping table of target values to dtb compat strings
defeats the point of userspace not having to have hardcoded knowledge
of all CPU types.

This problem doesn't exist for v8, because there the compat
string is always "arm,arm-v8", indicating that the kernel
doesn't care beyond "this is a v8 CPU of some kind".

In fact I'm told that for v7 the kernel doesn't care either (both
because it needs to know about the CPU type much earlier than it
has access to information in the dtb and also because this is
all probeable via ID registers anyhow). So the obvious solution
would be for userspace to pass a 'compatible' string "arm,arm-v7"
(which the kernel will ignore anyway).

Does anybody see a problem with this approach? If it seems like a
good plan, how do we go about getting it put into the official
device tree binding docs?

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

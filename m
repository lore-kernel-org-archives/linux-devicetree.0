From: Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Secure resources in device trees
Date: Tue, 20 Jan 2015 13:15:51 -0600
Message-ID: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The addition of ARM security extension (TrustZone) support to QEMU has
exposed the issue of how secure resources are communicated to secure
software responsible for booting the HLOS.  The natural choice for
communicating these details is the device tree.

In the case of real hardware, the device tree supplied to the HLOS
only needs to describe non-secure resources as secure software can
rely on static knowledge about the hardware.  This also holds true for
QEMU machines modeled after actual fixed hardware configurations.
However, this is not the case with QEMU's virtual machine models, such
as machvirt, where the hardware configuration can change over time.
In this case, secure software is dependent on QEMU's dynamically
constructed device tree to describe the hardware, making it impossible
for secure software to know ahead of time what is secure, non-secure,
or both.

Two possible approaches for handling this particular case are:

1) Create two device tree blobs; one describing the non-secure
configuration and the other the full configuration.  This would allow
secure software to see the full hardware picture including secure
resources while the non-secure world would only see the non-secure
device tree configuration.  The QEMU virt machine would be responsible
for producing the device tree blobs.

The drawbacks to this approach are:
* There are 2 device trees to manage
* The two DTBs will typically be almost identical.
* Not possible to identify whether a device is shared or not between
the secure and non-secure worlds.
* Identifying device available only to the secure world require
cumbersome comparison of the two device trees.
* A mechanism would be needed to pass an additional device tree.

2) Modify the standard device tree blob to include annotations or
modifications to describe which resources are secure or not.  In this
case, secure software would use the single device tree to identify the
secure resources.  The added information could be used by secure
software to trim the device tree before passing it.  Alternatively,
the information could be passed on to non-secure software with the
expectation that it would honor the device security.   It would be
crucial that any data added to the device tree adhere to existing
conventions or expectations.

The drawbacks to this approach are:
* Additional secure state details. potentially unrecognized by current
consumers,  would need to be added to the device tree.
* Unless a mechanism already exists, the new secure property runs the
risk of breaking backwards compatibility.
* Secure firmware is responsible for understanding and possibly
filtering the secure device tree data.

Feedback welcomed.

Greg
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

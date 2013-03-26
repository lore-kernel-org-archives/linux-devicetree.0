From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3] USB: PHY: Palmas USB Transceiver Driver
Date: Tue, 26 Mar 2013 10:22:14 -0600
Message-ID: <5151CB36.1050404@wwwdotorg.org>
References: <1362662506-14823-4-git-send-email-kishon@ti.com> <1364203926-24488-1-git-send-email-kishon@ti.com> <51501CFB.4020905@nvidia.com> <51513A40.7080905@ti.com> <515163F6.3010400@slimlogic.co.uk> <51516695.8020808@nvidia.com> <51516A10.40704@slimlogic.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51516A10.40704-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Rajendra Nayak <rnayak-l0cyMroinI0@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "s-guiriec-l0cyMroinI0@public.gmane.org" <s-guiriec-l0cyMroinI0@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/26/2013 03:27 AM, Graeme Gregory wrote:
...
> If we are tightly coupling as above then using platform_irq is an extra
> inefficiency. You both have to populate this then parse it afterwards.
> Why not just use the regmap helper? Ill admit this code is like this as
> there was a period where platform irqs in DT just was not working right!
> 
> We should really agree now if we are going for loose or tight coupling
> now rather than keep switching?

Yes, this is something that I think needs to be fully resolved before
any more Palmas patches are discussed.

So you can have the MFD components fully coupled or completely
standalone. We should fully pick one or the other, not some mish-mash of
the two.

In practical terms, this means that:

a) Tightly coupled

The top-level MFD device knows exactly which child devices are present.
It has an internal table to defined the set of child devices, and
instantiate them. It provides them with IRQs, I2C addresses and register
base addresses (or regmaps), etc. etc., using purely Palmas-internal
APIs. If using device tree, the DT won't include any representation of
which child devices are present, nor their I2C addresses, nor their
register addresses, nor their IRQs, etc. That's all inside the driver.

b) Completely decoupled.

The top-level MFD device knows nothing about its children. It simply
provides a bus into which they can be instantiated, and a generic IRQ
controller into which they can hook.

Platform data or device tree is solely used to define which children
exist, which of the top-level MFD's I2C addresses is used for each
child, the base register address for each child device, the IRQs used by
each child device, etc.


Which of those two models are different people expecting?

(b) appears to be the most flexible, and since you have defined the DT
bindings to contain a separate node for each MFD child device, each with
its own compatible value, seems to be what you're aiming for. In this
scenario, there should be no private APIs between the top-level MFD
device and the children though; everything should be using standard bus
APIs.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

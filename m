From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Using DT overlays for adding virtual hardware
Date: Wed, 8 Jun 2016 16:16:32 +0200
Message-ID: <575828C0.5000008@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <jailhouse-dev+bncBCJI7SMNV4NBBQ6R4C5AKGQEF5KZD6Y@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: devicetree <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi all,

already started the discussion off-list with Pantelis, but it's better
done in public:

I'm currently exploring ways to make Linux recognize dynamically added
virtual hardware when running under the Jailhouse hypervisor [1]. We
need to load drivers for inter-partition communication devices that only
appear after Jailhouse started (which is done from within Linux, i.e.
long after boot) or when a partition was added later on. Probably, we
will simply add a virtual PCI host bridge on systems without physical
PCI and let the IPC device be explored that way (already works on x86).
Still, that leaves us with hotplug and unplug on hypervisor activation
and deactivation.

Inspired by how FPGA bitstream loaders and the caps/hats for BeagleBones
and RasPis work, I thought of using device tree overlays for this.
However, it seems there are still some gaps in upstream Linux /wrt
overlays. So I would like to find out what already works and what may
need further patches.

The plan (open for suggestions) is as follows:

- have an overlay template for a virtual platform device
- compile it into the Jailhouse loader kernel module
- adjust key parameters (e.g. register base addresses) after
  instantiating a device (of_update_property?)
- push modified dt into of_overlay_create

To my understanding, the last step will trigger driver probing which
will cause the device being activated (provided the driver is available,
of course).

I played with the fragment from
Documentation/devicetree/overlay-notes.txt, but already that failed
because the in-kernel dtc does not support /plugin/ yet, right? (Why
not, btw?) What else do I need to patch/update to make the above work?
Or are the simpler ways to achieve what we need?

Thanks,
Jan

[1] https://github.com/siemens/jailhouse

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

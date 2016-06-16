From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: add bindings documentation for
 PDC driver.
Date: Thu, 16 Jun 2016 14:51:44 +0100
Message-ID: <5762AEF0.9030203@arm.com>
References: <1465912965-35500-1-git-send-email-rob.rice@broadcom.com>
 <1465912965-35500-2-git-send-email-rob.rice@broadcom.com>
 <576017C7.50609@arm.com>
 <CAG4BRpnP_qqffLF9X+RusNQGnrtARap9HmK4RE4_jSVfO5juGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAG4BRpnP_qqffLF9X+RusNQGnrtARap9HmK4RE4_jSVfO5juGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Rice <rob.rice@broadcom.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Anup Patel <anup.patel@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Rice <rrice@broadcom.com>
List-Id: devicetree@vger.kernel.org



On 16/06/16 14:50, Rob Rice wrote:
>
>
> On Tue, Jun 14, 2016 at 10:42 AM, Sudeep Holla <sudeep.holla@arm.com
> <mailto:sudeep.holla@arm.com>> wrote:
>
>
>
>     On 14/06/16 15:02, Rob Rice wrote:
>
>         From: Rob Rice <rrice@broadcom.com <mailto:rrice@broadcom.com>>
>
>         Add the device tree binding documentation for the PDC hardware
>         in Broadcom iProc SoCs.
>
>         Signed-off-by: Rob Rice <rob.rice@broadcom.com
>         <mailto:rob.rice@broadcom.com>>
>         Acked-by: Rob Herring <robh@kernel.org <mailto:robh@kernel.org>>
>         Reviewed-by: Ray Jui <ray.jui@broadcom.com
>         <mailto:ray.jui@broadcom.com>>
>         Reviewed-by: Anup Patel <anup.patel@broadcom.com
>         <mailto:anup.patel@broadcom.com>>
>         Reviewed-by: Scott Branden <scott.branden@broadcom.com
>         <mailto:scott.branden@broadcom.com>>
>         ---
>            .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       | 23
>         ++++++++++++++++++++++
>            1 file changed, 23 insertions(+)
>            create mode 100644
>         Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>
>         diff --git
>         a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>         b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>         new file mode 100644
>         index 0000000..411ccf4
>         --- /dev/null
>         +++
>         b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>         @@ -0,0 +1,23 @@
>         +The PDC driver manages data transfer to and from various
>         offload engines
>         +on some Broadcom SoCs. An SoC may have multiple PDC hardware
>         blocks. There is
>         +one device tree entry per block.
>         +
>         +Required properties:
>         +- compatible : Should be "brcm,iproc-pdc-mbox".
>         +- reg: Should contain PDC registers location and length.
>         +- interrupts: Should contain the IRQ line for the PDC.
>         +- #mbox-cells: 1
>         +- brcm,rx-status-len: Length of metadata preceding received
>         frames, in bytes.
>         +
>
>
>     Ideally the metadata is more associated with the software protocol built
>     on top of the mailbox controller.
>
>     Is this metadata added by the hardware ?
>
>     Otherwise it's better to make it part of the protocol rather than the
>     associating with the controller.
>
>
> Yes, in fact this metadata is added by the PDC hardware itself. So it
> seems correct for the DT property to be on the controller.

In that case, it's fine.

-- 
Regards,
Sudeep

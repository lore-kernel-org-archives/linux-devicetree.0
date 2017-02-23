From: Jon Mason <jon.mason@broadcom.com>
Subject: Re: [PATCH v2 0/3] Add Northstar Plus support to PDC mailbox driver
Date: Thu, 23 Feb 2017 09:54:50 -0800
Message-ID: <CAC3K-4oxR8+6=BcU5-c72JZmrSV2ezUueGK30Xt263Dg_4gmYA@mail.gmail.com>
References: <1487861392-23039-1-git-send-email-steven.lin1@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487861392-23039-1-git-send-email-steven.lin1@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Steve Lin <steven.lin1@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <scott.branden@broadcom.com>, Rob Rice <rob.rice@broadcom.com>, Jassi Brar <jassisinghbrar@gmail.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Ray Jui <ray.jui@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 6:49 AM, Steve Lin <steven.lin1@broadcom.com> wrote:
> Adds support for Broadcom Northstar+ to mailbox (PDC) driver.
>
> Patch 1/3: Driver code and Kconfig changes
> Patch 2/3: Device tree changes
> Patch 3/3: DT bindings documentation changes
>
> v2 addresses Jon Mason's suggestion about making the bindings doc change
> a separate patch.

FWIW, looks good to me.  Feel free to add my
Acked-by: Jon Mason <jon.mason@broadcom.com>
to the relevant pieces

> Steve Lin (3):
>   mailbox: bcm-pdc: Add Northstar Plus support to PDC driver
>   ARM: dts: NSP: Add mailbox (PDC) to NSP
>   dt-bindings: mailbox: Update doc with NSP PDC/mailbox support
>
>  .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       |  6 ++-
>  arch/arm/boot/dts/bcm-nsp.dtsi                     |  9 ++++
>  drivers/mailbox/Kconfig                            |  9 ++--
>  drivers/mailbox/bcm-pdc-mailbox.c                  | 61 ++++++++++++++++------
>  4 files changed, 63 insertions(+), 22 deletions(-)
>
> --
> 2.1.0
>

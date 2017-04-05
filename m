From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4 2/3] Broadcom USB DRD Phy driver for Northstar2
Date: Wed, 5 Apr 2017 16:30:36 +0530
Message-ID: <8aa2cc42-6fdc-5574-4449-f05f6d5cbd38@ti.com>
References: <1490704052-11314-1-git-send-email-raviteja.garimella@broadcom.com>
 <1490704052-11314-3-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490704052-11314-3-git-send-email-raviteja.garimella@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Raviteja Garimella <raviteja.garimella@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 28 March 2017 05:57 PM, Raviteja Garimella wrote:
> This is driver for USB DRD Phy used in Broadcom's Northstar2
> SoC. The phy can be configured to be in Device mode or Host
> mode based on the type of cable connected to the port. The
> driver registers to  extcon framework to get appropriate
> connect events for Host/Device cables connect/disconnect
> states based on VBUS and ID interrupts.

$patch should be phy: phy-bcm-ns2-usbdrd: USB DRD Phy driver for Broadcoms
Northstar2.

Sorry for not letting you know this earlier. But I feel the design of the
driver should be changed. Extcon shouldn't be used here. The extcon
notifications should be sent to the consumer driver and the consumer driver
should be responsible for invoking the phy ops.

The phy ops being invoked during extcon events doesn't look right.

Thanks
Kishon

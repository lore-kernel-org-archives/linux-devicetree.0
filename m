From: Lars Melin <larsm17@gmail.com>
Subject: Re: [PATCH v6 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Wed, 10 Apr 2019 17:40:06 +0700
Message-ID: <f04e98f8-e1d4-55a7-d714-9770961e5fc9@gmail.com>
References: <1554882504-9010-1-git-send-email-pawell@cadence.com>
 <1554882504-9010-6-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554882504-9010-6-git-send-email-pawell@cadence.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On 4/10/2019 14:48, Pawel Laszczak wrote:
> The Cadence USBSS DRD Driver is a highly configurable IP Core which
> can be instantiated as Dual-Role Device (DRD), Peripheral Only and
> Host Only (XHCI)configurations.

The hardware is an IP core, the driver is not.

rgds
Lars

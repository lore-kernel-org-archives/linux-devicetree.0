From: Lars Melin <larsm17@gmail.com>
Subject: Re: [PATCH v7 0/6] Introduced new Cadence USBSS DRD Driver.
Date: Thu, 6 Jun 2019 08:12:21 +0700
Message-ID: <30b6ac49-2edc-fde0-a106-34ff94999e5a@gmail.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559729030-16390-1-git-send-email-pawell@cadence.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, jpawar@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On 6/5/2019 17:03, Pawel Laszczak wrote:
> This patch introduces new Cadence USBSS DRD driver to Linux kernel.
> 
> The Cadence USBSS DRD Driver is a highly configurable IP Core which
> can be instantiated as Dual-Role Device (DRD), Peripheral Only and
> Host Only (XHCI)configurations.
> 
The driver is not an IP Core, the hardware device is.


/Lars

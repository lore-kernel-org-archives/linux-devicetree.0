From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 09/16] phy: da8xx-usb: new driver for DA8xx SoC USB PHY
Date: Wed, 13 Apr 2016 15:07:08 -0500
Message-ID: <570EA6EC.1040001@lechnology.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-10-git-send-email-david@lechnology.com>
 <570E4796.7070005@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <570E4796.7070005@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, David.Laight@ACULAB.COM, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/13/2016 08:20 AM, Kishon Vijay Abraham I wrote:
>
> Don't prefer export symbols from PHY driver. That'll create unnecessary
> dependencies between the controller and the PHY.
>
> To see how to fix it, please see my comment for the previous version of your patch.
>
> Thanks
> Kishon
>


What is the proper way to give you credit for the changes you suggested?

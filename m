From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [RFC 1/1] Changes to support the driver for platform device
 registration
Date: Thu, 5 Jan 2017 09:43:56 -0800
Message-ID: <3d3e9fce-faae-3ff0-c42c-20f4bced663a@gmail.com>
References: <1483604597-26160-1-git-send-email-raviteja.garimella@broadcom.com>
 <1483604597-26160-2-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483604597-26160-2-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Raviteja Garimella <raviteja.garimella@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/05/2017 12:23 AM, Raviteja Garimella wrote:
> -- Add OF based platform device registration
> -- Modify debug prints to be compatible with both pci and platform devices
> -- Add members to 'struct udc' for extcon and phy support
> -- Add checks to not process repeated calls to udc connect and
>    disconnect routines
> -- Kconfig changes

What you are doing in this patch is all well and good, but since you are
listing these changes, that means we should see 4/5 patches submitted to
this driver each one doing what you have as a bullet point.

Since you are adding Device Tree probing support to the driver, you also
need to create a proper binding document which describes the properties
and nodes.

Thank you
-- 
Florian

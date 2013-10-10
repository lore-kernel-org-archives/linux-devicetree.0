From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v6] extcon: palmas: Added a new compatible type *ti,palmas-usb-vid*
Date: Thu, 10 Oct 2013 18:41:15 +0530
Message-ID: <5256A773.6060807@nvidia.com>
References: <1381408647-24653-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1381408647-24653-1-git-send-email-kishon@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "rob@landley.net" <rob@landley.net>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thursday 10 October 2013 06:07 PM, Kishon Vijay Abraham I wrote:
> The Palmas device contains only a USB VBUS-ID detector, so added a
> compatible type *ti,palmas-usb-vid*. Didn't remove the existing compatible
> types for backward compatibility.
>
I dont have much issue on this nomenclature but just second thought:

The Palmas USB module is capable of detection VBUS, ID-GND, ID-RA, 
ID-RB, ID-RC and ID-FLOAT as per BC1.2.
This sub-module only detect the cable, does nothing more than this.
In this case, should we say "ti,palmas-usb-extcon"?
Again extcon is linux specific terminology and this can be defer.



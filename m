From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v6] extcon: palmas: Added a new compatible type *ti,palmas-usb-vid*
Date: Fri, 11 Oct 2013 11:45:24 +0530
Message-ID: <5257977C.1030108@ti.com>
References: <1381408647-24653-1-git-send-email-kishon@ti.com> <5256A773.6060807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5256A773.6060807@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "rob@landley.net" <rob@landley.net>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thursday 10 October 2013 06:41 PM, Laxman Dewangan wrote:
> On Thursday 10 October 2013 06:07 PM, Kishon Vijay Abraham I wrote:
>> The Palmas device contains only a USB VBUS-ID detector, so added a
>> compatible type *ti,palmas-usb-vid*. Didn't remove the existing compatible
>> types for backward compatibility.
>>
> I dont have much issue on this nomenclature but just second thought:
> 
> The Palmas USB module is capable of detection VBUS, ID-GND, ID-RA, ID-RB, ID-RC
> and ID-FLOAT as per BC1.2.
> This sub-module only detect the cable, does nothing more than this.
> In this case, should we say "ti,palmas-usb-extcon"?
> Again extcon is linux specific terminology and this can be defer.

I don't mind either way. Chanwoo?

-Kishon

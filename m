From: Al Cooper <al.cooper@broadcom.com>
Subject: Re: [PATCH 2/3] dt-bindings: Add Broadcom STB USB PHY binding document
Date: Mon, 12 Jun 2017 16:19:07 -0400
Message-ID: <CAGh=XAAzbrNUopwsxQeXfRXi9gd=J4mdG-6UqTJ+-ikd=xqGig@mail.gmail.com>
References: <1496426512-10590-1-git-send-email-alcooperx@gmail.com>
 <1496426512-10590-3-git-send-email-alcooperx@gmail.com> <20170608221104.7nsinggo4vngbmus@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170608221104.7nsinggo4vngbmus@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 8, 2017 at 6:11 PM, Rob Herring <robh@kernel.org> wrote:
>> +- brcm,device: String, PHY Device mode.
>> +  Possible values are: off (Host), on (Device), dual (DRD)
>> +  or typec-pd (Type-C PD control)
>
> I believe we have standard property for this though maybe not type C.
>
> off/on seem strange for meaning host/device as well.

I'll change this to:

mode: String, PHY Device mode.
Possible values are: "host", "device", "drd" or "typec-pd"

Al

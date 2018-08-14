From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [1/2] dt-bindings: phy: Add stingray usb phy documentation
Date: Tue, 14 Aug 2018 08:43:44 +0530
Message-ID: <CABe79T4sjn=BwjYtSd2N_HmDhCzrqr61DBu-ZZxC4DNnAswzmQ@mail.gmail.com>
References: <1499432825-15820-2-git-send-email-srinath.mannam@broadcom.com> <20180814015416.GA29046@jc-sabre>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814015416.GA29046@jc-sabre>
Sender: linux-kernel-owner@vger.kernel.org
To: Jayachandran C <jnair@caviumnetworks.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi JC,


On Tue, Aug 14, 2018 at 7:24 AM, Jayachandran C
<jnair@caviumnetworks.com> wrote:
> Hi Srinath, Ray,
>
> On Fri, Jul 07, 2017 at 06:37:04PM +0530, Srinath Mannam wrote:
>> Add DT binding document for stingray usb phy driver.
>>
>> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> The Broadcom Vulcan chip (now Cavium ThunderX2) uses the same USB PHY
> from what I understand. Our hardware team reports that there are some
> failures seen without the a custom PHY driver.
>
> Do you require this PHY driver on regular operation on Stingray? Or is
> this for some specific functionality? I am asking since the issue
> reported here is on switching between a USB 3.0 and USB 2.0 devices.
We need it for regular operation in stingray.
>
> Any plans on submitting this driver again?
I will submit it ASAP.

Regards,
Srinath.
>
> Thanks,
> JC

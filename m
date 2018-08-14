From: Jayachandran C <jnair@caviumnetworks.com>
Subject: Re: [1/2] dt-bindings: phy: Add stingray usb phy documentation
Date: Mon, 13 Aug 2018 18:54:17 -0700
Message-ID: <20180814015416.GA29046@jc-sabre>
References: <1499432825-15820-2-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499432825-15820-2-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Srinath, Ray,

On Fri, Jul 07, 2017 at 06:37:04PM +0530, Srinath Mannam wrote:
> Add DT binding document for stingray usb phy driver.
> 
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> Acked-by: Rob Herring <robh@kernel.org>

The Broadcom Vulcan chip (now Cavium ThunderX2) uses the same USB PHY
from what I understand. Our hardware team reports that there are some
failures seen without the a custom PHY driver.

Do you require this PHY driver on regular operation on Stingray? Or is
this for some specific functionality? I am asking since the issue
reported here is on switching between a USB 3.0 and USB 2.0 devices.

Any plans on submitting this driver again?

Thanks,
JC

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: power: reset: add document for NVMEM
  based reboot-mode
Date: Thu, 13 Jun 2019 15:02:21 -0600
Message-ID: <20190613210221.GA13947@bogus>
References: <20190515104658.25535-1-nandor.han@vaisala.com>
 <20190515104658.25535-3-nandor.han@vaisala.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190515104658.25535-3-nandor.han@vaisala.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: "sre@kernel.org" <sre@kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Han Nandor <nandor.han@vaisala.com>
List-Id: devicetree@vger.kernel.org

On Wed, 15 May 2019 10:47:15 +0000, Han Nandor wrote:
> Add the device tree bindings document for the NVMEM based reboot-mode
> driver.
> 
> Signed-off-by: Nandor Han <nandor.han@vaisala.com>
> ---
>  .../power/reset/nvmem-reboot-mode.txt         | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
Date: Thu, 18 Oct 2018 14:47:58 -0500
Message-ID: <20181018194758.GA21705@bogus>
References: <20181017222710.254994-1-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181017222710.254994-1-kunyi@google.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, kunyi@google.com, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 17 Oct 2018 15:27:09 -0700, Kun Yi wrote:
> adm127x are hot-swap controllers that allow a circuit board to be removed from
> or inserted into a live backplane. This patch adds the device tree
> bindings documentation.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

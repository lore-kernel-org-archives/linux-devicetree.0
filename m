From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH linux v5 5/6] hwmon: occ: Add hwmon implementation for
 the P8 OCC
Date: Wed, 1 Feb 2017 11:34:50 -0600
Message-ID: <20170201173450.ysuk3j2hwoldz72o@rob-hp-laptop>
References: <1485877437-13598-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1485877437-13598-6-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485877437-13598-6-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
To: eajames@linux.vnet.ibm.com
Cc: linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com, wsa@the-dreams.de, andrew@aj.id.au, joel@jms.id.au, benh@kernel.crashing.org, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 31, 2017 at 09:43:56AM -0600, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Add code to tie the hwmon sysfs code and the POWER8 OCC code together, as
> well as probe the entire driver from the I2C bus. I2C is the communication
> method between the BMC and the P8 OCC.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/hwmon/occ.txt |  13 +++

Please add acks when posting new versions.

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/hwmon/occ/Kconfig                       |  14 ++++
>  drivers/hwmon/occ/Makefile                      |   1 +
>  drivers/hwmon/occ/p8_occ_i2c.c                  | 104 ++++++++++++++++++++++++
>  4 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
>  create mode 100644 drivers/hwmon/occ/p8_occ_i2c.c

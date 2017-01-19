From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH linux v3 5/6] hwmon: occ: Add hwmon implementation for
 the P8 OCC
Date: Thu, 19 Jan 2017 11:12:06 -0600
Message-ID: <20170119171206.uxtdicfn4ahge6c6@rob-hp-laptop>
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-6-git-send-email-eajames.ibm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484601219-30196-6-git-send-email-eajames.ibm@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: eajames.ibm@gmail.com
Cc: linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com, wsa@the-dreams.de, andrew@aj.id.au, joel@jms.id.au, benh@kernel.crashing.org, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 03:13:38PM -0600, eajames.ibm@gmail.com wrote:
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

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/hwmon/occ/Kconfig                       |  14 ++++
>  drivers/hwmon/occ/Makefile                      |   1 +
>  drivers/hwmon/occ/p8_occ_i2c.c                  | 104 ++++++++++++++++++++++++
>  4 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
>  create mode 100644 drivers/hwmon/occ/p8_occ_i2c.c

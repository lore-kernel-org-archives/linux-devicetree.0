From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 19/23] drivers/fsi: Add GPIO based FSI master
Date: Wed, 5 Apr 2017 09:35:40 -0700
Message-ID: <5d173f9c-e01c-6093-16ab-d114857009b2@infradead.org>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
 <20170405020607.79939-20-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170405020607.79939-20-cbostic@linux.vnet.ibm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, rostedt@goodmis.org, mingo@redhat.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: andrew@aj.id.au, alistair@popple.id.au, linux-kernel@vger.kernel.org, joel@jms.id.au, "Edward A . James" <eajames@us.ibm.com>, benh@kernel.crashing.org, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 04/04/17 19:06, Christopher Bostic wrote:
> From: Chris Bostic <cbostic@linux.vnet.ibm.com>
> 
> Implement a FSI master using GPIO.  Will generate FSI protocol for
> read and write commands to particular addresses.  Sends master command
> and waits for and decodes a slave response.
> 
> Includes changes from Edward A. James <eajames@us.ibm.com> and Jeremy
> Kerr <jk@ozlabs.org>.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Chris Bostic <cbostic@linux.vnet.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/fsi/Kconfig           |  11 +
>  drivers/fsi/Makefile          |   1 +
>  drivers/fsi/fsi-master-gpio.c | 610 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 622 insertions(+)
>  create mode 100644 drivers/fsi/fsi-master-gpio.c
> 
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index 04c1a0e..9cf8345 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -9,4 +9,15 @@ config FSI
>  	---help---
>  	  FSI - the FRU Support Interface - is a simple bus for low-level
>  	  access to POWER-based hardware.
> +
> +if FSI
> +
> +config FSI_MASTER_GPIO
> +	tristate "GPIO-based FSI master"
> +	depends on FSI && GPIOLIB

depends on FSI is redundant since "if FSI" does the same thing.

> +	---help---
> +	This option enables a FSI master driver using GPIO lines.
> +
> +endif
> +


-- 
~Randy

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
Date: Thu, 11 Jan 2018 20:06:23 +1100
Message-ID: <1515661583.31850.34.camel@kernel.crashing.org>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-01-09 at 14:31 -0800, Jae Hyun Yoo wrote:
> +struct peci_rd_ia_msr_msg {
> +       unsigned char target;
> +       unsigned char thread_id;
> +       unsigned short address;
> +       unsigned long value;
> +};

Those types are representing messages on the wire ?

In that case those types aren't suitable. For example "long" will have
a different size and alignment for 32 and 64-bit userspace. There are
size-explicit userspace types available.

Also I didn't see any endianness annotations in there. Is that expected
? IE are those wire format packets ?

Cheers,
Ben.

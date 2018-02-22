From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 7/8] [PATCH 7/8] drivers/hwmon: Add a generic PECI
 hwmon client driver
Date: Thu, 22 Feb 2018 01:37:20 +0100
Message-ID: <20180222003720.GA25250@lunn.ch>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-8-jae.hyun.yoo@linux.intel.com>
 <20180221182608.GA11635@roeck-us.net>
 <618f34cd-ee43-d8e4-4fb0-3c23bf03835f@linux.intel.com>
 <20180221214859.GA30263@roeck-us.net>
 <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> But even with this change, it still needs to use delayed creation
> because BMC side kernel doesn't know how many DIMMs are populated on
> a remote server before the remote server completes its memory
> training and testing in BIOS, but it needs to check the remote
> server's CPU temperature as immediate as possible to make
> appropriate thermal control based on the remote CPU's temperature to
> avoid any critical thermal issue. What would be a better solution in
> this case?

You could change this driver so that it supports one DIMM.  Move the
'hotplug' part into another driver which creates and destroys
instances of the hwmon DIMM device as the DIMMS come and go.

Also, do you need to handle CPU hotplug? You could split the CPU
temperature part into a separate hwmon driver? And again create and
destroy devices as CPUs come and go?

	Andrew

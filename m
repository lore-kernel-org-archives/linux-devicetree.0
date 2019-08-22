From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: rtc: Add optional status property
Date: Thu, 22 Aug 2019 11:56:59 +0300
Message-ID: <20190822085659.GI30120@smile.fi.intel.com>
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
 <1b01287241d49638c43222d32f3ece5a38c95ddf.1566458029.git.rahul.tanwar@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1b01287241d49638c43222d32f3ece5a38c95ddf.1566458029.git.rahul.tanwar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, alan@linux.intel.com, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, cheol.yong.kim@intel.com, rahul.tanwar@intel.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 03:44:04PM +0800, Rahul Tanwar wrote:
> Some products may not support MC146818 RTC CMOS device. Introduce a optional
> 'status' standard property for RTC-CMOS to indicate if the MC146818 RTC device
> is available (status="okay") or not (status="disabled")

This needs to be converted to YAML

-- 
With Best Regards,
Andy Shevchenko

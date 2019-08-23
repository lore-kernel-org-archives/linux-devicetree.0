From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
Date: Fri, 23 Aug 2019 12:09:47 +0200
Message-ID: <1566554987.3023.8.camel@pengutronix.de>
References: <42039170811f798b8edc66bf85166aefe7dbc903.1566531960.git.eswara.kota@linux.intel.com>
         <90cc600d6f7ded68f5a618b626bd9cffa5edf5c3.1566531960.git.eswara.kota@linux.intel.com>
         <1566549822.3023.2.camel@pengutronix.de>
         <15c538d7-1045-1a8c-4c8b-194a1de17a16@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15c538d7-1045-1a8c-4c8b-194a1de17a16@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dilip Kota <eswara.kota@linux.intel.com>, robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

On Fri, 2019-08-23 at 17:47 +0800, Dilip Kota wrote:
[...]
> Thanks for pointing it out.
> Reset is not supported on LGM platform.
> I will update the reset_device() definition to "return -EOPNOTSUPP"

In that case you can just drop intel_reset_device() completely,
the core checks whether ops->reset is set before trying to call it.

regards
Philipp

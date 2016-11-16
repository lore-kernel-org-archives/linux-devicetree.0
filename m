From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 4/4] Update device tree Synopsys DW DMAC documentation
Date: Wed, 16 Nov 2016 20:08:24 +0200
Message-ID: <1479319704.22212.0.camel@linux.intel.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1479304615-11360-5-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1479309042.24056.40.camel@linux.intel.com>
         <1479315682.2534.20.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479315682.2534.20.camel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: "vinod.koul@intel.com" <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-16 at 17:01 +0000, Eugeniy Paltsev wrote:
> On Wed, 2016-11-16 at 17:10 +0200, Andy Shevchenko wrote:
> > Overall, since we are going to expose some properties to the Device
> > Tree
> > I would really think twice about naming. Better if we reuse
> > something
> > existing already.
> > 
> > So, what I can see is
> > 
> > dmacap,private
> > dmacap,memcpy
> > 
> > Here is a selling point as well, i.e. standardization.
> > 
> 
> As I can see these property name used only in "mv_xor" driver. And 
> they are marked as deprecated.
> So, I'm not sure if I should used these names.

Oh, good catch! So, then I leave this to DT experienced guys to decide.
Rob?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
Date: Wed, 26 Apr 2017 18:04:35 +0300
Message-ID: <1493219075.24567.211.camel@linux.intel.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1492518695.24567.56.camel@linux.intel.com>
 <1492784977.16657.6.camel@synopsys.com>
 <1492787583.24567.120.camel@linux.intel.com>
 <1493049305.25985.4.camel@synopsys.com>
 <1493052970.24567.168.camel@linux.intel.com>
 <1493133369.25985.10.camel@synopsys.com>
 <1493143941.24567.196.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1493143941.24567.196.camel@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "Alexey.Brodkin@synopsys.com" <Alexey.Brodkin@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-04-25 at 21:12 +0300, Andy Shevchenko wrote:
> On Tue, 2017-04-25 at 15:16 +0000, Eugeniy Paltsev wrote:
> > On Mon, 2017-04-24 at 19:56 +0300, Andy Shevchenko wrote:
> > > On Mon, 2017-04-24 at 15:55 +0000, Eugeniy Paltsev wrote:

> > > Descriptor is active until terminate_all() is called or new
> > > descriptor
> > > is supplied. So, the caller has a quite time to check on it.
> > > 
> > > So, what's wrong on it by your opinion?
> > 
> > Hmm, this looks OK. (In my example (hsu/hsu.c driver) error
> > descriptors
> > are not freed even after terminate_all is called)
> 
> If it's active it will be freed.
> Otherwise caller should check somewhere that descriptor fails.
> 
> But actually this is fragile and we need to monitor failed
> descriptors.
> Thanks for reporting.
> 
> > 
> > > Of course, if you want to keep by some reason (should be stated
> > > what
> > > the reason in comment) erred descriptors, you can do that.
> > 
> > So, I'll create desc_error list and store failed descriptors in this
> > list until terminate_all() is called.
> > Is it OK implementation?
> 
> Nope, we need to amend virt-chan API for that. I'm on it. Will send a
> series soon.

I have to correct what I wrote before.

We have two options:
a) one I proposed above;
b) move descriptor to complete list and call complete callback with
result.

So, it looks like the b) variant is what is done already in 4 (did I
calculate correctly?) drivers and respective users.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

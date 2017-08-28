From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Mon, 28 Aug 2017 22:08:01 +0800
Message-ID: <20170828140759.GC3525@dragon>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <20170828115328.GA26757@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170828115328.GA26757@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kiran Gunda <kgunda@codeaurora.org>, sboyd@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 28, 2017 at 01:53:28PM +0200, Greg KH wrote:
> On Fri, Aug 18, 2017 at 08:58:29PM +0530, Kiran Gunda wrote:
> > The peripheral ownership check is not necessary on single master
> > platforms. Hence, enforce the peripheral ownership check optionally.
> > 
> > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > Tested-by: Shawn Guo <shawnguo@kernel.org>
> > ---
> > v2:
> > 	Fixed the commit message.
> > 	Added Shawn's 'Tested-by' tag.
> > 
> > v1:
> > 	This patch depends on the below patch series. Please take this patch
> > 	along with this series.
> > 
> > 	[PATCH V2 00/12]: spmi: pmic-arb: Support for HW v5 and other fixes
> > 
> >  Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt | 6 ++++++
> >  drivers/spmi/spmi-pmic-arb.c                                  | 7 ++++++-
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> This doesn't apply on top of the other spmi patches I just added to my
> tree.  Did I mess something up here?

Sorry, Greg.  We should have told you that this patch is obsolete and
replaced by the one below, which you just applied to char-misc-testing.

  spmi: pmic-arb: Move the ownership check to irq_chip callback

Shawn

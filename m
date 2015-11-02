From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management driver
Date: Mon, 02 Nov 2015 23:00:38 +0100
Message-ID: <21289988.98iBsIZliz@wuerfel>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org> <CAL_JsqJYOe+uE1VE_ojSq=Hx=2roW1CAiB2Hyow0tKUR85cV0Q@mail.gmail.com> <5637B03F.9090905@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5637B03F.9090905@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Timur Tabi <timur@codeaurora.org>, dmaengine@vger.kernel.org, Christopher Covington <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Monday 02 November 2015 13:49:35 Sinan Kaya wrote:
> On 11/2/2015 12:42 PM, Rob Herring wrote:
> > Except I was suggesting not using 1.0 or 1.1. There is one main
> > exception and that is Xilinx blocks, but they are releasing versions
> > of blocks to customers. If "1.0" is not a well defined number, then
> > don't use that. I'd be surprised if any SOC vendor had such well
> > defined process around versioning of their IP blocks such that they
> > are well documented and guaranteed such that every change will change
> > the version.
> 
> Here is one.
> 
> I have two versions of the same IP. The first version in one chip has 
> sw_version register that returns 1.0. The second version which has more 
> capabilities has 1.1 in it.
> 
> Is it OK to use?
> 
> compatible="qcom,hidma-mgmt-1.0", "qcom,hidma-mgmt"
> 
> for now and
> 
> compatible="qcom,hidma-mgmt-1.1", "qcom,hidma-mgmt"
> 
> later for the second chip? 1.1 is backwards compatible with 1.0 BTW.

I think this is fine. As they are backwards compatible, I would even make the
latter one

compatible = "qcom,hidma-mgmt-1.1", "qcom,hidma-mgmt-1.0", "qcom,hidma-mgmt";

> Since the same IP goes into multiple chips, why would you list the chip 
> name here and submit patches multiple times for each single chip.
> 
> or to follow what Timur did, I can do this.
> 
> "qcom,qdf2xxx-hidma-mgmt-1.0"
> 
> qdf2xxx would become the chip family.

We really don't want wildcards in here, but want to use the most specific
name you have for it, so we can add quirks to the driver later if it
turns out that they are not fully compatible after all.

	Arnd

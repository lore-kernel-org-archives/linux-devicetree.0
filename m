From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 5/6] ARM: dts: Add basic dts include files for Samsung
 S3C64xx SoCs
Date: Tue, 23 Apr 2013 16:44:10 +0200
Message-ID: <3174365.tBvafCFyal@amdc1227>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
 <CAL_JsqL_i-5SDCsGZCrsxMehLVMGoLO1s_V3R-H6Oa5ff16dEQ@mail.gmail.com>
 <51769ACC.4070706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <51769ACC.4070706@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Rob Herring <robherring2@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "Mark Brown (broonie@opensource.wolfsonmicro.com)" <broonie@opensource.wolfsonmicro.com>, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 23 of April 2013 23:29:32 Kukjin Kim wrote:
> On 04/18/13 02:46, Rob Herring wrote:
> >>>> +   vic0: interrupt-controller@71200000 {
> >>> 
> >>> These nodes should be off a "simple-bus" node.
> >> 
> >> Hmm, is there any reason behind it?
> >> 
> >> I thought simple bus was just a convenient helper to represent
> >> hierarchical
> >> bus structures if one has a need to do so.
> > 
> > No. The DT should reflect the bus structure of the chip. How
> > accurately it is done is up to you and the information available, but
> > you have to have a bus of some sort.
> > 
> > There's obvious examples that don't follow this, but I'd like to not have
> > more.
> Tomasz, can you address comments?

Please discard this series for now.

I've decided to post it for 3.11, including a driver for Common Clock 
Framework and several cleanup patches, which I have ready and waiting.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework

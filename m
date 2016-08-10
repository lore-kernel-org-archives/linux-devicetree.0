From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 3/4] ARM: dts: da850-lcdk: Add NAND to DT
Date: Wed, 10 Aug 2016 15:01:30 +0530
Message-ID: <57AAF472.7000804@ti.com>
References: <20160809171518.22690-1-kbeldan@baylibre.com>
 <20160809171518.22690-4-kbeldan@baylibre.com> <57AAE67D.4000404@ti.com>
 <20160810090417.GE16481@gobelin>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160810090417.GE16481@gobelin>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Karl Beldan <kbeldan@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Karl Beldan <karl.beldan+oss@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 10 August 2016 02:34 PM, Karl Beldan wrote:
> On Wed, Aug 10, 2016 at 02:01:57PM +0530, Sekhar Nori wrote:
>> On Tuesday 09 August 2016 10:45 PM, Karl Beldan wrote:
>>> This adds DT support for the NAND connected to the SoC AEMIF.
>>> The parameters (timings, ecc) are the same as what the board ships with
>>> (default AEMIF timings, 1bit ECC) and improvements will be handled in
>>> due course.
>>
>> I disagree that we need to be compatible to the software that ships with
>> the board. Thats software was last updated 3 years ago. Instead I would
>> concern with what the hardware supports. So, if the hardware can support
>> 4-bit ECC, I would use that.
>>
> I am not saying we _need_ to be compatible.

Alright then, please drop references to what software the board ships
with in the commit message and in the patch itself.

> 
>> If driver is broken for 4-bit ECC, please fix that up first.
>>
> Since this issue is completely separate from my DT improvements
> I'll stick to resubmitting the series, applying my LCDK changes to the
> EVM too, besides you'll be able to compare the behavior without ECC
> discrepancies.
> I took note that you are likely to not apply without the ECC fix.

Yeah, I would not like to apply with 1-bit ECC now and then change to
4-bit ECC soon after.

Regards,
Sekhar

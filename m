From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 5/6] arm64: zynqmp: Add DDRC node
Date: Tue, 6 Nov 2018 07:46:55 +0100
Message-ID: <38dc38b6-25f4-194c-9ba9-577d35e92700@xilinx.com>
References: <1540447621-22870-1-git-send-email-manish.narani@xilinx.com>
 <1540447621-22870-6-git-send-email-manish.narani@xilinx.com>
 <20181105125644.GA7937@zn.tnic>
 <41c5ca53-ed4b-38d0-c612-e1229004293e@xilinx.com>
 <20181105132007.GB7937@zn.tnic>
 <a81f47e0-1778-a6ac-4cd8-634502661d6f@xilinx.com>
 <20181105134218.GD7937@zn.tnic>
 <CAOesGMj=EbWgcYF2Mhh6TFMCdn1ub1Ze6fbXJnFFdsttWByXYg@mail.gmail.com>
 <20181105194721.GB26868@zn.tnic>
 <CAOesGMjsPWeRZEeBH37uLQFBKwAWNMh5yCvuKNYrOUDfRSSYog@mail.gmail.com>
 <20181105204322.GE26868@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181105204322.GE26868@zn.tnic>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@alien8.de>, Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, Amit Kucheria <amit.kucheria@linaro.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, manish.narani@xilinx.com, Sudeep Holla <sudeep.holla@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05. 11. 18 21:43, Borislav Petkov wrote:
> On Mon, Nov 05, 2018 at 12:38:05PM -0800, Olof Johansson wrote:
>> Yeah, that's the way we've been trying to do for various subsystems
>> and it's been working pretty well. Of course, if there's need to
>> coordinate more closely for something in the future we'll be happy to
>> do so.
> 
> Goodie. Let's do that for now and we can always revisit when there's
> real need.

I think Boris should take also this one (dt binding doc change) because
it is aligned with changes in the driver.
https://lkml.kernel.org/r/1538667328-9465-7-git-send-email-manish.narani@xilinx.com

And I will take this one.
https://lkml.kernel.org/r/1540447621-22870-6-git-send-email-manish.narani@xilinx.com

But not a problem with taking both if you like but this make more sense
to me.

Thanks,
Michal

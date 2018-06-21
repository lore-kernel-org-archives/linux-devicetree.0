From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/5] RFC: Mezzanine handling for 96boards
Date: Thu, 21 Jun 2018 05:58:25 -0700
Message-ID: <7c4a9116-1d46-efa8-e476-839f81f5519d@gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180618074556.6944-1-linus.walleij@linaro.org>
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
To: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dev@lists.96boards.org
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, John Stultz <john.stultz@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@infradead.org>
List-Id: devicetree@vger.kernel.org

On 06/18/18 00:45, Linus Walleij wrote:
> This is a proposal for how to handle the non-discoverable
> 96boards plug-in expansion boards called "mezzanines" in the
> Linux kernel. It is a working RFC series meant for discussion
> at the moment.

< snip >

> So for that reason, or other predictable statements such
> as "you're reinventing board files", I'd like to have an
> open discussion on how to actually support these boards
> with the mainline kernel and work on device drivers common
> with other systems now, and not in 2020 when they are already
> obsolete.
> 
> Yeah it is a bit controversial, but what we are doing right
> now for non-discoverable expansion boards isn't working
> in my opinion, so I have to throw something out there,
> and this is it.

< snip >

why  can't a devicetree description of the devices on the
mezzanine board be used?

I do understand the desire to describe interchangeable mezzanine
boards separately from the base devicetree, such as in an
overlay.  Overlays can be applied today by U-boot before the
Linux kernel is booted, so lack of being able to apply an
overlay after Linux boot completes is not a blocker.

-Frank

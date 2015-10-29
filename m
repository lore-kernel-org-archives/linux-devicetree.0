From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 2/3] ARM: zynq: DT: Add interrupt-controller property to
 GPIO
Date: Thu, 29 Oct 2015 08:53:42 +0100
Message-ID: <5631D086.9080603@xilinx.com>
References: <1445617532-10228-1-git-send-email-soren.brinkmann@xilinx.com>
 <1445617532-10228-2-git-send-email-soren.brinkmann@xilinx.com>
 <CACRpkdY-PR1Pd+=tm49cAjayC6LQbTUH7FDqmTN-1D8aYCw5Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY-PR1Pd+=tm49cAjayC6LQbTUH7FDqmTN-1D8aYCw5Ng@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/27/2015 05:04 PM, Linus Walleij wrote:
> On Fri, Oct 23, 2015 at 6:25 PM, Soren Brinkmann
> <soren.brinkmann@xilinx.com> wrote:
> 
>> GPIO can be used as interrupt-controller. Add the missing properties to
>> the GPIO node.
>>
>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied to zynq/dt.

Thanks,
Michal

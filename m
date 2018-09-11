From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v11 03/11] firmware: xilinx: Add zynqmp IOCTL API for
 device control
Date: Tue, 11 Sep 2018 19:20:18 +0000
Message-ID: <CY1PR02MB2138254CC5B1C2B2D41AB725B8040@CY1PR02MB2138.namprd02.prod.outlook.com>
References: <1533318808-10781-1-git-send-email-jollys@xilinx.com>
 <1533318808-10781-4-git-send-email-jollys@xilinx.com>
 <CAOesGMi7Q9L4oZkUubKtV-m8XD67MQ05ZFhPA_0Hwky_qVUxfg@mail.gmail.com>
 <CY1PR02MB2138BF2252E1CE2C1747A78AB8050@CY1PR02MB2138.namprd02.prod.outlook.com>
 <CAOesGMhViv_D6GKYf3x02LGqthwEsfkUFWBdG7pCQqD2MGsEew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMhViv_D6GKYf3x02LGqthwEsfkUFWBdG7pCQqD2MGsEew@mail.gmail.com>
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
To: Olof Johansson <olof@lixom.net>, Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Ingo Molnar <mingo@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Sudeep and Olof,

Clock driver from same patch set uses ioctl API along with other clock eemi APIs. As clock patches' final review is pending by Stephen, Michal only created pull request for rest of the patches and that doesn't require ioctl api. I will remove it and submit new patch set.

For future patches which requires ioctl api, would like to understand your suggestion so I can make required changes. For zynqmp, EEMI interface allows clock, reset, power etc management through firmware but apart from those there are some operations which needs secure access through firmware. Examples are accessing some storage registers for inter agent communication, configuring another agent(RPU) mode, setting PLL parameters, boot device configuration etc. Those operations are covered as ioctls as they are very platform specific. Do you suggest to handle them with individual EEMI APIs instead of ioctl API?

Thanks,
Jolly Shah


> -----Original Message-----
> From: Olof Johansson [mailto:olof@lixom.net]
> Sent: Tuesday, September 11, 2018 8:03 AM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: ard.biesheuvel@linaro.org; Ingo Molnar <mingo@kernel.org>; Greg Kroah-
> Hartman <gregkh@linuxfoundation.org>; matt@codeblueprint.co.uk; Sudeep
> Holla <sudeep.holla@arm.com>; hkallweit1@gmail.com; Kees Cook
> <keescook@chromium.org>; Dmitry Torokhov <dmitry.torokhov@gmail.com>;
> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@codeaurora.org>; Michal Simek <michals@xilinx.com>; Rob Herring
> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; linux-clk
> <linux-clk@vger.kernel.org>; Rajan Vaja <RAJANV@xilinx.com>; Linux ARM
> Mailing List <linux-arm-kernel@lists.infradead.org>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; DTML <devicetree@vger.kernel.org>
> Subject: Re: [PATCH v11 03/11] firmware: xilinx: Add zynqmp IOCTL API for
> device control
> 
> Hi Jolly,
> 
> On Mon, Sep 10, 2018 at 12:17 PM, Jolly Shah <JOLLYS@xilinx.com> wrote:
> > Hi All,
> >
> > Adding more clarification on top of what Michal said:
> > Here ioctl is not a system ioctl and just a eemi API like other interface APIs. It
> cannot be called from userspace. Only Linux drivers can use this API for defined
> ioctl operations. This API is meant for any platform specific operations which
> needs to be managed by firmware. Firmware will always validate the request for
> action being performed.
> > Debugfs interface is just for debugging during development. We can remove
> debugfs support for ioctl API if you suggest.
> 
> Are there any pending patchsets that make use of the ioctl interface besides the
> debugfs piece? None of the ones in this pull request (besides the debugfs) seems
> to call into it.
> 
> It might just be easier to leave it out until you have a use case for it. The rest of
> the patchset looks fine to me, and I'd be happy to take it. Once you have a need
> for it we can discuss specifics.
> 
> 
> -Olof

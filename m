From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v11 03/11] firmware: xilinx: Add zynqmp IOCTL API for
 device control
Date: Tue, 11 Sep 2018 08:03:06 -0700
Message-ID: <CAOesGMhViv_D6GKYf3x02LGqthwEsfkUFWBdG7pCQqD2MGsEew@mail.gmail.com>
References: <1533318808-10781-1-git-send-email-jollys@xilinx.com>
 <1533318808-10781-4-git-send-email-jollys@xilinx.com> <CAOesGMi7Q9L4oZkUubKtV-m8XD67MQ05ZFhPA_0Hwky_qVUxfg@mail.gmail.com>
 <CY1PR02MB2138BF2252E1CE2C1747A78AB8050@CY1PR02MB2138.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CY1PR02MB2138BF2252E1CE2C1747A78AB8050@CY1PR02MB2138.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <JOLLYS@xilinx.com>
Cc: "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, Ingo Molnar <mingo@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, Sudeep Holla <sudeep.holla@arm.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, Kees Cook <keescook@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Michal Simek <michals@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.k>
List-Id: devicetree@vger.kernel.org

Hi Jolly,

On Mon, Sep 10, 2018 at 12:17 PM, Jolly Shah <JOLLYS@xilinx.com> wrote:
> Hi All,
>
> Adding more clarification on top of what Michal said:
> Here ioctl is not a system ioctl and just a eemi API like other interface=
 APIs. It cannot be called from userspace. Only Linux drivers can use this =
API for defined ioctl operations. This API is meant for any platform specif=
ic operations which needs to be managed by firmware. Firmware will always v=
alidate the request for action being performed.
> Debugfs interface is just for debugging during development. We can remove=
 debugfs support for ioctl API if you suggest.

Are there any pending patchsets that make use of the ioctl interface
besides the debugfs piece? None of the ones in this pull request
(besides the debugfs) seems to call into it.

It might just be easier to leave it out until you have a use case for
it. The rest of the patchset looks fine to me, and I'd be happy to
take it. Once you have a need for it we can discuss specifics.


-Olof

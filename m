From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v5 5/6] Documentation: dt-bindings: Add binding info for
 X-Gene QMTM UIO driver
Date: Mon, 8 Dec 2014 11:15:39 -0600
Message-ID: <CAL_Jsq+F5GepyyZbpJOAKLtQsvJOF9wZzf2GyjA6sDe2nr4SrQ@mail.gmail.com>
References: <1416220572-13381-1-git-send-email-ankit.jindal@linaro.org>
 <2279061.naADrHDgyn@wuerfel> <CAPTm99WYNyxtY-NCVN8pB0HwNPn+EFx-7w7yEevaEK1z7-Zqxg@mail.gmail.com>
 <1503477.DVdkExccIe@wuerfel> <CAPTm99V1qP5dAgDV04i3m_yR1ri9h=b8fDXBDxmPfpZG_P268g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPTm99V1qP5dAgDV04i3m_yR1ri9h=b8fDXBDxmPfpZG_P268g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ankit Jindal <ankit.jindal@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Varka Bhadram <varkabhadram@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anup Patel <anup@brainfault.org>, Guenter Roeck <linux@roeck-us.net>, "patches@apm.com" <patches@apm.com>, Rob Herring <robh+dt@kernel.org>, "Hans J. Koch" <hjk@hansjkoch.de>, Tushar Jagad <tushar.jagad@linaro.org>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 8, 2014 at 6:42 AM, Ankit Jindal <ankit.jindal@linaro.org> wrote:
> On 18 November 2014 at 18:40, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tuesday 18 November 2014 14:59:54 Ankit Jindal wrote:
>>> On 17 November 2014 16:47, Arnd Bergmann <arnd@arndb.de> wrote:
>>> > On Monday 17 November 2014 16:06:11 Ankit Jindal wrote:
>>> >> +
>>> >> +       qmtm1_uio: qmtm_uio@1f200000 {
>>> >> +               compatible = "apm,xgene-qmtm";
>>> >> +               status = "disabled";
>>> >> +               reg = <0x0 0x1f200000 0x0 0x10000>,
>>> >> +                     <0x0 0x1b000000 0x0 0x400000>;
>>> >> +               reg-names = "csr", "fabric";
>>> >> +               qpool-memory = <&qmtm1_uio_qpool>;
>>> >> +               clocks = <&qmtm1clk 0>;
>>> >> +               num-queues = <0x400>;
>>> >> +               devid = <1>;
>>> >> +       };
>>> >> +
>>> >
>>> > To make my previous review comments clearer:
>>> >
>>> > NAK
>>> >
>>> > Do not create device nodes that are meant for a specific use case in
>>> > software and that are not usable for the common case. I don't think
>>> > it makes any sense to keep on submitting a UIO driver for this until
>>> > we have a proper network driver that uses this so we can make sure we
>>> > have a working binding.

+1

>>> The dataplane frameworks like OpenDataPlane etc, need to have access
>>> to complete subsystem from the user space. Hence, we would like to
>>> have this driver and some other UIO drivers to be the part of kernel
>>> to have data plane frameworks working on our platform.
>>
>> Please work with the people that do the in-kernel QMTM driver to come
>> up with a common binding then.
> Thanks Arnd, I have synced with them, and in future our dt bindings
> for this device is going to be inline with the one mentioned in the
> patchset.

What does "in the future" mean? Is there already a QMTM binding? If
so, you need to figure out how to either align with it or deprecate
it. This patch at a minimum needs to be fixed to not refer to UIO.

Rob

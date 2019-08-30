From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCHv1 0/3] Odroid c2 missing regulator linking
Date: Fri, 30 Aug 2019 09:31:07 +0200
Message-ID: <101a12ac-1464-8864-4f8c-56bb46034a08@baylibre.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
 <CANAwSgShr-K-44UzdxFC7pvpTye_pbEMdS6ug1eWwYhnsVNGdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgShr-K-44UzdxFC7pvpTye_pbEMdS6ug1eWwYhnsVNGdQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 29/08/2019 20:35, Anand Moon wrote:
> Hi Neil,
> 
> On Thu, 29 Aug 2019 at 13:58, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 28/08/2019 22:27, Anand Moon wrote:
>>> Below small changes help re-configure or fix missing inter linking
>>> of regulator node.
>>>
>>> Changes based top on my prevoius series.
>>
>> For the serie:
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>
> 
> Thanks for your review.
> 
>>>
>>> [0] https://patchwork.kernel.org/cover/11113091/
>>>
>>> TOOD: Add support for DVFS GXBB odroid board in next series.
>>
>> I'm curious how you will do this !
> 
> I was just studying you previous series on how you have implemented
> this feature for C1, N2 and VIM3 boards.
> 
> [0] https://patchwork.kernel.org/cover/11114125/
> 
> I started gathering key inputs needed for this ie *clk / pwm*
> like VDDCPU and VDDE clk changes.
> 
> But it looks like of the complex clk framework needed, so I leave this to the
> expert like your team of developers to do this much quick and efficiently.

On GXBB, GXL, GXM and AXG SoCs, CPU Frequency setting and PWM Regulator setup is
done by the SCPI Co-processor via the SCPI protocol.

Thus, we should not handle it from Linux, and even if we could, we don't have the
registers documentation of the CPU clusters clock tree.

SCPI works fine on all tested devices, except Odroid-C2, because Hardkernel left
the > 1.5GHz freq in the initial SCPI tables loaded by the BL2, i.e. packed with U-Boot.
Nowadays they have removed the bad frequencies, but still some devices uses the old
bootloader.

But in the SCPI case we trust the table returned by the firmware and use it as-in,
and there is no (simple ?) way to override the table and set a max frequency.

This is why we disabled SCPI.

See https://patchwork.kernel.org/patch/9500175/

Neil

> 
> Best Regards,
> -Anand
> 

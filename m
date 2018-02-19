From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 2/6] mfd: Add ST Multi-Function eXpander core driver
Date: Mon, 19 Feb 2018 16:00:48 +0000
Message-ID: <889cec8c-5a3a-ffc5-e6fa-aa388485e601@st.com>
References: <1518100057-23234-1-git-send-email-amelie.delaunay@st.com>
 <1518100057-23234-3-git-send-email-amelie.delaunay@st.com>
 <20180212120600.5cghrzz4jqvvkgz6@dell>
 <CAOFm3uH+DLcOqiSV0z0N6JnmSk+JfTF3bfkC0_2kdFT-eDMr8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOFm3uH+DLcOqiSV0z0N6JnmSk+JfTF3bfkC0_2kdFT-eDMr8A@mail.gmail.com>
Content-Language: en-US
Content-ID: <7693714657D62040ADFB3C50F73EB2A2@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Thanks Philippe,

I will take this into account for V2.

Regards,
Amelie

On 02/12/2018 03:15 PM, Philippe Ombredanne wrote:
> Amelie,
> 
> On Mon, Feb 12, 2018 at 1:06 PM, Lee Jones <lee.jones@linaro.org> wrote:
>> On Thu, 08 Feb 2018, Amelie Delaunay wrote:
>>
>>> ST Multi-Function eXpander (MFX) is a slave controller using I2C
>>> for communication with the main MCU. Main features are:
>>> - 16 fast GPIOs individually configurable in input/output
>>> - 8 alternate GPIOs individually configurable in input/output
>>> - Main MCU IDD measurement
>>> - Resistive touchscreen controller
>>>
>>> Only GPIO expander (16 fast GPIOs + 8 alternate) feature is
>>> supported for the moment.
>>>
>>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> 
> <snip>
> 
>>> --- /dev/null
>>> +++ b/drivers/mfd/st-mfx.c
>>> @@ -0,0 +1,526 @@
>>> +/*
>>> + * STMicroelectronics Multi-Function eXpander (ST-MFX) Core Driver
>>> + *
>>> + * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
>>> + * Author(s): Amelie Delaunay <amelie.delaunay@st.com> for STMicroelectronics.
>>
>> You don't need to put "for STMicroelectronics".  This was something we
>> made up when submitting from a different (!st.com) email address.
>>
>>> + * License terms: GPL V2.0.
>>> + *
>>> + * st-mfx Core Driver is free software; you can redistribute it and/or modify it
>>> + * under the terms of the GNU General Public License version 2 as published by
>>> + * the Free Software Foundation.
>>> + *
>>> + * st-mfx Core Driver is distributed in the hope that it will be useful, but
>>> + * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
>>> + * details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License along with
>>> + * st-mfx Core Driver. If not, see <http://www.gnu.org/licenses/>.
>>
>> You should be able to use the short version of the licensing
>> agreement.  Also, please grep for "SPDX".
> 
> You can check the doc for the (fairly new) way to remove legalese
> boilerplate at Documentation/process/license-rules.rst or [1]
> It helps keep the focus on the code and less on licensing!
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst
> 

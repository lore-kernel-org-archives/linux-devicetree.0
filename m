From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v3 4/5] regulator: lochnagar: Add support for the Cirrus
 Logic Lochnagar
Date: Fri, 19 Oct 2018 13:02:45 +0100
Message-ID: <70dcdc5d-73c2-d26f-6228-4bb0bb8ef612@opensource.cirrus.com>
References: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
 <20181019095003.26046-4-ckeepax@opensource.cirrus.com>
 <20181019112622.GB5895@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181019112622.GB5895@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19/10/18 12:26, Mark Brown wrote:
> On Fri, Oct 19, 2018 at 10:50:02AM +0100, Charles Keepax wrote:
> 
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.
> 
>> +++ b/drivers/regulator/lochnagar-regulator.c
>> @@ -0,0 +1,255 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Lochnagar regulator driver
> 
> Please don't mix C and C++ comments like this in the same block, just
> have it be a C++ block so it looks consistent.
> 

Most SPDX headers on C files that I've looked at have it this way with a
C++ style comment above a C-style comment, though some don't. license-rules.rst
doesn't define how or if a SPDX comment line should be merged with the following
file header comment. I've had a bunch of patches in different subsystems all
accepted with this mixed format (copied from existing files). Doing the same as
existing files sounds reasonable but often isn't in the Linux kernel. It's a
common problem/barrier to kernel programming that existing code isn't a guide
and there isn't a consistent style across the kernel so one never really knows
what the coding style is until you've pushed a patch and annoyed a maintainer.
And then you adopt that style on your next patch and annoy different maintainer.

Maybe someone should update license-rules.rst to make a definite statement of the
style instead of leaving it to become another style that varies across the kernel
and between files.

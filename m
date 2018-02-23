Return-Path: <SRS0=VKUP=FR=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180223064138.18401-1-jh80.chung@samsung.com>
References: <CGME20180223064140epcas2p104fe6cca431ec24f2b09a6f5a45ed342@epcas2p1.samsung.com>
 <20180223064138.18401-1-jh80.chung@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 23 Feb 2018 15:27:06 +0200
Message-ID: <CAHp75Vd27mFnSJTOta0ZWhfOGz1WA8ETNgU_GpuxEJ9nnhsR-g@mail.gmail.com>
Subject: Re: [PATCH 1/6] mmc: dw_mmc: remove the deprecated
 "clock-freq-min-max" property
Content-Type: text/plain; charset="UTF-8"
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joachim Eastwood <manabian@gmail.com>, dinguyen@kernel.org, Will Deacon <will.deacon@arm.com>, "xuwei (O)" <xuwei5@hisilicon.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 23, 2018 at 8:41 AM, Jaehoon Chung <jh80.chung@samsung.com> wrote:
> 'clock-freq-min-max' property had already deprecated.
> Remove the 'clock-freq-min-max' property that is kept to maintain
> the compatibility.

Removing a property without telling the user what to expect is a bad
idea and ABI breakage.

-- 
With Best Regards,
Andy Shevchenko

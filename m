From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v5 1/7] gpio: davinci: remove unnecessary printk
Date: Mon, 11 Nov 2013 21:09:34 +0530
Message-ID: <CA+V-a8tD0NVEij6qXZ6iYe96QwpvTKjcmdBv0S4qzwRkCzDtjw@mail.gmail.com>
References: <1383905510-31760-1-git-send-email-prabhakar.csengg@gmail.com>
 <1383905510-31760-2-git-send-email-prabhakar.csengg@gmail.com> <527D05BA.3000008@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <527D05BA.3000008@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LDOC <linux-doc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Grygorii,

Thanks for the review.

On Fri, Nov 8, 2013 at 9:09 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 11/08/2013 12:11 PM, Prabhakar Lad wrote:
>>
>> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>>
>> the devm_*() helper prints error messages in case of
>> errors no need to do the same in the driver.
>
>
> Pls, drop it - devm_clk_get() doesn't always print error messages
>
OK will drop in the next version.

Regards,
--Prabhakar Lad

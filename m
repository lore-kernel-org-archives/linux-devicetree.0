From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
Date: Thu, 7 Dec 2017 18:00:37 +0200
Message-ID: <176b5b3a-d1da-247a-1a90-acf7624df460@linaro.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <CAHLCerMok=-0hFLm27_VzSWzC7nArmTz+shQH05DAuBr3An9qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAHLCerMok=-0hFLm27_VzSWzC7nArmTz+shQH05DAuBr3An9qw@mail.gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Amit,

On 12/06/2017 07:51 AM, Amit Kucheria wrote:
> On Tue, Dec 5, 2017 at 9:16 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
>> This patchset adds support for the A53 CPU clock on MSM8916 platforms
>> and allows scaling of the CPU frequency on msm8916 based platforms.
> 
> Though it currently needs some additional patches (that'll follow
> soon), FWIW, Tested-by: Amit Kucheria <amit.kucheria@linaro.org>

Thanks for testing! I will submit the platform specific dts changes as
separate follow-up patches when this is merged.

BR,
Georgi

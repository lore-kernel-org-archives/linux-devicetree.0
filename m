From: Craig <ctatlor97@gmail.com>
Subject: Re: [PATCH] clk: qcom: Add Global Clock controller (GCC) driver for SDM660
Date: Mon, 24 Sep 2018 15:33:56 +0100
Message-ID: <0E2DD374-B1DA-47D9-B327-D5BBC39F7FBB@gmail.com>
References: <20180407135934.26122-1-ctatlor97@gmail.com> <69cf26ba-5dae-e84c-2fa8-15699fdd9986@codeaurora.org> <63F4E7C0-6925-4EC0-84B9-75B31AC664E4@gmail.com> <9156720.4hgryJ20kK@phil>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9156720.4hgryJ20kK@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 24 September 2018 13:44:33 BST, Heiko Stuebner <heiko@sntech=2Ede> wrot=
e:
>Hi Craig,
>
>Am Montag, 13=2E August 2018, 09:45:09 CEST schrieb Craig Tatlor:
>> On 13 August 2018 07:55:34 BST, Taniya Das <tdas@codeaurora=2Eorg>
>wrote:
>> >Hello Craig,
>> >
>> >Could you please correct the authorship and also provide the
>reference=20
>> >to code where this is picked from?
>> Okay,=20
>> Got code from here
>https://github=2Ecom/sonyxperiadev/kernel/blob/aosp/LA=2EUM=2E6=2E4=2Er1/=
drivers/clk/qcom/gcc-sdm660=2Ec
>> but changed it quite a bit for upstream,
>> Should I change the commit author and add your signed off by and say
>I did cleanups on my signed off by=2E
>
>yep, for something this huge it is really the correct way to keep the
>original authorship intact as Taniya did the initial big work, and just
>add you change-description, so something like
>
>---- 8< ------
>Add support for the global clock controller found on SDM660
>based devices=2E This should allow most non-multimedia device
>drivers to probe and control their clocks=2E
>Based on CAF implementation=2E
>
>Signed-off-by: Taniya Das <tdas@codeaurora=2Eorg>
>[ description of changes =2E=2E=2E often seen in these brackets ]
>Signed-off-by: Craig Tatlor <ctatlor97@gmail=2Ecom>
>---- 8< ------
>
Sure, will do, though I'm sure qcom have a program to generate the drivers=
 :)

>Also, do you plan to continue working on this, as I would be
>interessted
>in the clock driver for a sdm660-based phone as well
Yup, was really just waiting for reply to this question,
>
>
>Thanks
>Heiko

--=20

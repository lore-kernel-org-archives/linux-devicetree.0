From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 2/3] of: add optional options parameter to of_find_node_by_path()
Date: Fri, 13 Mar 2015 10:23:47 -0500
Message-ID: <CAL_Jsq+hznVHJommOhZ1hCjhvp81kZjEHUGtmJyxFreTXZ5T7A@mail.gmail.com>
References: <1417110967-16284-1-git-send-email-leif.lindholm@linaro.org>
 <1417110967-16284-3-git-send-email-leif.lindholm@linaro.org>
 <54F7287E.6060302@hurleysoftware.com> <20150306165253.GJ4278@bivouac.eciton.net>
 <54F9EDE8.1090902@hurleysoftware.com> <54F9F92F.7080900@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F9F92F.7080900@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Leif Lindholm <leif.lindholm@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, ijc@debian.org, Andrew Lunn <andrew@lunn.ch>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 6, 2015 at 12:59 PM, Peter Hurley <peter@hurleysoftware.com> wrote:
> On 03/06/2015 01:11 PM, Peter Hurley wrote:
>> On 03/06/2015 11:52 AM, Leif Lindholm wrote:
>
> [...]
>
>>> Could you give the below a spin, and if it works for you, send me the
>>> above tests as a full patch so that I can post both as a series?
>>
>> Will do as soon as I finish testing.
>
> All passed with your patch; patch for testcases below.

Applied both for 4.0. Thanks.

Rob

>
> Regards,
> Peter Hurley
>
> --- >% ---
> From: Peter Hurley <peter@hurleysoftware.com>
> Subject: [PATCH] of: unittest: Add options string testcase variants
>
> Add testcase variants with '/' in the options string to test for
> scan beyond end path name terminated by ':'.
>
> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
> ---
>  drivers/of/unittest.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 0cf9a23..b2d7547 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -92,6 +92,11 @@ static void __init of_selftest_find_node_by_name(void)
>                  "option path test failed\n");
>         of_node_put(np);
>
> +       np = of_find_node_opts_by_path("/testcase-data:test/option", &options);
> +       selftest(np && !strcmp("test/option", options),
> +                "option path test, subcase #1 failed\n");
> +       of_node_put(np);
> +
>         np = of_find_node_opts_by_path("/testcase-data:testoption", NULL);
>         selftest(np, "NULL option path test failed\n");
>         of_node_put(np);
> @@ -102,6 +107,12 @@ static void __init of_selftest_find_node_by_name(void)
>                  "option alias path test failed\n");
>         of_node_put(np);
>
> +       np = of_find_node_opts_by_path("testcase-alias:test/alias/option",
> +                                      &options);
> +       selftest(np && !strcmp("test/alias/option", options),
> +                "option alias path test, subcase #1 failed\n");
> +       of_node_put(np);
> +
>         np = of_find_node_opts_by_path("testcase-alias:testaliasoption", NULL);
>         selftest(np, "NULL option alias path test failed\n");
>         of_node_put(np);
> --
> 2.3.1
>
>

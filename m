From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] [media] s5p-g2d: Add DT based discovery support
Date: Thu, 31 Jan 2013 11:59:10 +0530
Message-ID: <CAK9yfHzHOY4D_QW3BU0ihUcvrJ96vN7mQwEXQD0ezcjesbKwuw@mail.gmail.com>
References: <1359107722-9974-1-git-send-email-sachin.kamat@linaro.org>
	<510992D8.9030800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <510992D8.9030800@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, k.debski@samsung.com, inki.dae@samsung.com, ajaykumar.rs@samsung.com, patches@linaro.org, s.nawrocki@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Sylwester.

Thank you for the review.

On 31 January 2013 03:08, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi Sachin,
>
>
> On 01/25/2013 10:55 AM, Sachin Kamat wrote:
>>
>> This patch adds device tree based discovery support to G2D driver
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>
> Don' you need something like:
>
>         else {
>                 of_id = of_match_node(exynos_g2d_match, pdev->dev.of_node);
>                 if (!of_id)
>                         return -ENODEV;
>                 dev->variant = (struct g2d_variant *)of_id->data;
>         }
> ?
>
> Otherwise dev->variant is left uninitialized...?

Exactly. The above code is very much required. Not sure how I missed it :(

>
>
>>         return 0;
>>
>> @@ -844,6 +846,18 @@ static struct g2d_variant g2d_drvdata_v4x = {
>>         .hw_rev = TYPE_G2D_4X, /* Revision 4.1 for Exynos4X12 and Exynos5
>> */
>>   };
>>
>> +static const struct of_device_id exynos_g2d_match[] = {
>> +       {
>> +               .compatible = "samsung,g2d-v3",
>> +               .data =&g2d_drvdata_v3x,
>> +       }, {
>> +               .compatible = "samsung,g2d-v41",
>> +               .data =&g2d_drvdata_v4x,
>
>
> Didn't you consider adding "exynos" to these compatible strings ?
> I'm afraid g2d may be too generic.

Choosing the right compatible string seems to be the biggest challenge :)
I did consider adding "exynos" to the compatible strings, but then MFC
used it as "mfc-v5" and I followed the same example. Prepending exynos
makes it more specific and should be added (even to MFC) IMO too.
We need to arrive at a consensus about the bindings (right now for
g2d) as they would be common irrespective of DRM or V4L2 framework.
Please let me know your opinion about Inki's suggestion to use version
property instead.

>
>
>> +       },
>> +       {},
>> +               .of_match_table = of_match_ptr(exynos_g2d_match),
>
>
> of_match_ptr() could be dropped, since exynos_g2d_match[] is
> always compiled in.

OK.

Once I get confirmation about the compatible strings, I will resend
this patch with other suggested updates.

-- 
With warm regards,
Sachin

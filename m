From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] drm/exynos: Add device tree based discovery support
 for G2D
Date: Fri, 01 Feb 2013 00:47:55 +0100
Message-ID: <510B02AB.4080908@gmail.com>
References: <1359107722-9974-1-git-send-email-sachin.kamat@linaro.org> <1359107722-9974-2-git-send-email-sachin.kamat@linaro.org> <CAAQKjZNc0xFaoaqtKsLC=Evn60XA5UChtoMLAcgsWqyLNa7ejQ@mail.gmail.com> <510987B5.6090509@gmail.com> <050101cdff52$86df3a70$949daf50$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <050101cdff52$86df3a70$949daf50$%dae@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, s.nawrocki@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Inki,

On 01/31/2013 02:30 AM, Inki Dae wrote:
>> -----Original Message-----
>> From: Sylwester Nawrocki [mailto:sylvester.nawrocki@gmail.com]
>> Sent: Thursday, January 31, 2013 5:51 AM
>> To: Inki Dae
>> Cc: Sachin Kamat; linux-media@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; devicetree-discuss@lists.ozlabs.org;
>> patches@linaro.org; s.nawrocki@samsung.com
>> Subject: Re: [PATCH 2/2] drm/exynos: Add device tree based discovery
>> support for G2D
>>
>> On 01/30/2013 09:50 AM, Inki Dae wrote:
>>>> +static const struct of_device_id exynos_g2d_match[] = {
>>>> +       { .compatible = "samsung,g2d-v41" },
>>>
>>> not only Exynos5 and also Exyno4 has the g2d gpu and drm-based g2d
>>> driver shoud support for all Exynos SoCs. How about using
>>> "samsung,exynos5-g2d" instead and adding a new property 'version' to
>>> identify ip version more surely? With this, we could know which SoC
>>> and its g2d ip version. The version property could have '0x14' or
>>> others. And please add descriptions to dt document.
>>
>> Err no. Are you suggesting using "samsung,exynos5-g2d" compatible string
>> for Exynos4 specific IPs ? This would not be correct, and you still can
>
> I assumed the version 'v41' is the ip for Exynos5 SoC. So if this version
> means Exynos4 SoC then it should be "samsung,exynos4-g2d".

Yes, v3.0 is implemented in the S5PC110 (Exynos3110) SoCs and Exynos4210,
V4.1 can be found in Exynos4212 and Exynos4412, if I'm not mistaken.

So we could have:

compatible = "samsung,exynos-g2d-3.0" /* for Exynos3110, Exynos4210 */
compatible = "samsung,exynos-g2d-4.1" /* for Exynos4212, Exynos4412 */

or alternatively

compatible = "samsung,exynos3110-g2d" /* for Exynos3110, Exynos4210 */
compatible = "samsung,exynos4212-g2d" /* for Exynos4212, Exynos4412 */

I don't see a need to use an additional redundant property to identify
the device. These IPs across Exynos SoC do differ and specifying
a general property like "samsung,exynos4-g2d" for them would simply be
a violation of existing conventions.

--

Thanks,
Sylwester

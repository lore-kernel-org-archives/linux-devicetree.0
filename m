From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for
 gpio-buttons
Date: Mon, 11 Mar 2013 15:14:22 +0530
Message-ID: <513DA776.4040800@linaro.org>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org> <8299289.2GSO3WcaG5@amdc1227> <04ff01ce1dfc$d830bd40$889237c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <04ff01ce1dfc$d830bd40$889237c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, 'Thomas Abraham' <thomas.abraham@linaro.org>
List-Id: devicetree@vger.kernel.org

On 03/11/2013 07:35 AM, Kukjin Kim wrote:
> Tomasz Figa wrote:
>>
>> Hi,
>>
>> I'm wondering why Exynos5250 has not been migrated to use pinctrl yet.
>>
>> Support for it in pinctrl-samsung driver has been already merged, but I
>> don't see any pinctrl nodes in exynos5250.dtsi.
>>
>> This is important because the legacy gpio-samsung support is going to be
>> dropped, as it already happened in case of Exynos 4.
>>
>> CC'ing Thomas Abraham as he might know something.
>>
> Tushar and all,
> 
> I agree with Tomasz's opinion to support pinctrl instead of gpio on exynos5250
> stuff.
> 
> Please re-submit with using pinctrl is in samsung tree.
> 

Ok. I will rebase the patchset on for-next branch and re-submit.


-- 
Tushar Behera

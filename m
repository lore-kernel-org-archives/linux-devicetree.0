From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/6] ARM: dts: Add MFC codec support to SMDKV310 DT
Date: Wed, 30 Jan 2013 11:42:58 +0530
Message-ID: <CAK9yfHy8bp8-19jZ_bQQ8MDT3Bvpg_SyWMnA8PFnQuay4=pwMw@mail.gmail.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
	<1359432822-23846-4-git-send-email-sachin.kamat@linaro.org>
	<5107D167.4050209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <5107D167.4050209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

>> +     codec@13400000 {
>> +             samsung,mfc-r = <0x43000000 0x800000>;
>> +             samsung,mfc-l = <0x51000000 0x800000>;
>
> With the change as I proposed in patch 2/6 you need to add:
>
>                 status = "okay";
>
> in this node and for all other boards in the further patches
> in this series.

Right. Will update the series with your comments and re-send it.
Thank you for reviewing.

-- 
With warm regards,
Sachin

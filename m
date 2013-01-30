From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] drm/exynos: Add device tree based discovery support
 for G2D
Date: Wed, 30 Jan 2013 21:51:01 +0100
Message-ID: <510987B5.6090509@gmail.com>
References: <1359107722-9974-1-git-send-email-sachin.kamat@linaro.org> <1359107722-9974-2-git-send-email-sachin.kamat@linaro.org> <CAAQKjZNc0xFaoaqtKsLC=Evn60XA5UChtoMLAcgsWqyLNa7ejQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CAAQKjZNc0xFaoaqtKsLC=Evn60XA5UChtoMLAcgsWqyLNa7ejQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, s.nawrocki@samsung.com
List-Id: devicetree@vger.kernel.org

On 01/30/2013 09:50 AM, Inki Dae wrote:
>> +static const struct of_device_id exynos_g2d_match[] = {
>> +       { .compatible = "samsung,g2d-v41" },
>
> not only Exynos5 and also Exyno4 has the g2d gpu and drm-based g2d
> driver shoud support for all Exynos SoCs. How about using
> "samsung,exynos5-g2d" instead and adding a new property 'version' to
> identify ip version more surely? With this, we could know which SoC
> and its g2d ip version. The version property could have '0x14' or
> others. And please add descriptions to dt document.

Err no. Are you suggesting using "samsung,exynos5-g2d" compatible string
for Exynos4 specific IPs ? This would not be correct, and you still can
match the driver with multiple different revisions of the IP and associate
any required driver's private data with each corresponding compatible
property.

Perhaps it would make more sense to include the SoCs name in the compatible
string, e.g. "samsung,exynos-g2d-v41", but appending revision of the IP
seems acceptable to me. The revisions appear to be well documented and it's
more or less clear which one corresponds to which SoC.

--

Thanks,
Sylwester

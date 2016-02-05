From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: dts: apq8016-sbc: Add DT node for the uSD SDHC
 interface
Date: Fri, 5 Feb 2016 19:45:41 +0200
Message-ID: <56B4DFC5.7030700@linaro.org>
References: <1454590402-13507-1-git-send-email-georgi.djakov@linaro.org>
 <7hmvrgb06c.fsf@baylibre.com>
 <CAOi56cWWfJCFyC_ndRqhm6c0QeQF=nXkcK3RCVdCDXTBag=+ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAOi56cWWfJCFyC_ndRqhm6c0QeQF=nXkcK3RCVdCDXTBag=+ow@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/05/2016 12:44 AM, Kevin Hilman wrote:
> On Thu, Feb 4, 2016 at 2:06 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>> Georgi Djakov <georgi.djakov@linaro.org> writes:
>>
>>> Add the necessary properties to enable the SD-card on db410c boards.
>>>
>>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>>
>> I tried this with 2 different SD cards on my dragonboard 410c but it's
>> not detecting either card.
> 
> To be more precise, I tried this patch on v4.5-rc1 and today's
> linux-next using the default defconfig + CONFIG_MMC_SDHCI_MSM=y, and
> see the same voltage errors on both.
>

Hi Kevin, thanks for trying this. I got the same with v4.5-rc2, but
this is expected as it depends on the another recently merged patch
in linux-next. Perhaps I should have mentioned this in the commit
message.

Anyway, just checked with next-20160205 and it works for me - tested
with 3 different cards. Not sure why it does not work for you.
Could you please check if you have the following patch in your tree:

4fbdc4e6adbc arm64: dts: apq8016-sbc: add regulators support
$ git tag --contains 4fbdc4e6adbc
next-20160201
next-20160202
next-20160203
next-20160204
next-20160205

BR,
Georgi

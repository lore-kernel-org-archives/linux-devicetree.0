From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 02/14] arm64: dts: meson-gx: drop the vpu dmc memory cell
Date: Wed, 21 Aug 2019 16:04:43 +0200
Message-ID: <a2c791d0-92bf-b7a0-777f-74c4515326a2@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-3-narmstrong@baylibre.com>
 <CAFBinCBQwsoO1dGKzzkE4Jh9VeqDhiy__m96X=CZBKSDRrHDOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBQwsoO1dGKzzkE4Jh9VeqDhiy__m96X=CZBKSDRrHDOw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20/08/2019 22:28, Martin Blumenstingl wrote:
> On Wed, Aug 14, 2019 at 4:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> This fixes the following DT schemas check errors:
>> meson-gxl-s805x-libretech-ac.dt.yaml: vpu@d0100000: reg-names: Additional items are not allowed ('dmc' was unexpected)
>> meson-gxl-s805x-libretech-ac.dt.yaml: vpu@d0100000: reg-names: ['vpu', 'hhi', 'dmc'] is too long
> if you have to re-send it for whatever reason I would add:
> "
> The 'dmc' register area was replaced by the amlogic,canvas property
> which was introduced in commit f1726043426c73 ("arm64: dts: meson-gx:
> add dmcbus and canvas nodes.") and commit cf34287986d0b6 ("arm64: dts:
> meson-gx: Add canvas provider node to the vpu> "

Sure, thanks for the review !

> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 

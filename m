From: guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH 2/2] clk: meson-g12a: Add Temperature Sensor clock
Date: Fri, 12 Apr 2019 10:25:56 +0200
Message-ID: <fc4e0fbd-2643-2f37-9cdb-2ec162826e76@baylibre.com>
References: <20190411084537.30299-1-glaroque@baylibre.com>
 <20190411084537.30299-3-glaroque@baylibre.com>
 <CAFBinCBVmPa5hi83B1ZTe-guassHxKQFrN5QOyMJc9s95LJ1cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBVmPa5hi83B1ZTe-guassHxKQFrN5QOyMJc9s95LJ1cg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: jbrunet@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

hi martin,


On 4/11/19 11:38 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Thu, Apr 11, 2019 at 10:46 AM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> Add TS clock used by two temperature sensor
> thank you for working on this!
>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  drivers/clk/meson/g12a.c | 31 +++++++++++++++++++++++++++++++
>>  drivers/clk/meson/g12a.h |  3 ++-
>>  2 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 3a3134976534..e6d2af6ee8ea 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -2335,6 +2335,33 @@ static struct clk_regmap g12a_mali = {
>>         },
>>  };
>>
>> +static struct clk_regmap g12a_ts_div = {
>> +       .data = &(struct clk_regmap_div_data){
>> +               .offset = HHI_TS_CLK_CNTL,
>> +               .shift = 0,
>> +               .width = 7,
> buildroot_openlinux_kernel_4.9_fbdev_20180706 uses ".width = 8".
> That matches with the public S922X datasheet from hardkernel which
> states that HHI_TS_CLK_CNTL[7:0] is "ts_clk clk_div"

sorry for this error i'll fix it

>
> Martin

Thanks

guillqume

From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/2] reset: meson-audio-arb: add sm1 support
Date: Tue, 01 Oct 2019 11:40:20 +0200
Message-ID: <1jk19oregr.fsf@starbuckisacylon.baylibre.com>
References: <20190905135040.6635-1-jbrunet@baylibre.com> <1567693618.3958.4.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1567693618.3958.4.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Thu 05 Sep 2019 at 16:26, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Jerome,
>
> On Thu, 2019-09-05 at 15:50 +0200, Jerome Brunet wrote:
>> This patchset adds the new arb reset lines for the sm1 SoC family
>> It has been tested on the sei610 platform.
>> 
>> Changes since v1 [0]:
>> * Fix the mistake on the number of reset as reported by Phililpp (thx)
>> 
>> [0]:  https://lkml.kernel.org/r/20190820094625.13455-1-jbrunet@baylibre.com
>> 
>> Jerome Brunet (2):
>>   reset: dt-bindings: meson: update arb bindings for sm1
>>   reset: meson-audio-arb: add sm1 support
>> 
>>  .../reset/amlogic,meson-axg-audio-arb.txt     |  3 +-
>>  drivers/reset/reset-meson-audio-arb.c         | 43 +++++++++++++++++--
>>  .../reset/amlogic,meson-axg-audio-arb.h       |  2 +
>>  3 files changed, 44 insertions(+), 4 deletions(-)
>
> Thank you, both applied to reset/next.

Hi Philipp,

Looks like this patchset missed v5.4-rc1.
Could you provide a tag with the bindings to Kevin so we can use the IDs
in DT until the next merge window ?

Thx
Regards

Jerome

>
> regards
> Philipp

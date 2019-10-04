From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/2] reset: meson-audio-arb: add sm1 support
Date: Fri, 04 Oct 2019 07:46:47 -0700
Message-ID: <7hpnjch8ko.fsf@baylibre.com>
References: <20190905135040.6635-1-jbrunet@baylibre.com> <1567693618.3958.4.camel@pengutronix.de> <1jk19oregr.fsf@starbuckisacylon.baylibre.com> <20191003180311.hlv7s32twzcaxj3x@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003180311.hlv7s32twzcaxj3x@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <pza@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Philipp Zabel <pza@pengutronix.de> writes:

> Hi Jerome,
>
> On Tue, Oct 01, 2019 at 11:40:20AM +0200, Jerome Brunet wrote:
> [...]
>> Looks like this patchset missed v5.4-rc1.
>> Could you provide a tag with the bindings to Kevin so we can use the IDs
>> in DT until the next merge window ?
>
> Does
>
>   git://git.pengutronix.de/git/pza/linux.git reset/meson-sm1-bindings
>
> work for you?

I'd prefer a tag as that's more of an indicator that it will be static,
but if you're sure that's going to be static, and is the same branch/tag
you'll be sending upstream, that will work.

Kevin

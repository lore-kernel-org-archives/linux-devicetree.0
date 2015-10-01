From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] ARM: dts: sun6i: hummingbird: Add aliases for rtc devices
Date: Thu, 1 Oct 2015 20:06:01 +0800
Message-ID: <CAGb2v65e4te+HnKJj7vM72n+OKLOfcrm=9zJ338B=M78kE9FAg@mail.gmail.com>
References: <1443600937-11071-1-git-send-email-wens@csie.org> <20151001101126.GD7104@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151001101126.GD7104@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 1, 2015 at 6:11 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Wed, Sep 30, 2015 at 04:15:37PM +0800, Chen-Yu Tsai wrote:
>> The hummingbird A31 has 2 rtc devices available: one in the SoC, and
>> a pcf8563 external rtc on i2c2.
>>
>> For some unknown reason, the onboard backup battery to power the
>> internal rtc when power is removed, and its time would reset. Hence
>> we want to use the external one by default.
>
> The patch looks fine, but I'm not sure to understand the first
> sentence of that paragraph :/

Neither do I :/ I'll send another version.

ChenYu

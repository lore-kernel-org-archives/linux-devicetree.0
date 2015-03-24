From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 12/12] ARM: dts: sun6i: hummingbird: Add basic support
 for the WiFi module
Date: Mon, 23 Mar 2015 17:24:55 -0700
Message-ID: <CAGb2v64+-KW5JsAvHhvt4jFD=CAkf37D5XyJ4B1f0WUXWLBodA@mail.gmail.com>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-13-git-send-email-wens@csie.org> <20150323221629.GG15676@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150323221629.GG15676@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 23, 2015 at 3:16 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Tue, Mar 10, 2015 at 07:59:23PM +0800, Chen-Yu Tsai wrote:
>> The Hummingbird A31 has an AMPAK AP6210 WiFi+Bluetooth module. The
>> WiFi part is a BCM43362 IC connected to MMC1 in the A31 SoC via SDIO.
>> The IC also takes a power enable signal via GPIO.
>>
>> The WiFi module supports out-of-band interrupt signaling via GPIO,
>> but this is not supported in this patch.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> Applied, thanks!

Thanks, but I don't see this particular patch in dt-for-4.1 you just pushed.

ChenYu

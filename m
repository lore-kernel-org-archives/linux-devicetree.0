From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 0/3] arm64: dts: A64 board MMC support
Date: Wed, 11 Jan 2017 14:24:38 +0000
Message-ID: <27630511-d97c-b1ad-ef18-25fa84b6275d@arm.com>
References: <1484011353-21480-1-git-send-email-andre.przywara@arm.com>
 <20170111135139.ktirdwmzhyv3cn2q@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170111135139.ktirdwmzhyv3cn2q@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/01/17 13:51, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jan 10, 2017 at 01:22:30AM +0000, Andre Przywara wrote:
>> These patches here go on top of Maxime's latest A64 MMC series and
>> enable the MMC controllers on the boards using the A64 SoC.
>> As the BananaPi-M64 DT now looks different, lets adds support for
>> that board as well, with one major difference to the Pine64 being the eMMC
>> chip.
>>
>> I could't find commit f9ca9b952ee1 Maxime mentioned in his cover letter,
>> so I applied his patches on top of sunxi/for-next and cherry-picked
>> b4b8664d29 to fix the arm64 build.
> 
> I'm fine with all your patches. I've queued them in my MMC series, and
> will continue pushing them and / or merging them if it's ok for you.

Yes, please do!

Many thanks!

Cheers,
Andre.

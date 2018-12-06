From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: rockpro64 fix video output chain
Date: Thu, 06 Dec 2018 14:03:27 +0100
Message-ID: <3141294.pN5WgFrMoD@phil>
References: <20181201100817.20688-1-oskari@lemmela.net> <20181201100817.20688-3-oskari@lemmela.net> <09287391-d541-cddb-4168-55ca6fee3f16@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <09287391-d541-cddb-4168-55ca6fee3f16@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: agajjar <Akash_Gajjar@mentor.com>
Cc: Oskari Lemmela <oskari@lemmela.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 5. Dezember 2018, 14:03:29 CET schrieb agajjar:
> 
> On 12/1/2018 3:38 PM, Oskari Lemmela wrote:
> > Rockpro64 is not able boot if kernel is compiled with
> > CONFIG_DRM_ROCKCHIP=m
> >
> > Enable Rockpro64 board HDMI output to fix issue.
> 
> Hi Oskari,
> 
> Could you please describe this issue in detail.
> 
> I am not able to reproduce this issue if CONFIG_DRM_ROCKCHIP is compile 
> in or as a loadable module at the same time hdmi node is present or not.

I've now simply adjusted the commit message to:
"arm64: dts: rockchip: enable hdmi output on rk3399-rockpro64
    
The rockpro64 does have hdmi support, so add the necessary
devicetree node to enable it."

and applied it for 4.21.

While it still would be good to find out where the issue comes from Oskari
is seeing, the rockpro64 does have hdmi, so we can just enable it ;-)


Heiko

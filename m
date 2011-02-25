From: Daniel Drake <dsd@laptop.org>
Subject: Re: [PATCH] olpc_battery: bind to device tree
Date: Fri, 25 Feb 2011 14:32:04 +0000
Message-ID: <AANLkTimhoYYYC64ZkDp8=f5dAgLmK7B-9Jud9-n0e4S2@mail.gmail.com>
References: <20110219150644.681D59D401D@zog.reactivated.net>
	<AANLkTi=29myerzgH6WRCSOPKpaDnGgEtQacVHvxRoQT_@mail.gmail.com>
	<AANLkTi=2a=9=k+ZG46yqKOaHd9tCkJVm4QRxGmgbRzsv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=2a=9=k+ZG46yqKOaHd9tCkJVm4QRxGmgbRzsv@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-kernel@vger.kernel.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

On 25 February 2011 14:19, Daniel Drake <dsd@laptop.org> wrote:
> /battery@0/compatible property added with value "olpc-battery" (XO-1 and XO-1.5)
> /pci/isa@f/rtc@i70/compatible property prepended with "olpc-xo1-rtc,"

That comma at the end should be dropped. I just realised that the
separator between different elements in the compatible list is a NULL
character.

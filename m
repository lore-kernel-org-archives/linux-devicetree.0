From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: Aw: Re: [PATCH v5 05/12] drm: mediatek
Date: Tue, 20 Nov 2018 11:14:06 +0100
Message-ID: <1192d203-fcd1-47b0-00bc-9d513e5ffc3e@gmail.com>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-6-matthias.bgg@kernel.org>
 <1542605939.32082.12.camel@mtksdaap41>
 <0a02edf9-78da-dde9-4b69-38c4719b711b@gmail.com>
 <1542686700.9073.15.camel@mtksdaap41> <1542686982.26483.1.camel@mtksdaap41>
 <trinity-8f0fde8e-5ef3-4272-b009-49e180c934eb-1542702383860@3c-app-gmx-bs39>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <trinity-8f0fde8e-5ef3-4272-b009-49e180c934eb-1542702383860@3c-app-gmx-bs39>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>, CK Hu <ck.hu@mediatek.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, sean.wang@kernel.org, Matthias Brugger <mbrugger@suse.com>, airlied@linux.ie, mturquette@baylibre.com, sean.wang@mediatek.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, robh+dt@kernel.org, rdunlap@infradead.org, laurent.pinchart@ideasonboard.com, p.zabel@pengutronix.de, matthias.bgg@kernel.org, ulrich.hecht+renesas@gmail.com, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 20/11/2018 09:26, Frank Wunderlich wrote:
> Hi,
> 
> i got v5-patches working on bpi-r2 (mt7623) with a Patch from Ryder.lee and 2 from Bibby Hsieh on 4.19-rc1
> 
> https://github.com/frank-w/BPI-R2-4.14/commits/4.19-hdmiv5
> 

I don't see the patches applied to this tree. Apart from that this tree has a
lot of other patches applied. It differs greatly from mainline, so nothing we
should discuss on this mailinglist.

Regards,
Matthias

> but after i tried to include them on 4.19.2, i got a strange behaviour (stretched and pink font instead of white/grey)
> 
> see here for detailed info:
> 
> http://forum.banana-pi.org/t/kernel-4-19-rc1-for-testers/6618/75
> 
> there are some patches between rc1 and final which i tried to revert, but no luck till now (cannot revert, no effect on the issue or no output). Had informed Bibby Hsieh...
> 
> is there any idea, why this happen?
> 
> regards Frank
> 

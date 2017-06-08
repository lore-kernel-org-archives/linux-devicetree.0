From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v8 14/34] ARM: dts: imx6-sabreauto: add the ADV7180 video
 decoder
Date: Thu, 8 Jun 2017 13:36:12 -0700
Message-ID: <dd5b29b7-bf92-5f03-caef-1843a9f32cd3@gmail.com>
References: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
 <1496860453-6282-15-git-send-email-steve_longerbeam@mentor.com>
 <CAJ+vNU0C0=4hUq+g1P7yTzLzFPidfauQROPOVr4WQWKNZz_xmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CAJ+vNU0C0=4hUq+g1P7yTzLzFPidfauQROPOVr4WQWKNZz_xmQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, mchehab@kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Nick Dyer <nick@shmanahar.org>, markus.heiser@darmarit.de, Philipp Zabel <p.zabel@pengutronix.de>, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, minghsiu.tsai@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>, Jean-Christophe TROTIN <jean-christophe.trotin@st.com>, Simon Horman <horms+renesas@verge.net.au>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renes>
List-Id: devicetree@vger.kernel.org



On 06/08/2017 01:25 PM, Tim Harvey wrote:
> 
> 
> Steve,
> 
> You need to remove the fim node now that you've moved this to V4L2 controls.
> 

Yep, I caught this just after sending the v8 patchset. I'll send
a v9 of this patch.

Steve

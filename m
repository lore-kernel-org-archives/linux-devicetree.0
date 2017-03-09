From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 00/10] ARM: davinci: add vpif display support
Date: Thu, 9 Mar 2017 13:05:14 +0100
Message-ID: <4b8381d2-25b5-2d46-9575-2e1182cd276c@xs4all.nl>
References: <1486485683-11427-1-git-send-email-bgolaszewski@baylibre.com>
 <77ced65d-e350-02ba-6dae-b20dcb3faa32@xs4all.nl>
 <CAMpxmJUZ3KCV2zjpPWD02rVpok_XV-fGdk8PNpN7FGt3RDbMEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMpxmJUZ3KCV2zjpPWD02rVpok_XV-fGdk8PNpN7FGt3RDbMEw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Lad Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-media <linux-media@vger.kernel.org>, Alexandre Bailon <abailon@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On 09/03/17 12:00, Bartosz Golaszewski wrote:
> 2017-03-09 11:53 GMT+01:00 Hans Verkuil <hverkuil@xs4all.nl>:
>> On 07/02/17 17:41, Bartosz Golaszewski wrote:
>>> The following series adds support for v4l2 display on da850-evm with
>>> a UI board in device tree boot mode.
>>
>> As far as I could tell from the comments this patch series will see a
>> second version, so I am marking it as 'Changes Requested' in patchwork.
>>
>> If I'm wrong, then please let me know.
>>
>> Regards,
>>
>>         Hans
>>
> 
> Hi Hans,
> 
> this series has since been split into several smaller ones and most of
> the code is already merged into Sekhar Nori's DaVinci tree.
> 
> There are two series that still need merging with the media tree[1][2].

Merged, thanks!

Regards,

	Hans

> 
> Thanks,
> Bartosz Golaszewski
> 
> [1] https://lkml.org/lkml/2017/2/28/426
> [2] https://patchwork.kernel.org/patch/9577965/
> 

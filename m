From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/4] ARM: dts: da850: add vpif video display pins
Date: Wed, 22 Feb 2017 11:29:51 +0530
Message-ID: <161cbfdd-5981-2686-db06-557e98dbe18f@ti.com>
References: <1487268932-6469-1-git-send-email-bgolaszewski@baylibre.com>
 <1487268932-6469-3-git-send-email-bgolaszewski@baylibre.com>
 <318d9f87-ad2a-c0e1-255a-097056c0f85f@ti.com>
 <CAMpxmJXjRYG5tteGNbG3gxAqeoB9Qx9bND6PHJih7dyU+ZuD4w@mail.gmail.com>
 <e6988d47-00e1-e4b6-e343-1f358faa5556@ti.com>
 <CAMpxmJX9VU20+Sq1_B3Umm1VDgyLizcg7yb9pAx+a72+grkqdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMpxmJX9VU20+Sq1_B3Umm1VDgyLizcg7yb9pAx+a72+grkqdg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Patrick Titiano <ptitiano@baylibre.com>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 21 February 2017 02:53 PM, Bartosz Golaszewski wrote:
> 2017-02-21 5:49 GMT+01:00 Sekhar Nori <nsekhar@ti.com>:
>> On Monday 20 February 2017 09:12 PM, Bartosz Golaszewski wrote:
>>> 2017-02-20 11:29 GMT+01:00 Sekhar Nori <nsekhar@ti.com>:
>>>> On Thursday 16 February 2017 11:45 PM, Bartosz Golaszewski wrote:
>>>>> Add a new pinctrl sub-node for vpif display pins. Move VP_CLKIN3 and
>>>>> VP_CLKIN2 to the display node where they actually belong (vide section
>>>>> 35.2.2 of the da850 datasheet).
>>>>
>>>> You mean 36.2.2. Also, its in the technical reference manual (TRM). The
>>>> datahseet is another document.
>>>>
>>>
>>> I'm looking at the revision from September 2016 and it's 35.2.2: VPIF
>>> -> Architecture -> signal descriptions.
>>
>> Is this the document ?
>>
>> http://www.ti.com/lit/ug/spruh77c/spruh77c.pdf
>>
>> In this VPIF is chapter 36.
>>
>> Thanks,
>> Sekhar
>>
> 
> -ETOOMANYPDFS I was looking at spruh82c.pdf.
> 
> You're right of course.

I see. I guess its better to call it OMAP-L138 technical reference
manual (instead of da850) and also provide a link.

Thanks,
Sekhar

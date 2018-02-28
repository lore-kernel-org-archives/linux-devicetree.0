From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/3] mailbox: sunxi-msgbox: Add a new mailbox driver
Date: Wed, 28 Feb 2018 23:44:18 +0530
Message-ID: <CABb+yY3nfVxoA9wy1ym4mtCTKCZtJjepUTr7OP1uUPmzOEzniA@mail.gmail.com>
References: <20180228022714.30068-1-samuel@sholland.org> <20180228022714.30068-4-samuel@sholland.org>
 <CABb+yY2uueAK9kzXzU9DT2a4NtV3kK2dc_wtyFWTBn8=Z6Vi7Q@mail.gmail.com> <d9e14058-6ffb-e54a-1565-f228342ee1f0@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9e14058-6ffb-e54a-1565-f228342ee1f0@sholland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ", linux-arm-kernel"@lists.infradead.org, ", linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream" <linux-mediatek@lists.infradead.org>srv_heupstream <linux-arm-kernel@lists.infradead.org>, Devicetree List <devicetree@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 28, 2018 at 11:21 PM, Samuel Holland <samuel@sholland.org> wrote:
> Hi,
>
> On 02/28/18 03:16, Jassi Brar wrote:
>> On Wed, Feb 28, 2018 at 7:57 AM, Samuel Holland <samuel@sholland.org> wrote:
>> ....
>>
>>> +/*
>>> + * The message box hardware provides 8 unidirectional channels. As the mailbox
>>> + * framework expects them to be bidirectional
>>>
>> That is incorrect. Mailbox framework does not require a channel to be
>> TX and RX capable.
>
> Sorry, it would be more accurate to say that the intended mailbox _client_
> expects the channels to be bidirectional.
>
Mailbox clients are very mailbox provider specific. Your client driver
is unlikely to be reuseable over another controller+remote combo.
Your client has to know already what a physical channel can do (RX, TX
or RXTX). There is no api to provide that info.

thanks

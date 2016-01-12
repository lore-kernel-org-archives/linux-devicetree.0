From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] devicetree: mxsfb: add reset-active property
Date: Mon, 11 Jan 2016 18:01:01 -0600
Message-ID: <CAL_Jsq++UkEVJDcWVrDZ9pdkz++uU8uD_skYCAmGWv412RbnVA@mail.gmail.com>
References: <1450200297-19243-1-git-send-email-mans@mansr.com>
 <20151220033823.GE9883@rob-hp-laptop> <yw1xy4bww598.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1xy4bww598.fsf@unicorn.mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 11, 2016 at 8:38 AM, M=C3=A5ns Rullg=C3=A5rd <mans@mansr.co=
m> wrote:
> Rob Herring <robh@kernel.org> writes:
>
>> On Tue, Dec 15, 2015 at 05:24:56PM +0000, Mans Rullgard wrote:
>>> Some boards connect the LCD_RESET pin to a reset input on the
>>> display panel.  On these boards, this pin must be set to the
>>> proper level for the display to function.
>>>
>>> This adds an optional "reset-active" property to the "display"
>>> subnode such that devicetrees can specify the desired polarity
>>> of the LCD_RESET pin.
>>>
>>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> What happened to this patch?

If I acked it, then I'm expecting the platform or subsystem maintainer
to pick up the series. I don't have patch #2 either, so I'm definitely
not picking up the series.

Rob

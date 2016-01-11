From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 1/2] devicetree: mxsfb: add reset-active property
Date: Mon, 11 Jan 2016 14:38:27 +0000
Message-ID: <yw1xy4bww598.fsf@unicorn.mansr.com>
References: <1450200297-19243-1-git-send-email-mans@mansr.com>
	<20151220033823.GE9883@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151220033823.GE9883@rob-hp-laptop> (Rob Herring's message of
	"Sat, 19 Dec 2015 21:38:23 -0600")
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, marex@denx.de
List-Id: devicetree@vger.kernel.org

Rob Herring <robh@kernel.org> writes:

> On Tue, Dec 15, 2015 at 05:24:56PM +0000, Mans Rullgard wrote:
>> Some boards connect the LCD_RESET pin to a reset input on the
>> display panel.  On these boards, this pin must be set to the
>> proper level for the display to function.
>>=20
>> This adds an optional "reset-active" property to the "display"
>> subnode such that devicetrees can specify the desired polarity
>> of the LCD_RESET pin.
>>=20
>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>
> Acked-by: Rob Herring <robh@kernel.org>

What happened to this patch?

--=20
M=E5ns Rullg=E5rd

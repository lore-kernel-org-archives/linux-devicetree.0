From: Olliver Schinagl <o.schinagl@ultimaker.com>
Subject: Re: [PATCH 0/5] Add eeprom to the Olimex series of boards
Date: Wed, 09 Sep 2015 16:26:10 +0200
Message-ID: <55F04182.2000707@ultimaker.com>
References: <1441790715-11957-1-git-send-email-o.schinagl@ultimaker.com> <20150909140559.GD9885@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150909140559.GD9885@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 09-09-15 16:05, Maxime Ripard wrote:
> On Wed, Sep 09, 2015 at 11:25:10AM +0200, Olliver Schinagl wrote:
>> Some of the olimex series of boards feature a permanently connected =
eeprom on
>> i2c-1. This patch series adds them on all the boards that have them =
according
>> to the spec-sheets.
>>
>> I explicitly added my personal --Tested-by to boards I actually test=
ed.
> Testing your changes is the strict minimum before testing your
> patches. Just like running checkpatch on them, which you clearly
> failed to do, otherwise you would have seen that this is not the righ=
t
> syntax. Drop the tested-by, fix your SoB.
Actually, I did run check-patch and it complained about the format, but=
=20
it was the same as when outputted with a git -s. I obviously missed=20
something there! So I double check that. I will resubmit without a=20
tested-by for the boards I did test it on.
>
>> There are two boards, that according to the sheets have them as well
>> and physically inspecting the boards shows them clearly, I did not
>> actually test them on those the boards that are missing the
>> --Tested-by.
> Then don't send those patches.
I put them out there so someone could pick up on that with the least=20
amount of effort. I will drop them
>
> Maxime
>

--=20
Met vriendelijke groeten, Kind regards, =E4=B8=8E=E4=BA=B2=E5=88=87=E7=9A=
=84=E9=97=AE=E5=80=99

Olliver Schinagl
Research & Development
Ultimaker B.V.

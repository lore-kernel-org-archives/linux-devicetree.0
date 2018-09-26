From: Craig <ctatlor97@gmail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: Add sdm660 pinctrl driver
Date: Wed, 26 Sep 2018 17:30:43 +0100
Message-ID: <43F103C6-7ADF-4D4C-A930-376D66F538F0@gmail.com>
References: <20180812142413.20856-1-ctatlor97@gmail.com> <20180925173801.3835-1-ctatlor97@gmail.com> <CACRpkda4SuPVz8Awg6OhhanmZKEs4URw3WBMv0Fa8iJa2MD-KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda4SuPVz8Awg6OhhanmZKEs4URw3WBMv0Fa8iJa2MD-KA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, neeraju@codeaurora.org, vabbar@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hey,
You seem to have missed the bindings, it might be an idea to drop and reap=
ply with the new ones I just sent off when they get a review=2E

On 26 September 2018 07:57:41 BST, Linus Walleij <linus=2Ewalleij@linaro=
=2Eorg> wrote:
>On Tue, Sep 25, 2018 at 7:38 PM Craig Tatlor <ctatlor97@gmail=2Ecom>
>wrote:
>
>> From: Neeraj Upadhyay <neeraju@codeaurora=2Eorg>
>>
>> Add initial pinctrl driver to support pin configuration with
>> pinctrl framework for sdm660=2E
>> Based off CAF implementation=2E
>>
>> Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora=2Eorg>
>> Co-Developed-by: Venkatesh Yadav Abbarapu <vabbar@codeaurora=2Eorg>
>> Signed-off-by: Venkatesh Yadav Abbarapu <vabbar@codeaurora=2Eorg>
>> [craig: minor updates for upstreaming, updated tile handling]
>> Signed-off-by: Craig Tatlor <ctatlor97@gmail=2Ecom>
>
>Co-Developed-by? That was innovative=2E
>
>Anyways, since there is also a signoff all is fine=2E
>
>Patch applied with Bj=C3=B6rn's ACK=2E
>
>Yours,
>Linus Walleij

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

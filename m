From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v3 0/3] Qualcomm Resource Power Manager driver
Date: Tue, 17 Jun 2014 10:15:10 -0700
Message-ID: <CAJAp7OhHr4Cgcp9pvQ3=MAie_zSnFJxG28Vf37qJ98BK7P1jaQ@mail.gmail.com>
References: <1402944372-31901-1-git-send-email-bjorn.andersson@sonymobile.com>
	<7hvbrzbh1u.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hvbrzbh1u.fsf@paris.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 17, 2014 at 10:07 AM, Kevin Hilman <khilman@linaro.org> wrote:
> +Paul Walmsley
>
> Bjorn Andersson <bjorn.andersson@sonymobile.com> writes:
>
>> This series adds a regulator driver for the Resource Power Manager found in
>> Qualcomm 8660, 8960 and 8064 based devices.
>>
>> The RPM driver exposes resources to its child devices, that can be accessed to
>> implement drivers for the regulators, clocks and bus frequency control that's
>> owned by the RPM in these devices.
>>
>> Changes since v2:
>>   - Fix copy-paste error in dt binding
>>   - Correct incomplete move from mfd to soc
>>   - Correct const mistake in regulator driver
>>
>> Changes since v1:
>>   - Moved rpm driver to drivers/soc
>
> I'm not sure I follow the motivation for having this under drivers/soc?
>
Hi Kevin,

I've made the argument that to me this is conceptually a black box
handling regulators, clocks and other stuff; hence similar to a PMIC,
which would fit nicely into drivers/mfd.

I still think this is the case and now that I look back I didn't get
any pushback from Lee Jones so maybe the move was premature?

Regards,
Bjorn

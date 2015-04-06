From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 0/5] Refactor Qualcomm RPM regulator to single platform_device
Date: Mon, 6 Apr 2015 10:11:02 -0700
Message-ID: <CAJAp7Oi5NE2H67dUA1jK6U4itZxcMLojpK3qO-6Q8kDv3Vbbfg@mail.gmail.com>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
	<551DBC05.2090301@codeaurora.org>
	<20150402222630.GV6023@sirena.org.uk>
	<551DC94C.3060001@codeaurora.org>
	<20150406165154.GP6023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150406165154.GP6023@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 6, 2015 at 9:51 AM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Apr 02, 2015 at 03:57:16PM -0700, Stephen Boyd wrote:
>> On 04/02/15 15:26, Mark Brown wrote:
>
>> > Guenther sent a patch fixing that a while back.
>
>> This one?
>
> Yes.
>
>>     regulator: Ensure unique regulator debugfs directory names
>
>> Ok. Seems to be only in next. I'm not sure it will work though because
>> in this case the parent device is the same for both regulators on
>> different PMICs that the RPM is controlling. I could be wrong though
>> because I haven't tested it.
>
> I'd say that if the driver is doing this then the driver is buggy - the
> user should be able to distinguish between two regulators appearing for
> the same device.  Either the RPM should create dummy devices for the two
> PMICs or something should insert the PMIC name into the regulator name
> somewhere along the line (perhaps in the static data).

Sorry, I spoke before I had coffee...

The RPM will instantiate one regulator device per pmic and parent will
hence differ between the various regulator instances.
So with Guenter's patch this does indeed work.

Regards,
Bjorn

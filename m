From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ARM: DT: apq8064: Add USB OTG support
Date: Mon, 29 Sep 2014 12:27:58 +0100
Message-ID: <5429423E.8030908@linaro.org>
References: <1411982044-7873-1-git-send-email-srinivas.kandagatla@linaro.org> <1411982127-8048-1-git-send-email-srinivas.kandagatla@linaro.org> <542933E1.8010809@smartplayin.com> <20140929105329.GA2432@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140929105329.GA2432@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Kiran Padwal <kiran.padwal@smartplayin.com>
Cc: Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "bjorn.andersson@sonymobile.com" <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org



On 29/09/14 11:53, Mark Rutland wrote:
>> >Its canonical value is "okay" (although in practice anything
>> >other than "disabled" should work).
> That's not quite true, there are other "bad" values like "fail" and
> "fail-sss" documented by ePAPR. In Linux, of_device_is_available errs on
> the side of caution and checks for either "okay" or "ok", failing
> otherwise
>
> Regardless, please use the canonical "okay".
I will fix this in v2.


--srini

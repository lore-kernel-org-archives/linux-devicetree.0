From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v3 2/6] pinctrl: Introduce pinctrl driver for Qualcomm
 SSBI PMIC's
Date: Wed, 20 Aug 2014 15:13:31 -0700
Message-ID: <CAJAp7Ojt=PCCDhoR+nhEtQbPHzsp+=uTLx-XMM7-W78bfnQytA@mail.gmail.com>
References: <1407771634-14946-1-git-send-email-iivanov@mm-sol.com>
	<1407771634-14946-3-git-send-email-iivanov@mm-sol.com>
	<53F456F3.3000309@linaro.org>
	<20140820212843.GB16274@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140820212843.GB16274@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 20, 2014 at 2:28 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Wed 20 Aug 01:06 PDT 2014, Srinivas Kandagatla wrote:
>> 2> Looking back at v3.4 kernel, for gpio modes, BIT(0) of bank 0 is set
>> to enable gpio mode. without this bit driver does not work for output pins.
>>
>
> Thanks, I missed that.
>
> Unfortunately, setting that bit results in input not working - the interrupt
> bits are never set for gpios that have that bit set. I'm trying to figure out
> why this is the case before sending out the new version...

With help from Andy Gross this is now corrected as well, turned out
that BIT(0) in bank0 controls if the "direction" is considered. As I
was tricked by the multiple levels of indirection in the codeaurora
version I got these wrong.

Will send out an updated version shortly.

Regards,
Bjorn

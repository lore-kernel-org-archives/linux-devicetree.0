From: Loc Ho <lho@apm.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: Update X-Gene standby GPIO controller
 DTS entries
Date: Fri, 19 Feb 2016 09:44:32 -0800
Message-ID: <CAPw-ZTmAe64XbXZ4OWJOec7YMEQcgf7ZrfUsZWG6Yjc1ON0K+w@mail.gmail.com>
References: <1455714909-3027-1-git-send-email-qnguyen@apm.com>
	<1455714909-3027-4-git-send-email-qnguyen@apm.com>
	<CACRpkdav6UXn41UnWvWR4zjYN=QtkNJknihr+YnHu3rXbkPBBw@mail.gmail.com>
	<CAFopSPR133CT5t2ck2_F3Zzh8gWosLpXFpYi-5VBBhVScOkvjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAFopSPR133CT5t2ck2_F3Zzh8gWosLpXFpYi-5VBBhVScOkvjA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Quan Nguyen <qnguyen@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, Iyappan Subramanian <isubramanian@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

Hi Quan,

On Fri, Feb 19, 2016 at 5:47 AM, Quan Nguyen <qnguyen@apm.com> wrote:
> On Fri, Feb 19, 2016 at 4:14 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, Feb 17, 2016 at 2:15 PM, Quan Nguyen <qnguyen@apm.com> wrote:
>>
>>> Update APM X-Gene standby GPIO controller DTS entries to enable it
>>> as interrupt controller.
>>>
>>> Signed-off-by: Y Vo <yvo@apm.com>
>>> Signed-off-by: Quan Nguyen <qnguyen@apm.com>
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Please funnel this patch through the ARM SoC tree with all other
>> DTS files.
>
> Let me do it and resend.

Duc will pull  this into xgene-next GIT for Olof to pull.

-Loc

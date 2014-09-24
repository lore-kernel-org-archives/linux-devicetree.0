From: Chris Zhong <zyw@rock-chips.com>
Subject: Re: [PATCH v6 1/2] regulator: st-pwm: get voltage and duty table
 from dts
Date: Wed, 24 Sep 2014 09:47:40 +0800
Message-ID: <542222BC.4060203@rock-chips.com>
References: <1411487622-10881-1-git-send-email-zyw@rock-chips.com>	<1411487622-10881-2-git-send-email-zyw@rock-chips.com> <CAD=FV=Vhejf4JoEPUGwmBJdO+zfHgE5hgoT6V1DGtva7r_1Etg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=Vhejf4JoEPUGwmBJdO+zfHgE5hgoT6V1DGtva7r_1Etg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On 09/24/2014 07:43 AM, Doug Anderson wrote:
> Chris,
>
> On Tue, Sep 23, 2014 at 8:53 AM, Chris Zhong <zyw@rock-chips.com> wrote:
>> Get voltage & duty table from device tree might be better, other platforms can also use this
>> driver without any modify.
>>
>> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
> I finally managed to get everything setup and I've now tested this
> myself on an rk3288-based board.
>
> Tested-by: Doug Anderson <dianders@chromium.org>
>
> I'd imagine the next step is for Lee to comment on the patch and when
> he's happy with it Mark Brown will land it?
>
>
> One thing that's still a bit odd (though no different than the
> behavior of the driver from before you touched it, so it shouldn't
> block landing IMHO) is that at boot time this regulator will report
> that it's at the highest voltage but the voltage won't actually change
> until the first client sets the voltage.
Yes, I knew this problem, since the default of duty cycle is 0, not a 
true value.
If we can get duty from pwm, this regulator will report a correct voltage.
>
> Also: if anyone reading is interested in this patch, it's possible
> you'll also be interested in my patch at
> <https://patchwork.kernel.org/patch/4960731/> to make sue that your
> voltage doesn't twiddle around at probe time.
>
>
> -Doug
>
>
>

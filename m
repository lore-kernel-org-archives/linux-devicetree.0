From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/5] bindings: regulator: added support for suspend states
Date: Tue, 9 Jan 2018 14:08:45 +0800
Message-ID: <CAG2=9p9D1QHErF22A+aA9OwvnBiuxAOV27iYYCzC_5ZpZzF9eQ@mail.gmail.com>
References: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
 <1515050568-23876-2-git-send-email-zhang.chunyan@linaro.org>
 <20180105185328.zmt33idv2cqled62@rob-hp-laptop> <20180105191837.GI9076@sirena.org.uk>
 <CAG2=9p-ec1oVe-+O0TGYFF-E5dGrP3FoRZXb1sCyjNScVvGNQg@mail.gmail.com> <20180108123533.GE11698@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180108123533.GE11698-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 January 2018 at 20:35, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Jan 08, 2018 at 02:36:36PM +0800, Chunyan Zhang wrote:
>> On 6 January 2018 at 03:18, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> > No, it means that the software has permission to use those changes to
>> > those registers - we only want to be changing things if the user has
>> > permission to change them since some systems will have specific
>> > constraints, we don't know if it's safe without being explicitly told.
>> > You're right that we could infer this from a range being provided
>> > though, let's do that.
>
>> Ok, so we don't need this property IIUC, and instead we just need to check
>> if the regulator-suspend-min-microvolt and regulator-suspend-max-microvolt
>> are set to the same value, right?
>
> Yes.

Then, do we need a flag as well to give permission to change
'suspend_state->enabled'?

Or we just do keeping the regulator device enabled if any consumer of
it has set voltage for suspend mode with non-zero value, and do
switching it off if all consumers of it have set voltage for suspend
with zero.

+static int _regulator_set_suspend_voltage(struct regulator *regulator,
+                                         int min_uV, int max_uV,
+                                         suspend_state_t state)
+{
+       int ret;
+       struct regulator_dev *rdev = regulator->rdev;
+
+       /*
+        * We assume users want to switch off the regulator device for
+        * suspend state when setting min_uV and max_uV all with zero.
+        */
+       if (min_uV == 0 && max_uV == 0) {
+               regulator->voltage[state].min_uV = 0;
+               regulator->voltage[state].max_uV = 0;
+               return regulator_suspend_disable(rdev, state);
+       }
+
+       ret = regulator_suspend_enable(rdev, state);
+       if (ret < 0)
+               return ret;
+
+       return regulator_set_voltage_unlocked(regulator, min_uV, max_uV, state);
+}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

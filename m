From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/5] bindings: regulator: added support for suspend states
Date: Mon, 8 Jan 2018 14:36:36 +0800
Message-ID: <CAG2=9p-ec1oVe-+O0TGYFF-E5dGrP3FoRZXb1sCyjNScVvGNQg@mail.gmail.com>
References: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
 <1515050568-23876-2-git-send-email-zhang.chunyan@linaro.org>
 <20180105185328.zmt33idv2cqled62@rob-hp-laptop> <20180105191837.GI9076@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105191837.GI9076-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6 January 2018 at 03:18, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Jan 05, 2018 at 12:53:28PM -0600, Rob Herring wrote:
>> On Thu, Jan 04, 2018 at 03:22:44PM +0800, Chunyan Zhang wrote:
>
>> > +   - regulator-suspend-microvolt: the default voltage which regulator
>> > +     would be set in suspend. The voltage for suspend also can be
>> > +     adjusted among {regulator-suspend-min-microvolt,
>> > +     regulator-suspend-max-microvolt} by calling
>> > +     regulator_set_suspend_voltage(). This property is not deprecated,
>
>> You mean "is deprecated", right?

Ah, right, will correct this.

>
> I suspect "is now" but yeah.
>
>> > +   - regulator-changeable-in-suspend: whether the default voltage and
>> > +     the regulator on/off in suspend can be changed in runtime.
>
>> Is this not implied by having the constraints? Or the driver should know
>> this. The simply means you have some 2nd bank of registers for settings
>> while in suspend mode, right?
>
> No, it means that the software has permission to use those changes to
> those registers - we only want to be changing things if the user has
> permission to change them since some systems will have specific
> constraints, we don't know if it's safe without being explicitly told.
> You're right that we could infer this from a range being provided
> though, let's do that.

Ok, so we don't need this property IIUC, and instead we just need to check
if the regulator-suspend-min-microvolt and regulator-suspend-max-microvolt
are set to the same value, right?

Thanks,
Chunyan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

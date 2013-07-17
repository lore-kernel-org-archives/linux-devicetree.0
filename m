From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v4] Input: sysrq - DT binding for key sequence
Date: Tue, 16 Jul 2013 21:17:51 -0500
Message-ID: <CAL_JsqJQguAy8-nzQZS2obu6SG=yrfJvEn2y5_i3k7qZbM-_Vg@mail.gmail.com>
References: <1373902598-10062-1-git-send-email-mathieu.poirier@linaro.org>
	<51E4B35D.8020000@gmail.com>
	<CANLsYkzgHqnuDq46JEJH713jrnD8rAAG_2wLbKJCAOGLpw+e4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CANLsYkzgHqnuDq46JEJH713jrnD8rAAG_2wLbKJCAOGLpw+e4g@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, kernel-team@android.com, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, John Stultz <john.stultz@linaro.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 16, 2013 at 5:24 PM, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
>
>
> On 15 July 2013 20:43, Rob Herring <robherring2@gmail.com> wrote:
>>
>> On 07/15/2013 10:36 AM, mathieu.poirier@linaro.org wrote:
>> > From: "Mathieu J. Poirier" <mathieu.poirier@linaro.org>
>> >

[snip]

>> > +     prop = of_find_property(np, "keyset", NULL);
>> > +     if (!prop || !prop->value) {
>> > +             pr_err("Invalid input keyset");
>> > +             goto out;
>> > +     }
>> > +
>> > +     count = prop->length / sizeof(u32);
>> > +     val = prop->value;
>>
>> None of the existing helpers to retrieve property arrays doesn't work
>> here?
>
>
> The problem here is that we never know how long the sequence will be.  As
> such the 'of_property_read_uXY_array' functions won't work.  Or maybe you're
> referring to another set of helpers... If so, please clarify.

What about of_property_for_each_u32? Or we should make
of_property_read_uXY_array work with arrays that can be less than some
max size.

Rob

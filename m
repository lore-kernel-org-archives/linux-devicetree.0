From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v3 04/14] drm/sun4i: tcon: Add support
 for demuxing TCON output on A31
Date: Sat, 30 Sep 2017 13:58:25 +0800
Message-ID: <CAGb2v66epS9OLAQthYOrn7B48E80jsfy9dhyLPHyo4NmAOTCbg@mail.gmail.com>
References: <20170929082306.16193-1-wens@csie.org> <20170929082306.16193-5-wens@csie.org>
 <20170929102006.2wz7wrkpplxwynoh@flea> <CAGb2v65VhtEckRCXi4X5AjmC-5CSHavATu8fKyEHOivmYqZkww@mail.gmail.com>
 <CAGRGNgUmo6ZztajhG=uZrXGsC9pxySswxLd4P-gk6xdknLX-NQ@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBG7FXTHAKGQE7LDBS5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGRGNgUmo6ZztajhG=uZrXGsC9pxySswxLd4P-gk6xdknLX-NQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 30, 2017 at 1:35 PM, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Chen-Yu,
>
> On Fri, Sep 29, 2017 at 8:22 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>> On Fri, Sep 29, 2017 at 6:20 PM, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>> On Fri, Sep 29, 2017 at 08:22:56AM +0000, Chen-Yu Tsai wrote:
>>>> On systems with 2 TCONs such as the A31, it is possible to demux the
>>>> output of the TCONs to one encoder.
>>>>
>>>> Add support for this for the A31.
>>>>
>>>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>>> ---
>>>>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 38 ++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 38 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>>> index 7bf51abaee97..c949309d4285 100644
>>>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>>> @@ -112,6 +112,21 @@ void sun4i_tcon_enable_vblank(struct sun4i_tcon *tcon, bool enable)
>>>>  }
>>>>  EXPORT_SYMBOL(sun4i_tcon_enable_vblank);
>>>>
>>>> +static struct sun4i_tcon *sun4i_get_first_tcon(struct drm_device *drm)
>>>
>>> Would that make sense to make it a bit more generic, and pass the id
>>> to look for as an argument?
>>
>> The reason to look for TCON0 explicitly is to access the muxing registers, which
>> are only available in TCON0. Other than that, there's nothing else
>> shared between
>> the two TCONs. So there's no particular reason to look for TCON1 explicitly.
>
> In that case: in the bizarre case where we're trying to use this mux
> type and there is no TCON0, shouldn't we fail?

It gives out a big warning, indicating something is wrong. If TCON0 is not found
it is most likely your device tree is broken. There's nothing more the
driver can do.
Are you suggesting to return NULL in this case, and also do error
handling in the
callers?

> (Also, the code doesn't make sense if we have some TCON1 and TCON2 in
> that order as it'll return TCON2)

I'm guessing you want it to return NULL.

ChenYu

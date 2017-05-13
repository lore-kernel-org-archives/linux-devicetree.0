From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq4019: add most other IPQ4019 pin functions and groups
Date: Sat, 13 May 2017 18:03:24 +0200
Message-ID: <6106539.ylfJifP948@debian64>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com> <20170510112712.14744-1-chunkeey@googlemail.com> <20170513001037.tpqdrjh3r6aciskx@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170513001037.tpqdrjh3r6aciskx@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ram Chandra Jangir <rjangir-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, May 12, 2017 7:10:37 PM CEST Rob Herring wrote:
> On Wed, May 10, 2017 at 01:27:11PM +0200, Christian Lamparter wrote:
> > This patch adds the remaining pin functions and mux groups.
> > It also fixes a typo in the existing binding document.
> > 
> > Cc: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Ram Chandra Jangir <rjangir-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> > Signed-off-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> > ---
> > Note: These definitions were present in the original submission
> > <https://patchwork.kernel.org/patch/7630711/>
> > 
> > The DT patch was acked by Rob Herring back then. However,
> > I'm not sure if this is still valid or not. @Rob, can you
> > please comment?
> 
> Am I supposed to ack patch 1/2 or patch 1/2...? The first one has the 
> preferred subject prefix.

This was my fault. I decided to reword the patch and changed 
the subject among a few other things. So, this patch was sent
to the ML twice.

Bjorn commented that he has some comments.
<http://www.spinics.net/lists/devicetree/msg176168.html>

Unfortunately, he didn't say what exactly needs to be changed.
So, I'm not really sure how to proceed.

@Bjorn: can you please tell what you would like to see changed?
I see what I can do about it. I do have access two a few IPQ4019/8
and can ask a few people to run tests.

@Rob:

I noticed that: 

qcom,apq8064-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
qcom,ipq4019-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
qcom,ipq8064-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
qcom,msm8660-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
qcom,msm8974-pinctrl.txt: pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength.

all have the same "bias-pull,up". I think I'll just do
a separate patch for this to stop it from spreading :D.

Thanks,
Christian

> > 
> > (Link to Matthew McLintock's v3 that was merged)
> > <https://patchwork.kernel.org/patch/7662241/>
> > ---
> >  .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      | 36 ++++++++++++++++++++--
> >  1 file changed, 34 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

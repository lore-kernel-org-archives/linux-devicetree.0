From: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v2 1/5] media: venus: add a routine to reset ARM9
Date: Wed, 6 Jun 2018 10:34:45 +0900
Message-ID: <CAPBb6MWSOFQT0ZuV_MJhjPzTYUhoPgRXUhT_dawTqDCtVXEmBA@mail.gmail.com>
References: <1527884768-22392-1-git-send-email-vgarodia@codeaurora.org>
 <1527884768-22392-2-git-send-email-vgarodia@codeaurora.org>
 <894ab678-bc1d-da04-b552-d53301bd3980@linaro.org> <20180605105716.GT16230@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605105716.GT16230@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, vgarodia@codeaurora.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, Linux Media Mailing List <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 5, 2018 at 7:57 PM Vinod <vkoul@kernel.org> wrote:
>
> On 02-06-18, 01:15, Stanimir Varbanov wrote:
> > Hi Vikash,
> >
> > On  1.06.2018 23:26, Vikash Garodia wrote:
> > > Add a new routine to reset the ARM9 and brings it
> > > out of reset. This is in preparation to add PIL
> > > functionality in venus driver.
> >
> > please squash this patch with 4/5. I don't see a reason to add a function
> > which is not used. Shouldn't this produce gcc warnings?
>
> Yes this would but in a multi patch series that is okay as subsequent
> patches would use that and end result in no warning.

Except during bisect.

>
> Splitting logically is good and typical practice in kernel to add the
> routine followed by usages..

Is it in this case though? If this code was shared across multiple
users I could understand but this function is only used locally (and
only in one place IIUC). Also the patch is not so big that the code
would become confusing if this was squashed into 4/5. I don't see any
reason to keep this separate.

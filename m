From: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v6 0/4] Venus updates - PIL
Date: Fri, 24 Aug 2018 16:39:25 +0900
Message-ID: <CAPBb6MW8rxj7SQLqKV07CQjjJth7b6iBT9bH8XYd3chtiXcKnw@mail.gmail.com>
References: <1535034528-11590-1-git-send-email-vgarodia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535034528-11590-1-git-send-email-vgarodia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vgarodia@codeaurora.org
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, robh@kernel.org, mark.rutland@arm.com, Andy Gross <andy.gross@linaro.org>, Arnd Bergmann <arnd@arndb.de>, bjorn.andersson@linaro.org, Linux Media Mailing List <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vikash,

On Thu, Aug 23, 2018 at 11:29 PM Vikash Garodia <vgarodia@codeaurora.org> wrote:
>
> Hello,
>
> Here is v6 with following comments addressed:
>
> * 4/4 from earlier series was dropped as .probe was not needed.
> * indentation as per checkpatch --strict option.
> * tested on Venus v4 hardware.

I have tested this series and it seems to be working fine! Thanks for
pushing it forward!

I have made a few comments inline, but some may be difficult to apply
without reorganizing the series a bit. If my explanations are not
clear, I can take care of submitting the next spin of this series if
you wish.
